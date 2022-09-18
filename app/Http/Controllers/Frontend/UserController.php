<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Http\Requests\Frontend\AuthRequest;
use App\Models\Order;
use App\Models\OrderDetail;
use Illuminate\Support\Facades\Log;

class UserController extends Controller
{
    public function account()
    {
        $user = fE();
        $viewData = [
            'user' => $user
        ];
        return view('frontend.tai-khoan', $viewData);
    }

    public function orderHistory()
    {
        $order = Order::where('user_id', fEId())->orderBy('id', 'desc')->get();

        $viewData = [
            'order' => $order
        ];

        return view('frontend.lich-su-mua-hang', $viewData);
    }

    public function orderDetail($id)
    {
        $order = Order::where('id', $id)->first();
        $orderDetail = OrderDetail::with('product')->where('order_id', $id)->get();

        $viewData = [
            'orderDetail' => $orderDetail,
            'order' => $order,
        ];

        return view('frontend.chi-tiet-don-hang', $viewData);
    }

    public function updateStatusOrder($id)
    {
        $order = Order::where('id', $id)->first();

        if (empty($order)) {
            abort(404);
        }

        $viewData = [
            'order' => $order
        ];

        return view('frontend.cap-nhat-don-hang', $viewData);
    }

    public function updateStatusOrderPost($id)
    {
        try {
            $params = request()->all();

            $order = Order::where('id', $id)->first();

            if (empty($order)) {
                return redirect()->back()->with('notification_error', 'Thất bại');
            }

            $order->fill($params);
            $order->save();

            return redirect()->route('frontend.account.order.history')->with('notification_success', 'Thành công');
        } catch (\Exception $e) {
            Log::error($e);
            dd($e);
        }

        return redirect()->back()->with('notification_error', 'Thất bại');
    }

    public function updateAccount(AuthRequest $request)
    {
        try {
            $entity = fE();
            $params = request()->all();

            if (!arrayGet($params, 'password')) {
                unset($params['password']);
            } else {
                $params['password'] = bcrypt(request('password'));
            }

            $entity->fill($params);
            $entity->save();
            return redirect()->back()->with('notification_success', 'Thành công');
        } catch (\Exception $e) {
            Log::error($e);
        }
        return redirect()->back()->with('notification_error', 'Thất bại');
    }

    public function baohanh()
    {
        return view('frontend.bao-hanh');
    }
}
