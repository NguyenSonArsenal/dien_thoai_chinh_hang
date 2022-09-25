<aside class="left-sidebar" data-sidebarbg="skin5">
    <div class="scroll-sidebar">
        <nav class="sidebar-nav">
            <ul id="sidebarnav" class="p-t-30">
                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark" href="{{ route('be.dashboard') }}">
                        <i class="mdi mdi-view-dashboard"></i>
                        <span class="hide-menu">Trang chủ</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark" href="{{ route('be.user.index') }}">
                        <i class="mdi mdi-view-dashboard"></i>
                        <span class="hide-menu">Quản lý người dùng</span>
                    </a>
                </li>

                {{--<li class="sidebar-item">--}}
                    {{--<a class="sidebar-link waves-effect waves-dark" href="{{ route('be.branch.index') }}">--}}
                        {{--<i class="mdi mdi-view-dashboard"></i>--}}
                        {{--<span class="hide-menu">Quản lý thương hiệu</span>--}}
                    {{--</a>--}}
                {{--</li>--}}

                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark" href="{{ route('be.category.index') }}">
                        <i class="mdi mdi-view-dashboard"></i>
                        <span class="hide-menu">Quản lý danh mục</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark" href="{{ route('be.product.index') }}">
                        <i class="mdi mdi-view-dashboard"></i>
                        <span class="hide-menu">Quản lý sản phẩm</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark" href="{{ route('be.order.index') }}">
                        <i class="mdi mdi-view-dashboard"></i>
                        <span class="hide-menu">Quản lý đơn hàng</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark" href="{{ route('be.report.index') }}">
                        <i class="mdi mdi-view-dashboard"></i>
                        <span class="hide-menu">Báo cáo thống kê</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark" href="{{ route('be.logout') }}"
                        onclick="return confirm('Đăng xuất. Bạn có chắc chắn không?')">
                        <i class="mdi mdi-view-dashboard"></i>
                        <span class="hide-menu">Đăng xuất</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</aside>
