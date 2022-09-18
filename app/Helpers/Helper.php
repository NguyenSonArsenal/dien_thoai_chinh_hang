<?php

use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;

// Common
function beGuard()
{
    return Auth::guard('be');
}

function bE()
{
    return Auth::guard('be')->user();
}

function isManager()
{
    return Auth::guard('be')->user()->role == \App\Models\User::ROLE_MANAGE;
}

function isAdmin()
{
    return Auth::guard('be')->user()->role == \App\Models\User::ROLE_ADMIN;
}

function feGuard()
{
    return Auth::guard('fe');
}

function fE()
{
    return Auth::guard('fe')->user();
}

function fEId()
{
    return fE() ? fE()->id : '';
}

function frontendIsLogin()
{
    return feGuard()->check();
}

function arrayGet($array, $key, $default = null)
{
    return Arr::get($array, $key, $default);
}

function getConfig($key, $default = '')
{
    return config('config.' . $key, $default);
}

function getConst($key, $default = '')
{
    return config('const.' . $key, $default);
}

function getSTTBackend($entities, $index)
{
    return getConst('BE_PER_PAGE') * ($entities->currentPage() -1) + 1 + $index;
}

function oldInput($old, $db)
{
    return empty($old) ? $db : $old;
}

// End common

function formatPriceCurrency($value = null)
{
    $result = is_null($value) ? '' : number_format((float)$value, 2, ',', '.');

    if (substr($result, -3) == ',00') {
        return substr($result, 0, strlen($result) - 3);
    }

    if (substr($result, -2) == ',0') {
        return substr($result, 0, strlen($result) - 2);
    }

    return $result;
}

function getOrderStatus($key = '')
{
    return empty($key) ? '' : getConfig("order-status." . $key);
}

function frontendRouter($routeName, $params = [])
{
    return route('frontend.' . $routeName, $params);
}
