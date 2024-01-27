<?php


namespace App\Http\Controllers\API;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller as Controller;
use Illuminate\Http\Response;
use PDO;
use Redis;
use DB;

class BaseController extends Controller
{

    /**
     * All the required libraries will be instantiated in these variables
     * @var object
     */
    protected $request;
    protected $response;
    protected $pdo;
    protected $redis;
    protected $oauthServer;

    /**
     * Constants for error codes
     * @var const
     */
    const SUCCESS_RESPONSE_CODE = 100;
    const AUTH_RESPONSE_CODE = 101;
    const INVALID_PARAM_RESPONSE_CODE = 102;
    const NO_DATA_FOUND = 103;
    const RECORD_ALREADY_EXISTS = 104;
    const UNAUTH_RESPONSE_CODE = 401;
    const TOO_MANY_REQUEST_RESPONSE_CODE = 529;
    const REFERRAL_COUPON_VERIFICATION_RESPONSE_SUCCESS_CODE = 301;
    const REFERRAL_COUPON_VERIFICATION_RESPONSE_FAILURE_CODE = 302;
    const INVENTORY_RESTRICTION_FAILURE_RESPONSE_CODE = 108;
    //SMS transaction type
    const SMS_MSG_TEMPLATES = [201 => "APP_REGISTER_OTP", 202 => "APP_LOGIN_OTP", 203 => "APP_RESET_PASSWORD", 204 => "APP_FORGET_PASSWORD"];
    const VALIDATION_ERROR = 'Validation Error.';
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(
        Request $request,
        Response $response
        //, PDO $pdo
        ,
        Redis $redis
    ) {
        $this->request = $request;
        $this->response = $response;
        $this->pdo = DB::connection()->getPdo();
        $this->redis = $redis;
    }


    /**
     * success response method.
     *
     * @return \Illuminate\Http\Response
     */
    public function sendResponse($result, $message)
    {
        $response = [
            'success' => true,
            'data'    => $result,
            'message' => $message,
        ];


        return response()->json($response, 200);
    }


    /**
     * return error response.
     *
     * @return \Illuminate\Http\Response
     */
    public function sendError($error, $errorMessages = [], $code = 404, $result = [])
    {
        if (!isset($result['message'])) {
            $result['message'] = "";
        }
        $response = [
            'success' => false,
            'data'    => $result,
            'message' => $error,
        ];
        if (!empty($errorMessages)) {
            if (is_array($errorMessages)) {
                if (!isset($errorMessages['message'])) {
                    $errorMessages['message'] = "";
                }
            }
            $response['data'] = $errorMessages;
        }
        return response()->json($response, $code);
    }
}
