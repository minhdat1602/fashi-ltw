<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>


<aside class="left-sidebar bg-sidebar">
	<div id="sidebar" class="sidebar sidebar-with-footer">
		<!-- Aplication Brand -->
		<div class="app-brand">
			<a href="<c:url value ="/admin/danh-sach-san-pham?type=list&page=1&maxPageItem=10&sorting=id&sortBy=asc"/>"> <svg class="brand-icon"
					xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid"
					width="30" height="33" viewBox="0 0 30 33">
                        <g fill="none" fill-rule="evenodd">
                            <path class="logo-fill-blue" fill="#7DBCFF"
						d="M0 4v25l8 4V0zM22 4v25l8 4V0z" />
                            <path class="logo-fill-white" fill="#FFF"
						d="M11 4v25l8 4V0z" />
                        </g>
                    </svg> <span class="brand-name">Fashi - Quản trị</span>
			</a>
		</div>
		<!-- begin sidebar scrollbar -->
		<div class="sidebar-scrollbar">

			<!-- sidebar menu -->
			<ul class="nav sidebar-inner" id="sidebar-menu">


				<li class="has-sub"><a class="sidenav-item-link"
					href="javascript:void(0)" data-toggle="collapse"
					data-target="#dashboard" aria-expanded="false"
					aria-controls="dashboard"> <i
						class="mdi mdi-view-dashboard-outline"></i> <span class="nav-text">Danh
							sách</span> <b class="caret"></b>
				</a>
					<ul class="collapse" id="dashboard"
						data-parent="#sidebar-menu">
						<div class="sub-menu">

							<li class="list-product-page"><a class="sidenav-item-link"
								href="<c:url value ="/admin/danh-sach-san-pham?type=list&page=1&maxPageItem=10&sorting=id&sortBy=asc"/>">
									<span class="nav-text">Sản phẩm</span>
							</a></li>

							<li class="list-order-page"><a class="sidenav-item-link"
								href="<c:url value ="/admin/danh-sach-don-hang?page=1&maxPageItem=10&sorting=date_sell&sortBy=asc"/>"> <span
									class="nav-text">Đơn hàng</span>
							</a></li>


						</div>
					</ul></li>

				<li class="has-sub"><a class="sidenav-item-link"
					href="javascript:void(0)" data-toggle="collapse" data-target="#sp"
					aria-expanded="false" aria-controls="charts"> <i
						class="mdi mdi-chart-pie"></i> <span class="nav-text">Quản
							lý</span> <b class="caret"></b>
				</a>
					<ul class="collapse" id="sp" data-parent="#sidebar-menu">
						<div class="sub-menu">

							<li class="has-sub"><a class="sidenav-item-link"
								href="javascript:void(0)" data-toggle="collapse"
								data-target="#product" aria-expanded="false"
								aria-controls="widgets"> <span class="nav-text">Sản
										phẩm</span> <b class="caret"></b>
							</a>
								<ul class="collapse" id="product">
									<div class="sub-menu">
										<li class="list-product-group-page"><a
											href="<c:url value ="/admin/danh-sach-nhom-san-pham?type=list"/>">Nhóm
												sản phẩm</a></li>
										<li class="list-size-page"><a
											href="<c:url value ="/admin/danh-sach-size"/>">Kích
												cỡ</a></li>
										<li class="list-color-page"><a
											href="<c:url value ="/admin/danh-sach-mau"/>">Màu
												sắc</a></li>
										<li class="list-review-page"><a
											href="<c:url value ="/admin/danh-sach-danh-gia?type=list"/>">
												Đánh giá</a></li>
									</div>
								</ul></li>



							<li  class="list-permission-page"><a class="sidenav-item-link"
								href="<c:url value ="/admin/danh-sach-quyen?type=list&sorting=customer"/>">
									<span class="nav-text">Các quyền</span>
							</a></li>
							<li  class="list-customer-page"><a class="sidenav-item-link"
								href="<c:url value ="/admin/danh-sach-nguoi-dung?type=list&page=1&maxPageItem=10&sorting=customer"/>">
									<span class="nav-text">Người dùng</span>
							</a></li>
							<li  class="list-promotion-page"><a class="sidenav-item-link"
								href="<c:url value ="/admin/danh-sach-khuyen-mai?type=list"/>">
									<span class="nav-text">Khuyến mãi</span>
							</a></li>
								
							<li class="list-collection-page"><a class="sidenav-item-link"
								href="<c:url value ="/admin/danh-sach-bo-suu-tap"/>"> <span
									class="nav-text">Bộ sưu tập</span>
							</a></li>



						</div>

					</ul></li>


				<li class="has-sub"><a class="sidenav-item-link"
					href="javascript:void(0)" data-toggle="collapse"
					data-target="#pages" aria-expanded="false" aria-controls="pages">
						<i class="mdi mdi-image-filter-none"></i> <span class="nav-text">Thống
							kê</span> <b class="caret"></b>
				</a>
					<ul class="collapse" id="pages" data-parent="#sidebar-menu">
						<div class="sub-menu">

							<li class="sales-page"><a class="sidenav-item-link"
								href="<c:url value ="/admin/doanh-so?filter=CURRENT_DATE"/>">
									<span class="nav-text">Doanh số</span>
							</a></li>
							<li class="buy-time-page"><a class="sidenav-item-link"
								href="<c:url value ="/admin/luot-mua-hang?page=1&maxPageItem=10&sorting=id&sortBy=asc"/>">
									<span class="nav-text">Lượt mua hàng</span>
							</a></li>
							<li class="feedback-page"><a class="sidenav-item-link"
								href="<c:url value ="/admin/danh-sach-gop-y"/>">
									<span class="nav-text">Góp ý</span>
							</a></li>
						</div>
					</ul></li>



			</ul>

		</div>



	</div>
</aside>
