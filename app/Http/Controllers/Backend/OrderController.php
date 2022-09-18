<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\BlogPostRequest;
use App\Http\Requests\Backend\TeacherRequest;
use App\Models\BlogCategory;
use App\Models\BlogPost;
use App\Models\Branch;
use App\Models\Certificate;
use App\Models\Degree;
use App\Models\Order;
use App\Models\Teacher;
use App\Models\TeacherCertificate;
use Illuminate\Http\Request;
use Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class OrderController extends Controller
{
    public function index()
    {
        $list = Order::orderBy('id', 'desc');
        $list = $list->paginate(getConst('BE_PER_PAGE'));
        return view('backend.order.index', compact('list'));
    }

    public function show($id)
    {
        try {
            $entity = Order::with('orderDetails')->where('id', $id)->first();

            if (empty($entity)) {
                return redirect()->back()->with('notification_error', "Thất bại");
            }

            $viewData = [
                'entity' => $entity
            ];

            return view('backend.order.show', $viewData);
        } catch (\Exception $e) {

        }
        return redirect()->back()->with('notification_error', "Thất bại");
    }

    public function edit($id)
    {
        try {
            $entity = Order::where('id', $id)->first();

            if (empty($entity)) {
                return redirect()->back()->with('notification_error', "Thất bại");
            }

            if ($entity->status != getConfig('order-status-new')) {
                return redirect()->back()->with('notification_error', "Thất bại");
            }

            $viewData = [
                'entity' => $entity,
            ];

            return view('backend.order.edit', $viewData);
        } catch (\Exception $e) {
        }
        return redirect()->back()->with('notification_error', "Thất bại");
    }

    public function update($id)
    {
        try {
            $entity = Order::where('id', $id)->first();
            $entity->status = request('status');
            $entity->save();

            return redirect()->route('be.order.index')->with('notification_success', "Thành công");
        } catch (\Exception $e) {
        }

        return redirect()->back()->with('notification_error', "Thất bại");
    }
}
