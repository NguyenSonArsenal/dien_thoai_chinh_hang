<?php

namespace App\Composers;

use App\Models\Cart;
use App\Models\Category;
use App\Models\OrderDetail;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;

class LayoutComposer
{
    public function compose(View $view)
    {
        $categories = Category::with('children')->get();
        if (fEId()) {
            $numberItemInCart = Cart::where('user_id', fEId())->count();
        } else {
            $numberItemInCart = count(session('cart', []));
        }

        try {
//            $mostSellProduct = OrderDetail::with('product')->select(DB::raw("*, count('product_id') as count"))->groupBy('product_id')
//                ->orderBy('count', 'desc')->take(5)->get();
        } catch (\Exception $e) {
            dd($e);
        }


        $viewDataGlobal = [
            'categories' => $categories,
            'numberItemInCart' => $numberItemInCart,
            'mostSellProduct' => [],
        ];

        // bind to view
        $view->with('viewComposer', $viewDataGlobal);
    }
}
