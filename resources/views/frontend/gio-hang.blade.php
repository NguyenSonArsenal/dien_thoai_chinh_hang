@extends('layouts.frontend.main')

@push('style')
    <style>
        .main-content {
            width: 100%;
        }

        .sidebar {
            display: none;
        }
    </style>
@endpush

@section('content')

    <div class="cart-page">
        <div id="wrapper" class="wp-inner clearfix">

            @if (count($productInCarts) > 0)
                <div class="section" id="info-cart-wp">
                    <div class="section-detail table-responsive">

                        @include('layouts.frontend.structures._notification')

                        <table class="table">
                            <thead>
                            <tr>
                                <td>STT</td>
                                <td>Mã sản phẩm</td>
                                <td>Ảnh sản phẩm</td>
                                <td width="35%">Tên sản phẩm</td>
                                <td>Thành tiền</td>
                                <td>Hành động</td>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($productInCarts as $key => $item)
                                <tr>
                                    <td>{{ 1 + $key }}</td>
                                    <td>#{{ $item->id }}</td>
                                    <td>
                                        <a title="" class="thumb">
                                            @if ($item->avatar)
                                                <img src="{{ asset($item->avatar) }}">
                                            @else
                                                <img src="{{ asset('image/lap-top-default.png') }}">
                                            @endif
                                        </a>
                                    </td>
                                    <td>
                                        <a href="{{ frontendRouter('san-pham', ['id' => $item->id]) }}" style="color: black"
                                           title="" class="name-product">{{ $item->name }}</a>
                                    </td>

                                    <td class="sub-total">
                                        @if ($item->price_sell)
                                            {{ formatPriceCurrency($item->price_sell) }}
                                        @else
                                            {{ formatPriceCurrency($item->price_origin / 100 * (100 - $item->sale)) }}
                                        @endif
                                        đ
                                    </td>
                                    <td>
                                        @if (fE())
                                            @php $cart = \App\Models\Cart::where('user_id', fEId())->where('product_id', !empty($item->id) ? $item->id : '')->first(); @endphp
                                            <form method="get"
                                                  action="{{ frontendRouter('cart.delete-item', ['id' => $cart->id]) }}">
                                                @csrf
                                                <button style="border: none" type="submit" title="xoá sản phẩm"  onclick="return confirm('Xóa sản phẩm. Bạn có chắc không?')"
                                                        class="del-product btn-danger"><i class="fa fa-trash-o"></i></button>
                                            </form>
                                        @else
                                            <form method="get"
                                                  action="{{ frontendRouter('cart.delete-item', ['id' => $item->id]) }}">
                                                @csrf
                                                <button style="border: none" type="submit" title="xoá sản phẩm"
                                                        class="del-product btn-danger"><i class="fa fa-trash-o"></i></button>
                                            </form>
                                        @endif

                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="7">
                                    <div class="clearfix">
                                        <p id="total-price" class="fl-right">Tổng giá: <span class="total">{{ formatPriceCurrency($totalPriceCart) }} đ</span>
                                        </p>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    <div class="clearfix">
                                        <div class="fl-right">
                                            <a class="btn btn-danger" href="{{ frontendRouter('thanh-toan') }}" title="" id="">Thanh toán</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                <div class="section" id="action-cart-wp">
                    <div class="section-detail">
                        <a href="{{ frontendRouter('home') }}" title="mua tiếp" id="buy-more" class="text-danger">Mua tiếp</a><br>
                    </div>
                </div>
            @else
                <div class="section" id="action-cart-wp">
                    <div class="section-detail">
                        <p class="title"><strong>Giỏ hàng trống.</strong></p>
                    </div>
                </div>

                <div class="section" id="action-cart-wp">
                    <div class="section-detail">
                        <a href="{{ frontendRouter('home') }}" title="mua tiếp" id="buy-more">Mua tiếp</a><br>
                    </div>
                </div>
            @endif

        </div>
    </div>

@endsection
