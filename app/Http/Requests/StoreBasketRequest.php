<?php

namespace App\Http\Requests;

use App\Models\Basket;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;

class StoreBasketRequest extends FormRequest
{
    public function authorize()
    {
        abort_if(Gate::denies('basket_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        return true;
    }

    public function rules()
    {
        $this->sanitize();
        /* $startDate = strtotime('-1 days', strtotime($this->all()['special_price_start_date']));
        $startDateNew = date('d F Y', $startDate);
        if (!$this->request->get('special_price')) {
            $this->request->set('special_price_start_date', null);
            $this->request->set('special_price_end_date', null);
        } */
        $this->request->set('created_by', Auth::id());

        $validationRules = [
            /* 'special_price' => ['required_with:special_price_start_date, special_price_end_date'],
            'special_price_start_date' => ['required_with:special_price_end_date','date'],
            'special_price_end_date' => ['required_with:special_price_start_date','date','date_format:d F Y','after:' . $startDateNew], */
            'sku' => ['required','max:50','unique:products'], //alphaSpaces
            
            'product_name' => ['required','max:50','unique:products'], //alphaSpaces
            'productUnits.*'  => [
                'integer',
            ],
            'productUnits'    => [
                'required',
                'array',
            ],

            /* 'status' => ['required','numeric'] */
        ];
      
        return $validationRules;
    }

    public function sanitize() {
        $input = $this->all();
        $input['created_by'] = Auth::id();
        $this->merge($input);
    }
}
