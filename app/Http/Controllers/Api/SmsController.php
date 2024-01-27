<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\CustomerOtp;
use App\Models\SmsTemplate;
use App\Models\Message;
use Exception;
use Validator;
use Carbon\Carbon;
use App\User;

class SmsController extends BaseController
{

    public function getOtp(Request $request)
    {
        //Create customerOtp object to call functions
        $customerOtp = new CustomerOtp();
        // Function call to generate OTP
        $otpNumber = $customerOtp->generateOtp();
        //Initialize mobile number
        $mobileNumber = 0;
        $validator = Validator::make($request->all(), [
            'mobile_number' => 'required',
            'platform' => 'required',
            'transactionType' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendError(parent::VALIDATION_ERROR, $validator->errors());
        }

        try {
            $smsTemplatesValue = parent::SMS_MSG_TEMPLATES;
            $transActionType = $request->transactionType;
            // 201 => "APP_REGISTER_OTP", 202 => "APP_LOGIN_OTP", 203 => "APP_RESET_PASSWORD", 204 => "APP_FORGET_PASSWORD"
            if ($request->transactionType == "201") {
                $customer = User::where('mobile_number', $request->mobile_number)->first();
                if (isset($customer)) {
                    return $this->sendError(
                        "Customer is already exists.",
                        [],
                        404,
                        []
                    );
                }
            } else {
                $customer = User::where('mobile_number', $request->mobile_number)->first();
                if (!isset($customer)) {
                    return $this->sendError(
                        "Customer does not exists.",
                        [],
                        404,
                        []
                    );
                }  
            }

            $smsTemplateName = "";
            foreach ($smsTemplatesValue as $key => $value) {
                if ($transActionType == $key) {
                    $smsTemplateName = $value;
                    break;
                }
            }

            $requestedParams['otp'] = $otpNumber;
            $smsValidityTime = config('services.miscellaneous.SMS_VALIDITY_TIME_MINUTES');
            $smsgTemplates = new SmsTemplate($this->pdo, $this->redis);
            $requestedParams["template_name"] = $smsTemplateName;
            $smsgTemplatesData = $smsgTemplates->getSmsTemplates($requestedParams);

            $sendMessage = 0;
            if ($smsgTemplatesData) {
                $data = [
                    "symbol" => " " . config('services.miscellaneous.SMS_SYMBOL'),
                    "OTP" => $otpNumber,
                    "code" => config('services.miscellaneous.SMS_CODE')
                ];
                $jsonData = json_encode($data);
                $requestedParams['template_id'] = $smsgTemplatesData['flow_id'];
                $message = new Message($this->pdo, $this->redis);
                //Call function to send message
                $sendMessage = $message->sendOtp($request->mobile_number, $requestedParams, $jsonData);
                // $sendMessage = $message->sendMessage($jsonData);
            }

            $requestedParams['from_no'] = config('services.miscellaneous.from_no');
            $requestedParams['SMS_VALIDITY_TIME_MINUTES'] = $smsValidityTime;

            if ($sendMessage) {
                $params = $request->all();
                $params["mobile_number"] = $request->mobile_number;
                $params["otp"] = $otpNumber;
                $params["sms_delivered"] = 1;
                $params["error_message"] = "";
                $params["otp_used"] = 0;
                $params["platform_generated_on"] = $request->platform;
                $params["otp_generated_for"] = $request->transactionType;
                $params["created_at"] =  now();
                $responseDetails = CustomerOtp::create($params);
                $responseDetails = array("id" => $responseDetails->id, "Otp" => $responseDetails->otp);
                // $lastInsertId = $customerOtp->save($params);
                $response = $this->sendResponse($responseDetails, 'OTP sent successfully.');
            } else {
                $response = $this->sendResponse([], 'Failed to send OTP.');
            }
        } catch (Exception $e) {
            if ($request->mobile_number != 0) {
                $params = $request->all();
                $params["mobile_number"] = $request->mobile_number;
                $params["otp"] = $otpNumber;
                $params["sms_delivered"] = 0;
                $params["error_message"] = $e->getMessage();
                $params["otp_used"] = 0;
                $params["platform_generated_on"] = $request->platform;
                $params["otp_generated_for"] = $request->transactionType;
                $params["created_at"] = now();
                $responseDetails = CustomerOtp::create($params);
                $responseDetails = array("id" => $responseDetails->id, "Otp" => $responseDetails->otp);
            }
            $response = $this->sendResponse([], $e->getMessage());
        }
        return $response;
        // $this->response->setContent(json_encode($response)); // send response in json format
    }

    function verifyOtp(Request $request)
    {
        try {
            $ismobilePresent = 0;
            $mobileNumber = 0;

            $validator = Validator::make($request->all(), [
                'id' => 'required',
                'otp' => 'required',
                'transactionType' => 'required',
                'platform' => 'required',
                'mobile_number' => 'required',
            ]);
            if ($validator->fails()) {
                return $this->sendError(parent::VALIDATION_ERROR, $validator->errors());
            }

            if (isset($request->mobile_number)) {
                $ismobilePresent = 1;
                $mobileNumber = $request->mobile_number;
            }
            $smsValidityTime = getenv('SMS_VALIDITY_TIME_MINUTES');
            // 201 => "APP_REGISTER_OTP", 202 => "APP_LOGIN_OTP", 203 => "APP_RESET_PASSWORD", 204 => "APP_FORGET_PASSWORD"
            if ($request->transactionType == "201") {
                $customer = User::where('mobile_number', $request->mobile_number)->first();
                if (isset($customer)) {
                    return $this->sendError(
                        "Customer is already exists.",
                        [],
                        404,
                        []
                    );
                }
            }
            //$customerOtp = new CustomerOtp();
            //$result = $customerOtp->validateOtp($request->otp, $mobileNumber, $request->id, $request->platform, $ismobilePresent, $smsValidityTime);
            $message = new Message($this->pdo, $this->redis);
            $result = $message->verifyOtp($request->mobile_number, $request->otp);

            $responseDetails = array("id" => $request->id);
            $response = $this->sendResponse(
                $responseDetails,
                ($result) ? 'OTP verified successfully.' : "OTP is invalid, expired or used."
            );
        } catch (Exception $e) {
            $responseDetails = array("id" => isset($requestedParams["id"]) ? $requestedParams["id"] : '');
            $response = $this->sendResponse(
                $responseDetails,
                $e->getMessage()
            );
        }

        return $response;
    }
}
