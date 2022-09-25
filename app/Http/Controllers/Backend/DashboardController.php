<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        return view('backend.dashboard.index');
    }

    public function report()
    {
        $today = Order::whereDate('created_at', DB::raw('CURDATE()'))->count();
        $week = Order::whereBetween('created_at', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()])->count(); // Monday -> sunday
        $month = Order::whereBetween('created_at', [Carbon::now()->startOfMonth(), Carbon::now()->endOfMonth()])->count();
        $year = Order::whereBetween('created_at', [Carbon::now()->startOfYear(), Carbon::now()->endOfYear()])->count();

        $viewData = [
            'today' => $today,
            'week' => $week,
            'month' => $month,
            'year' => $year,
        ];

        return view('backend.report.index', $viewData);
    }
}
