<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Category;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Product;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class FrontendController extends Controller
{
    public function index()
    {
        try {
            $productHot = Product::where('hot', getConfig('product-hot'))->take(8)->get();
            $category = Category::where('level', 1)->get();
            $data = [];

            foreach ($category as $key => $value) {
                $dataProduct = Product::with('category')->where('category_id', $value->id)->take(4)->get();
                array_push($data, $dataProduct);
            }

            $viewData = [
                'productHot' => $productHot,
                'data' => $data
            ];

            return view('frontend.index', $viewData);
        } catch (\Exception $e) {
            return redirect()->route('frontend.home');
        }
    }

    public function gioiThieu()
    {
        return view('frontend.gioi-thieu');
    }

    public function lienHe()
    {
        return view('frontend.lien-he');
    }

    public function sanPham($id)
    {
        $product = Product::with('category')->where('id', $id)->first();

        if (empty($product)) {
            abort(404);
        }

        $relationProduct = Product::where('id', '!=', $id)->where('category_id', $product->category_id)->take(4)->get();

        $viewData = [
            'product' => $product,
            'relationProduct' => $relationProduct,
        ];

        return view('frontend.san-pham', $viewData);
    }

    public function danhSachDanhMuc()
    {
        return view('frontend.danh-muc');
    }

    public function showDanhMuc($id)
    {
        $category = Category::findOrFail($id);
        $query = Product::where('category_id', $id);


        $params = request()->all();

        if (arrayGet($params, 'price')) {
            $query->orderBy('price_origin', arrayGet($params, 'price'));
        }

        $products = $query->paginate(getConst('FE_PER_PAGE'));
        $countProducts = $query->count();
        $viewData = [
            'category' => $category,
            'products' => $products,
            'countProducts' => $countProducts,
        ];
        return view('frontend.danh-muc', $viewData);
    }

    public function gioHang()
    {
        $userId = fEId();
        $totalPriceCart = 0;
        if (!empty($userId)) {
            $cart = Cart::where('user_id', $userId)->pluck('product_id')->toArray();
        } else {
            $cart = session('cart', []);
        }

        $productInCarts = Product::whereIn('id', $cart)->get();
        foreach ($productInCarts as $item) {
            $tmp = $item;
            if ($tmp->price_sell) {
                $totalPriceCart += $tmp->price_sell;
            } else {
                $totalPriceCart += $tmp->price_origin * (100 - (int)$tmp->sale) / 100;
            }

        }

        $viewData = [
            'productInCarts' => $productInCarts,
            'totalPriceCart' => $totalPriceCart,
        ];

        return view('frontend.gio-hang', $viewData);
    }

    public function thanhToan()
    {
        if (fE()) {
            $cart = Cart::with('product')->where('user_id', fEId())->pluck('product_id')->toArray();
        } else {
            $cart = session('cart', []);
        }

        if (count($cart) <= 0) {
            return redirect()->route('frontend.home');
        }

        $productInCarts = Product::whereIn('id', $cart)->get();
        $totalPriceCart = 0;
        foreach ($productInCarts as $item) {
            $tmp = $item;
            if ($tmp->price_sell) {
                $totalPriceCart += $tmp->price_sell;
            } else {
                $totalPriceCart += $tmp->price_origin * (100 - (int)$tmp->sale) / 100;
            }

        }

        $viewData = [
            'cart' => $productInCarts,
            'totalPriceCart' => $totalPriceCart
        ];

        return view('frontend.thanh-toan', $viewData);
    }

    public function thanhToanThanhCong()
    {
        if (!fE()) {
            return redirect()->route('frontend.home');
        }

        $order = Order::where('status', getConfig('order-status-new'))->orderBy('id', 'desc')->first();

        $viewData = [
            'order' => $order,
        ];

        return view('frontend.thanh-toan-thanh-cong', $viewData);
    }

    /**
     * @param $productId
     * @return \Illuminate\Http\RedirectResponse
     */
    public function addToCart($productId)
    {
        try {
            $userId = fEId();
            if (empty($userId)) {
                $carts = request()->session()->get('cart', []);

                if (in_array($productId, $carts)) {
                    return redirect()->back()->with('notification_error', 'Sản phẩm đã tồn tại trong giỏ hàng');
                }

                array_push($carts, $productId);
                request()->session()->put('cart', $carts);
            } else {
                $cart = Cart::where('user_id', $userId)->where('product_id', $productId)->first();

                if (!empty($cart)) {
                    return redirect()->back()->with('notification_error', 'Sản phẩm đã tồn tại trong giỏ hàng');
                }

                $cart = empty($cart) ? new Cart() : $cart;
                $cart->user_id = $userId;
                $cart->product_id = $productId;
                $cart->save();
            }

            return redirect()->route('frontend.gio-hang');
        } catch (\Exception $e) {
        }

        return redirect()->back()->with('notification_error', 'Thất bại');
    }

    public function deleteItemCart($id)
    {
        try {
            if (fE()) {
                $item = Cart::find($id);
                if (!empty($item)) {
                    $item->delete();
                }
            } else {
                $carts = session('cart', []);
                $tmp = [];
                foreach ($carts as $productId) {
                    if ($productId == $id) {
                        continue;
                    }
                    array_push($tmp, $productId);
                }
                session()->put('cart', $tmp);
            }

            return redirect()->back()->with('notification_success', 'Thành công');
        } catch (\Exception $e) {

        }

        return redirect()->back()->with('notification_error', 'Thất bại');
    }

    public function postCheckout()
    {
        DB::beginTransaction();
        try {
            // save to orders table
            $dataOrder = request()->all();
            $dataOrder['user_id'] = fE() ? fEId() : -1;
            $dataOrder['name'] = request('name');
            $dataOrder['address'] = request('address');
            $dataOrder['phone'] = request('phone');
            $dataOrder['total_money'] = request('total_money');
            $dataOrder['status'] = getConfig('order-status-new');
            $ordersEntity = Order::create($dataOrder);
            $orderId = $ordersEntity->id;

            // save to order_detail table
            $cart = fE() ? Cart::where('user_id', fEId())->pluck('product_id')->toArray() : session('cart', []);

            foreach ($cart as $productId) {
                $product = Product::where('id', $productId)->first();
                if (!empty($product)) {
                    $orderDetail['order_id'] = $orderId;
                    $orderDetail['product_id'] = $productId;
                    $orderDetail['product_name'] = $product->name;
                    $orderDetail['product_price_origin'] = $product->price_origin;
                    $orderDetail['product_price_sell'] = $product->price_sell ? $product->price_sell : $product->price_origin * (100 - $product->sale) / 100;
                    $orderDetail['product_sale'] = $product->sale;
                    $orderDetail['product_avatar'] = $product->avatar;
                    OrderDetail::create($orderDetail);
                }
            }

            // remove cart by user id
            if (fE()) {
                Cart::where('user_id', fEId())->delete();
            } else {
                session()->forget('cart');
            }

            DB::commit();
            return redirect()->route('frontend.thanh-toan-thanh-cong');
        } catch (\Exception $e) {
            Log::error($e);
            DB::rollback();
        }
        return redirect()->back()->withInput(request()->all())->with('notification_error', 'Đã có lỗi sảy ra');
    }

    public function search()
    {
        $search = request('search');
        $query = Product::where('name', 'like', "%$search%")
            ->orWhere('sort_describe', 'like', "%$search%")
            ->orWhere('price_origin', 'like', "%$search%");
        $products = $query->paginate(getConst('FE_PER_PAGE'));
        $countProducts = $query->count();

        $viewData = [
            'products' => $products,
            'countProducts' => $countProducts,
        ];

        return view('frontend.search', $viewData);
    }
}
