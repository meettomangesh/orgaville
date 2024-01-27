<?php

/**
 * The helper library class for Data related functionality
 *
 *
 * @author 
 * @package Admin
 * @since 1.0
 */

namespace App\Helper;

class SMSHelper
{
    /**
     * Send an sms
     * 
     * @return response
     */
    public static function sendMessage($jsonData)
    {
        try {
            $smsGateWayUrl = config('services.miscellaneous.SMS_GATEWAY_API_BASE_URL_FLOW');
            $authkey = config('services.miscellaneous.SMS_GATEWAY_API_AUTH_KEY');

            $curl = curl_init();

            curl_setopt_array($curl, array(
                CURLOPT_URL => $smsGateWayUrl,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => "",
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 30,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "POST",
                CURLOPT_POSTFIELDS => $jsonData,
                CURLOPT_HTTPHEADER => array(
                  "authkey: ".$authkey,
                  "content-type: application/JSON"
                ),
                CURLOPT_SSL_VERIFYHOST => 0,
                CURLOPT_SSL_VERIFYPEER => 0,
            ));
              
            $response = json_decode(curl_exec($curl));
            $err = curl_error($curl);
            curl_close($curl);
            if ($err || $response->type == 'error') {
                return 0;
            } else {
                return 1;
            }
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
}
