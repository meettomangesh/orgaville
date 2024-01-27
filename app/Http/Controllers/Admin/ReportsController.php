<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use DB;
use DataTables;
use Session;
use App\UserLoginLogs;

class ReportsController extends Controller
{
    public function salesItemwise()
    {
        abort_if(Gate::denies('report_sales_itemwise_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        return view('admin.reports.sales_itemwise', compact(''));
    }

    public function salesOrderwiseItem()
    {
        abort_if(Gate::denies('report_sales_orderwise_item_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        return view('admin.reports.sales_orderwise_item', compact(''));
    }

    public function salesForSupplier()
    {
        abort_if(Gate::denies('report_sales_for_supplier_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        return view('admin.reports.sales_for_supplier', compact(''));
    }

    /**
     * List all Filter Params
     * @return array
     */
    public function getFilterAttributes()
    {
        return [
            'order_id',
            'product_name',
            'selling_price',
            'special_price',
            'item_quantity',
            'order_status',
            'order_date'
        ];
    }

    public function loginLogs()
    {
        // abort_if(Gate::denies('deliveryboy_access'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        $userLoginLogs = UserLoginLogs::all();
        return view('admin.reports.login_logs', compact('userLoginLogs'));
    }

    public function getSalesOrderwiseItemData(Request $request) {
        set_time_limit(0);

        $input = $request->all();
        $filterParams = [];
        if(isset($input['draw']) && $input['draw'] != 1) {
            foreach($input['columns'] as $key => $value) {
                if(isset($value['search']['value']) && !empty($value['search']['value'])) {
                    $filterParams[$value['name']] = $value['search']['value'];
                }
            }
        }
        
        $salesItemsData = DB::table('customer_orders AS co')
            ->leftJoin('customer_order_details AS cod', 'co.id', '=', 'cod.order_id')
            ->leftJoin('products AS p', 'p.id', '=', 'cod.products_id')
            ->leftJoin('product_units AS pu', 'pu.id', '=', 'cod.product_units_id')
            ->leftJoin('unit_master AS um', 'um.id', '=', 'pu.unit_id')
            ->leftJoin('categories_master AS cm', 'cm.id', '=', 'p.category_id');

        $salesItemsData->select([
            DB::raw('co.id AS order_id'),
            DB::raw('p.product_name'),
            DB::raw('um.unit'),
            DB::raw('cm.cat_name'),
            DB::raw('cod.item_quantity'),
            DB::raw('cod.selling_price'),
            DB::raw('cod.special_price'),
            DB::raw('DATE(cod.created_at) AS order_date'),
            DB::raw('cod.is_basket'),
            /* DB::raw('IF(cod.is_basket = 0, "", (
                SELECT GROUP_CONCAT(CONCAT(pn.product_name, " (", umn.unit, ")")) FROM customer_order_details_basket AS codb
                JOIN products AS pn ON pn.id = codb.products_id
                JOIN product_units AS pun ON pun.id = codb.product_units_id
                JOIN unit_master AS umn ON umn.id = pun.unit_id
                WHERE codb.order_id = cod.order_id AND codb.order_details_id = cod.id
            )) AS basket_products'), */
            DB::raw('CASE 
                    WHEN cod.order_status = 0 THEN "Pending"
                    WHEN cod.order_status = 1 THEN "Placed"
                    WHEN cod.order_status = 2 THEN "Picked"
                    WHEN cod.order_status = 3 THEN "Out for delivery"
                    WHEN cod.order_status = 4 THEN "Delivered"
                    WHEN cod.order_status = 5 THEN "Cancelled"
                    ELSE "" END AS order_status
                    ')
            // DB::raw('cod.order_status'),
        ]);

        $orderDate = "";
        if (!empty($filterParams['order_date'])) {
            $salesItemsData->whereRaw('DATE(cod.created_at) = "'.$filterParams['order_date'].'"');
        } else {
            $salesItemsData->whereRaw('DATE(cod.created_at) = CURDATE()');
        }

        if (isset($filterParams['order_id']) && !empty($filterParams['order_id'])) {
            $salesItemsData->where('cod.order_id', '=', $filterParams['order_id']);
        }
        if (isset($filterParams['product_name']) && !empty($filterParams['product_name'])) {
            $salesItemsData->where('p.product_name', 'LIKE', "%".$filterParams['product_name']."%");
        }
        if (!empty($filterParams['unit'])) {
            $salesItemsData->whereRaw('um.unit LIKE "%'.$filterParams['unit'].'%"');
        }
        if (!empty($filterParams['cat_name'])) {
            $salesItemsData->whereRaw('cm.cat_name LIKE "%'.$filterParams['cat_name'].'%"');
        }
        if (!empty($filterParams['item_quantity'])) {
            $salesItemsData->having('cod.item_quantity', '=', $filterParams['item_quantity']);
        }
       
        // $salesItemsData = collect($salesItemsData->get());
        // return $salesItemsData;
        return datatables()->collection($salesItemsData->get())->toJson();
        // return Datatables::of($salesItemsData)->make(true);
    }

    public function getSalesItemwiseData(Request $request) {
        /* SELECT IF(cod.is_basket = 0, cod.product_units_id, codb.product_units_id) AS product_units_id, ROUND(SUM(IFNULL(codb.item_quantity / 2, cod.item_quantity))) AS total_unit, p.product_name, cm.cat_name, um.unit, CASE
            WHEN um.unit = "100gram" THEN (100/1000) * ROUND(SUM(IFNULL(codb.item_quantity / 2, cod.item_quantity)))
            WHEN um.unit = "250gram" THEN (250/1000) * ROUND(SUM(IFNULL(codb.item_quantity / 2, cod.item_quantity)))
            WHEN um.unit = "500gram" THEN (500/1000) * ROUND(SUM(IFNULL(codb.item_quantity / 2, cod.item_quantity)))
            WHEN um.unit = "1kg" THEN 1 * ROUND(SUM(IFNULL(codb.item_quantity / 2, cod.item_quantity)))
            WHEN um.unit = "2kg" THEN 2 * ROUND(SUM(IFNULL(codb.item_quantity / 2, cod.item_quantity)))
            ELSE "" END
            
        FROM customer_order_details AS cod
        LEFT JOIN customer_order_details_basket AS codb ON cod.id = codb.order_details_id
        LEFT JOIN products AS p ON p.id = cod.products_id OR p.id = codb.products_id
        LEFT JOIN product_units AS pu ON pu.id = cod.product_units_id OR pu.id = codb.product_units_id
        LEFT JOIN unit_master AS um ON um.id = pu.unit_id
        LEFT JOIN categories_master AS cm ON cm.id = p.category_id
        WHERE DATE(cod.created_at) = "2021-05-31"
        GROUP BY cod.product_units_id */

        set_time_limit(0);

        $input = $request->all();
        $filterParams = [];
        if(isset($input['draw']) && $input['draw'] != 1) {
            foreach($input['columns'] as $key => $value) {
                if(isset($value['search']['value']) && !empty($value['search']['value'])) {
                    $filterParams[$value['name']] = $value['search']['value'];
                }
            }
        }

        $salesItemsData = DB::table('customer_order_details AS cod')
            ->leftJoin('customer_order_details_basket AS codb', 'cod.id', '=', 'codb.order_details_id')
            // ->leftJoin('products AS p', 'p.id', '=', 'cod.products_id', 'OR', 'p.id', '=', 'codb.products_id')
            ->leftJoin('products AS p', function($join){
                $join->on('p.id', '=', 'cod.products_id');
                $join->orOn('p.id', '=', 'codb.products_id');
            })
            // ->leftJoin('product_units AS pu', 'pu.id', '=', 'cod.product_units_id', 'OR', 'pu.id', '=', 'codb.product_units_id')
            ->leftJoin('product_units AS pu', function($join){
                $join->on('pu.id', '=', 'cod.product_units_id');
                $join->orOn('pu.id', '=', 'codb.product_units_id');
            })
            ->leftJoin('unit_master AS um', 'um.id', '=', 'pu.unit_id')
            ->leftJoin('categories_master AS cm', 'cm.id', '=', 'p.category_id');

        $salesItemsData->select([
            // DB::raw('IF(cod.is_basket = 0, cod.product_units_id, codb.product_units_id) AS product_units_id'),
            // DB::raw('p.product_name'),
            DB::raw('IF(codb.products_id IS NOT NULL, (SELECT product_name FROM products WHERE id = cod.products_id), p.product_name) AS product_name'),
            DB::raw('um.unit'),
            DB::raw('cm.cat_name'),
            DB::raw('DATE(cod.created_at) AS order_date'),
            DB::raw('ROUND(SUM(IFNULL(codb.item_quantity / 2, cod.item_quantity))) AS total_unit'),
        ]);

        $orderDate = "";
        if (!empty($filterParams['order_date'])) {
            // $orderDate = Carbon::parse($filterParams['order_date'])->format('Y-m-d');
            $salesItemsData->whereRaw('DATE(cod.created_at) = "'.$filterParams['order_date'].'"');
        } else {
            $salesItemsData->whereRaw('DATE(cod.created_at) = CURDATE()');
        }

        if (!empty($filterParams['product_name'])) {
            $salesItemsData->whereRaw('p.product_name LIKE "%'.$filterParams['product_name'].'%"');
        }

        if (!empty($filterParams['unit'])) {
            $salesItemsData->whereRaw('um.unit LIKE "%'.$filterParams['unit'].'%"');
        }

        if (!empty($filterParams['cat_name'])) {
            $salesItemsData->whereRaw('cm.cat_name LIKE "%'.$filterParams['cat_name'].'%"');
        }

        if (!empty($filterParams['total_unit'])) {
            $salesItemsData->having('total_unit', '=', $filterParams['total_unit']);
        }

        $salesItemsData->whereRaw('cod.order_status = 1');
        $salesItemsData->groupBy('cod.product_units_id');

        // To print query
        // echo $salesItemsData->toSql(); exit;

        return datatables()->collection($salesItemsData->get())->toJson();
        // return Datatables::of($salesItemsData)->make(true);
    }

    public function getSalesForSupplierData(Request $request) {
        set_time_limit(0);

        $input = $request->all();
        $filterParams = [];
        if(isset($input['draw']) && $input['draw'] != 1) {
            foreach($input['columns'] as $key => $value) {
                if(isset($value['search']['value']) && !empty($value['search']['value'])) {
                    $filterParams[$value['name']] = $value['search']['value'];
                }
            }
        }

        $salesItemsData = DB::table('customer_order_details AS cod')
            ->leftJoin('customer_order_details_basket AS codb', 'cod.id', '=', 'codb.order_details_id')
            // ->leftJoin('products AS p', 'p.id', '=', 'cod.products_id', 'OR', 'p.id', '=', 'codb.products_id')
            ->leftJoin('products AS p', function($join){
                $join->on('p.id', '=', 'cod.products_id');
                $join->orOn('p.id', '=', 'codb.products_id');
            })
            // ->leftJoin('product_units AS pu', 'pu.id', '=', 'cod.product_units_id', 'OR', 'pu.id', '=', 'codb.product_units_id')
            ->leftJoin('product_units AS pu', function($join){
                $join->on('pu.id', '=', 'cod.product_units_id');
                $join->orOn('pu.id', '=', 'codb.product_units_id');
            })
            ->leftJoin('unit_master AS um', 'um.id', '=', 'pu.unit_id')
            ->leftJoin('categories_master AS cm', 'cm.id', '=', 'p.category_id');

        $salesItemsData->select([
            // DB::raw('IF(cod.is_basket = 0, cod.product_units_id, codb.product_units_id) AS product_units_id'),
            DB::raw('p.product_name'),
            DB::raw('cm.cat_name'),
            DB::raw('"" AS final'),
            DB::raw('DATE(cod.created_at) AS order_date'),
            DB::raw('ROUND(SUM(IFNULL(codb.item_quantity / 2, cod.item_quantity))) AS total_unit'),
            DB::raw('GROUP_CONCAT(um.unit) AS prod_units'),
            // DB::raw('GROUP_CONCAT(IF(codb.item_quantity > 0, codb.item_quantity, IF(cod.item_quantity > 0, cod.item_quantity, 0))) AS product_units_qty'),
            DB::raw('GROUP_CONCAT(IFNULL(codb.item_quantity, cod.item_quantity)) AS product_units_qty'),
        ]);

        $orderDate = "";
        if (!empty($filterParams['order_date'])) {
            // $orderDate = Carbon::parse($filterParams['order_date'])->format('Y-m-d');
            $salesItemsData->whereRaw('DATE(cod.created_at) = "'.$filterParams['order_date'].'"');
        } else {
            $salesItemsData->whereRaw('DATE(cod.created_at) = CURDATE()');
        }

        if (!empty($filterParams['product_name'])) {
            $salesItemsData->whereRaw('p.product_name LIKE "%'.$filterParams['product_name'].'%"');
        }

        if (!empty($filterParams['unit'])) {
            $salesItemsData->whereRaw('um.unit LIKE "%'.$filterParams['unit'].'%"');
        }

        if (!empty($filterParams['cat_name'])) {
            $salesItemsData->whereRaw('cm.cat_name LIKE "%'.$filterParams['cat_name'].'%"');
        }

        if (!empty($filterParams['total_unit'])) {
            $salesItemsData->having('total_unit', '=', $filterParams['total_unit']);
        }

        $salesItemsData->whereRaw('cod.order_status = 1');
        $salesItemsData->whereRaw('IF(p.is_basket = 0, true, false)');
        /* $salesItemsData->groupBy('cod.products_id');
        $salesItemsData->groupBy('codb.products_id'); */
        $salesItemsData->groupBy('p.id');

        // To print query
        // echo $salesItemsData->toSql(); exit;

        return datatables()->collection($salesItemsData->get())
        ->addColumn('final', function($salesItemsData) {
            $units = $salesItemsData->prod_units;
            $qty = $salesItemsData->product_units_qty;
            $unitsSplit = explode(",", $units);
            $qtySplit = explode(",", $qty);
            $finalOP = 0;
            $finalUnit = "";
            if(sizeof($unitsSplit) > 0) {
                for($j = 0; $j < sizeof($unitsSplit); $j++) {
                    if($unitsSplit[$j] == "200gm") {
                        $finalOP = $finalOP + ((200/1000) * $qtySplit[$j]);
                        $finalUnit = "kg";
                    } else if($unitsSplit[$j] == "250gm") {
                        $finalOP = $finalOP + ((250/1000) * $qtySplit[$j]);
                        $finalUnit = "kg";
                    } else if($unitsSplit[$j] == "400gm") {
                        $finalOP = $finalOP + ((400/1000) * $qtySplit[$j]);
                        $finalUnit = "kg";
                    } else if($unitsSplit[$j] == "500gm") {
                        $finalOP = $finalOP + ((500/1000) * $qtySplit[$j]);
                        $finalUnit = "kg";
                    } else if($unitsSplit[$j] == "1kg") {
                        $finalOP = $finalOP + (1 * $qtySplit[$j]);
                        $finalUnit = "kg";
                    } else if($unitsSplit[$j] == "2kg") {
                        $finalOP = $finalOP + (2 * $qtySplit[$j]);
                        $finalUnit = "kg";
                    } else if($unitsSplit[$j] == "3kg") {
                        $finalOP = $finalOP + (3 * $qtySplit[$j]);
                        $finalUnit = "kg";
                    } else if($unitsSplit[$j] == "5kg") {
                        $finalOP = $finalOP + (5 * $qtySplit[$j]);
                        $finalUnit = "kg";
                    } else if($unitsSplit[$j] == "250ml") {
                        $finalOP = $finalOP + ((250/1000) * $qtySplit[$j]);
                        $finalUnit = "ltr";
                    } else if($unitsSplit[$j] == "500ml") {
                        $finalOP = $finalOP + ((500/1000) * $qtySplit[$j]);
                        $finalUnit = "ltr";
                    } else if($unitsSplit[$j] == "1ltr") {
                        $finalOP = $finalOP + (1 * $qtySplit[$j]);
                        $finalUnit = "ltr";
                    } else if($unitsSplit[$j] == "1pc") {
                        $finalOP = $finalOP + (1 * $qtySplit[$j]);
                        $finalUnit = "pc(s)";
                    } else if($unitsSplit[$j] == "3pc") {
                        $finalOP = $finalOP + (3 * $qtySplit[$j]);
                        $finalUnit = "pc(s)";
                    } else if($unitsSplit[$j] == "4pc") {
                        $finalOP = $finalOP + (4 * $qtySplit[$j]);
                        $finalUnit = "pc(s)";
                    } else if($unitsSplit[$j] == "6pc") {
                        $finalOP = $finalOP + (6 * $qtySplit[$j]);
                        $finalUnit = "pc(s)";
                    } else if($unitsSplit[$j] == "12pc") {
                        $finalOP = $finalOP + (12 * $qtySplit[$j]);
                        $finalUnit = "pc(s)";
                    } else if($unitsSplit[$j] == "1Dozen") {
                        $finalOP = $finalOP + (1 * $qtySplit[$j]);
                        $finalUnit = "Dozen(s)";
                    } else if($unitsSplit[$j] == "Half Dozen") {
                        $finalOP = $finalOP + (12 * $qtySplit[$j]);
                        $finalUnit = "Dozen(s)";
                    }
                }
            }
            return $finalOP.$finalUnit;
        })->toJson();
        // return Datatables::of($salesItemsData)->make(true);
    }
}
