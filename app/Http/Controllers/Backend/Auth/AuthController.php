<?php

namespace App\Http\Controllers\Backend\Auth;

use App\Http\Controllers\Controller;

class AuthController extends Controller
{
    public function showFormLogin()
    {
        return view('backend.auth.login');
    }

    public function postLogin()
    {
        if (beGuard()->attempt(request()->only('email', 'password'))) {
            return redirect()->route('be.dashboard');
        }

        return redirect()->back()->withErrors('Email hoặc Password không chính xác')->withInput(request()->all());
    }

    public function logout()
    {
        beGuard()->logout();
        return redirect()->route('be.login');
    }
}
