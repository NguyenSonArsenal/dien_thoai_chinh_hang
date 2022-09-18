@extends('backend.layout.main')

@section('content')
    <div class="content-page teacher-page">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">Sản phẩm</h4>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            @include('backend.layout.structures._notification')

                            <div class="card-body__head card-body__filter">
                                <h5 class="card-title bold">Bộ lọc</h5>
                            </div>

                            <!-- From search -->
                            <form method="GET" action="{{ route('be.product.index') }}" class="mb-5" id="form-search">
                                <div class="form-row">
                                    <div class="col-md-1">
                                        <input type="text" name="id" class="form-control" placeholder="ID" value="{{ request('id') }}">
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" name="name" class="form-control" placeholder="Tên" value="{{ request('name') }}">
                                    </div>

                                    <div class="col-md-2">
                                        <div class="my-select2">
                                            <select class="my-select2__select2 select2-wrapper" name="category_id">
                                                <option selected readonly value="">--- Danh mục ---</option>
                                                @foreach($categories as $item)
                                                    <option value="{{ arrayGet($item, 'id') }}"
                                                            {{ request('category_id') == arrayGet($item, 'id') ? "selected" : '' }}>
                                                        {{ arrayGet($item, 'name') }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-2">
                                        <div class="my-select2">
                                            <select class="my-select2__select2 select2-wrapper" name="hot">
                                                <option selected readonly value="">--- SP Nổi bật ---</option>
                                                <option value="{{ getConfig('product-hot') }}"
                                                        {{ !is_null(request('hot')) && request('hot') == getConfig('product-hot') ? "selected" : '' }}>Có</option>
                                                <option value="{{ getConfig('product-no-hot') }}"
                                                        {{ !is_null(request('hot')) && request('hot') == getConfig('product-no-hot') ? "selected" : '' }}>Không</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-body__head card-body__filter text-center">
                                    <button type="submit" class="btn btn-cyan btn-sm">Tìm kiếm</button>
                                </div>
                            </form>

                            <div class="card-body__head d-flex">
                                <h5 class="card-title">Danh sách sản phẩm</h5>
                                <a href="{{route('be.product.create')}}">
                                    <button type="button" class="btn btn-cyan btn-sm">Thêm mới</button>
                                </a>
                            </div>

                            <div id="zero_config_wrapper" class="dataTables_wrapper dt-bootstrap4">

                                <table class="table table-striped table-bordered dataTable" role="grid">
                                    <thead>
                                        <tr>
                                            <th scope="col" width="50px">STT</th>
                                            <th scope="col" width="300px">Tên</th>
                                            <th scope="col">Danh mục</th>
                                            <th scope="col">Ảnh đại diện</th>
                                            <th scope="col">Giá (VNĐ)</th>
                                            <th scope="col">Nổi bật</th>
                                            <th scope="col">Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($list as $key => $entity )
                                        <tr>
                                            <td>{{ getSTTBackend($list, $key) }}</td>
                                            <td>{{ $entity->name }}</td>
                                            <td>{{ !empty($entity->category->name) ? $entity->category->name : "" }}</td>
                                            <td>
                                                @if ($entity->avatar)
                                                    <img src="{{ asset($entity->avatar) }}" alt="" width="50px">
                                                @else
                                                    <img src="{{ asset('backend/image/no-image.jpg') }}" alt="" width="50px">
                                                @endif
                                            </td>
                                            <td>
                                                Giá gốc: {{ formatPriceCurrency($entity->price_origin) }} <br>
                                                Sale: {{ $entity->sale }} %<br>
                                                Giá bán: {{ formatPriceCurrency($entity->price_sell) }} <br>
                                            </td>
                                            <td>
                                                @if ($entity->hot == getConfig('product-hot'))
                                                    <span class="text-danger">Có</span>
                                                @else
                                                    <span class="text-info">Không</span>
                                                @endif
                                            </td>
                                            <td>
                                                <div class="comment-footer d-flex">
                                                    <a href="{{ route('be.product.edit', ['product' => $entity->id]) }}">
                                                        <button type="button" class="btn btn-cyan btn-xs">Sửa</button>
                                                    </a>
                                                    <form action="{{ route('be.product.destroy', ['product' => $entity->id]) }}" method="post">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="btn-danger btn btn-xs rounded"
                                                                onclick="return confirm('Xoá. Bạn có chắc không?')"
                                                        >
                                                            Xóa
                                                        </button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>

                                <!-- Pagination -->
                                {{ $list->appends(request()->all())->links('pagination::bootstrap-4') }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop
