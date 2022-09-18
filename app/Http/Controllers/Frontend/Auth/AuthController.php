<?php

namespace App\Http\Controllers\Frontend\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Frontend\AuthRequest;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class AuthController extends Controller
{
    public function showFormLogin()
    {
        return view('frontend.dang-nhap');
    }

    public function postLogin()
    {
        try {
            $credentials = [
                'email' => request('email'),
                'password' => request('password'),
            ];

            $checkLogin = feGuard()->attempt($credentials);

            if ($checkLogin) {
                return redirect()->route('frontend.home');
            }

            return redirect()->back()->withErrors('Email hoặc Password không chính xác')->withInput(request()->all());
        } catch (\Exception $e) {
            return redirect()->route('frontend.home');
        }
    }

    public function showFormRegister()
    {
        return view('frontend.dang-ki');
    }

    public function postRegister(AuthRequest $request)
    {
        try {
            $params = request()->all();

            $entity = new User();
            $params['password'] = bcrypt(arrayGet($params, 'password'));
            $entity->fill($params);
            $entity->save();

            return redirect()->route('frontend.login.get')->with(['notification_success' => 'Thành công']);
        } catch (\Exception $e) {
            Log::error($e);
        }

        return redirect()->back()->with('notification_error', 'Thất bại');
    }

    public function logout()
    {
        feGuard()->logout();
        return redirect()->route('frontend.login.get');
    }
}
