<?php

namespace App\Http\Requests;

use App\Models\PromoCodeMaster;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Symfony\Component\HttpFoundation\Response;

class MassDestroyCampaignRequest extends FormRequest
{
    public function authorize()
    {
        abort_if(Gate::denies('campaign_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return true;
    }

    public function rules()
    {
        return [
            'ids'   => 'required|array',
            'ids.*' => 'exists:promo_code_master,id',
        ];
    }
}
