<?php

use App\Http\Controllers\Backend\BranchController;
use App\Http\Controllers\Backend\CategoryController;
use App\Http\Controllers\Backend\OrderController;
use App\Http\Controllers\Backend\ProductController;
use App\Http\Controllers\Backend\UserController;
use App\Http\Controllers\Backend\Auth\AuthController as AuthBe;
use App\Http\Controllers\Frontend\Auth\AuthController as FEAuth;
use App\Http\Controllers\Frontend\FrontendController;
use App\Http\Controllers\Frontend\UserController as FeUserController;
use Illuminate\Support\Facades\Route;

use Illuminate\Support\Facades\Mail;

// ========== FRONTEND AREA ==========
Route::group(['prefix'=>'/', 'as'=>'frontend.', 'namespace' => 'Frontend'], function(){
    Route::get('/', [FrontendController::class, 'index'])->name('home');
    Route::get('/san-pham/{id}', [FrontendController::class, 'sanPham'])->name('san-pham');
    Route::get('/gioi-thieu', [FrontendController::class, 'gioiThieu'])->name('gioi-thieu');
    Route::get('/lien-he', [FrontendController::class, 'lienHe'])->name('lien-he');
    Route::get('/dang-ki', [FEAuth::class, 'showFormRegister'])->name('register.get');
    Route::post('/dang-ki', [FEAuth::class, 'postRegister'])->name('register.post');
    Route::get('/dang-nhap', [FEAuth::class, 'showFormLogin'])->name('login.get');
    Route::post('/login', [FEAuth::class, 'postLogin'])->name('login.post');
    Route::get('/dang-xuat', [FEAuth::class, 'logout'])->name('logout');
    Route::get('/danh-muc/{id}', [FrontendController::class, 'showDanhMuc'])->name('danh-muc');
    Route::get('/them-gio-hang/{id}', [FrontendController::class, 'addToCart'])->name('them-gio-hang');
    Route::get('/them-gio-hang/{id}', [FrontendController::class, 'addToCart'])->name('them-gio-hang');
    Route::get('/gio-hang', [FrontendController::class, 'gioHang'])->name('gio-hang');
    Route::get('/cart/delete/{id}', [FrontendController::class, 'deleteItemCart'])->name('cart.delete-item');
    Route::get('/thanh-toan', [FrontendController::class, 'thanhToan'])->name('thanh-toan');
    Route::post('/thanh-toan', [FrontendController::class, 'postCheckout'])->name('thanh-toan.post');
    Route::get('/thanh-toan-thanh-cong', [FrontendController::class, 'thanhToanThanhCong'])->name('thanh-toan-thanh-cong');
    Route::get('/tim-kiem', [FrontendController::class, 'search'])->name('tim-kiem');
    Route::get('tai-khoan', [FeUserController::class, 'account'])->middleware('authFrontend')->name('account');
    Route::post('account/update', [FeUserController::class, 'updateAccount'])->name('account.update.post');
    Route::get('tai-khoan/lich-su-mua-hang', [FeUserController::class, 'orderHistory'])->name('account.order.history')->middleware('authFrontend');
    Route::get('tai-khoan/don-hang/{id}', [FeUserController::class, 'orderDetail'])->middleware('authFrontend')->name('account.order.detail');
    Route::get('tai-khoan/don-hang/{id}/update', [FeUserController::class, 'updateStatusOrder'])->middleware('authFrontend')->name('account.order.update');
    Route::post('tai-khoan/don-hang/{id}/update', [FeUserController::class, 'updateStatusOrderPost'])->middleware('authFrontend')->name('account.order.update.post');
    Route::get('chinh-sach-bao-hanh', [FeUserController::class, 'baohanh'])->name('bao-hanh');
});

// ========== BACKEND AREA ==========
Route::get('management/login', [AuthBe::class, 'showFormLogin'])->name('be.login');
Route::post('management/login', [AuthBe::class, 'postLogin'])->name('be.login.post');

Route::group(['prefix'=>'management/', 'as'=>'be.', 'middleware' => ['authBackend']], function() {
    Route::get('/', [App\Http\Controllers\Backend\DashboardController::class, 'index'])->name('dashboard');
    Route::get('/logout', [AuthBe::class, 'logout'])->name('logout');
    Route::resource('/branch', BranchController::class);
//    Route::resource('/category', CategoryController::class);
    Route::resource('/product', ProductController::class);
    Route::resource('/user', UserController::class);
    Route::resource('/order', OrderController::class);
});
