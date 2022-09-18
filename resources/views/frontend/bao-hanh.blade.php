@extends('layouts.frontend.main')

@push('style')
    <style>
        .main-content {
            background: #fff;
            padding: 20px 15px;
        }
    </style>
@endpush

@section('content')

    <div class="section" id="detail-blog-wp">
        <div class="section-detail">
            <div class="detail">
                <p>
                    <div class="col-inner">
                        <h2><strong style="color: #de3416; font-weight: bold; font-size: 20px">CHÍNH SÁCH BẢO
                                HÀNH</strong></h2>
                        <ol class="mb-2 mt-2">
                            <li>Bảo hành từ 1 năm đến 5 năm theo chính sách của từng sản phẩm với tất cả các lỗi của nhà
                                sản xuất, lỗi kỹ thuật cho các bộ phận: Kính ngoài, kính trong, khuy bấm, dây, quai,
                                khóa, vỏ mũ….
                            </li>
                            <li>Riêng đối với dòng sản phẩm mũ trùm đầu, bảo hành miễn phí hoàn toàn các bộ phận hốc
                                gió, đuôi gió, ngàm kính (Pat kính) do bất kì nguyên nhân nào.
                            </li>
                            <li><span data-text-color="alert">Loại trừ bảo hành:</span> các hư hỏng, hao mòn tự nhiên do
                                quá trình sử dụng rơi rớt, va đập, có tác động của ngoại lực hoặc cố tình đập phá gây hư
                                hại đến sản phẩm.
                            </li>
                        </ol>
                        <p>
                            <img src="{{ asset('frontend/image/bao_hanh.png') }}" alt="">
                        </p>
                    </div>
                </p>
            </div>
        </div>
    </div>

@endsection
