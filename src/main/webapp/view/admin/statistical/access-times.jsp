<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lượt truy cập</title>
<script
	src="<c:url value="/template/admin/assets/plugins/jquery/jquery.min.js" />"></script>
</head>
<body>
<input type="hidden" id="flag-index" value=".access-time-page">
	<h3 class="ml-4 mt-3">Lượt truy cập</h3>
	<div class="product-show-option">
		<div class="row">
			<div class="col-lg-7 col-md-7">
				<div class="select-option">
					<select id="sorting" class="sorting">
						<option value="">Trong ngày</option>
						<option value="">Trong tuần</option>
						<option value="">Tháng này</option>
						<option value="">Tháng trước</option>
						<option value="">Tất cả</option>
					</select> <label for="sorting" id="labelForSorting">Thời gian: </label> <select
						id="p-show" class="p-show">
						<option value="">10</option>
						<option value="">15</option>
						<option value="">20</option>
					</select> <label for="p-show" id="labelForTotalItem">Hiển thị:</label>
				</div>
			</div>
		</div>
	</div>
	<div class="scrollDiv">
		<table class="table text-center">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Tên trang</th>
					<th scope="col">Lượt truy cập</th>
				</tr>
			</thead>
			<tbody class="scrollDiv">
				<tr>
					<th scope="row">index.html</th>	
					<td>150</td>
				</tr>
				<tr>
					<th scope="row">login.html</th>	
					<td>70</td>
				</tr>
				
				<tr>
					<th scope="row">register.html</th>	
					<td>78</td>
				</tr>
				<tr>
					<th scope="row">about.html</th>	
					<td>55</td>
				</tr>
				<tr>
					<th scope="row">product.html</th>	
					<td>66</td>
				</tr>
				
				<tr>
					<th scope="row">shop.html</th>	
					<td>52</td>
				</tr>
				<tr>
					<th scope="row">shopping-cart.html</th>	
					<td>59</td>
				</tr>
				<tr>
					<th scope="row">order-details.html</th>	
					<td>33</td>
				</tr>
				
				<tr>
					<th scope="row">manager-account.html</th>	
					<td>22</td>
				</tr>
				<tr>
					<th scope="row">list-order.html</th>	
					<td>45</td>
				</tr>
				<tr>
					<th scope="row">feedback.html</th>	
					<td>12</td>
				</tr>
				
				<tr>
					<th scope="row">favorite-product.html</th>	
					<td>55</td>
				</tr>
				
				<tr>
					<th scope="row">faq.html</th>	
					<td>35</td>
				</tr>
				<tr>
					<th scope="row">exchange-policy.html</th>	
					<td>9</td>
				</tr>
				<tr>
					<th scope="row">contact.html</th>	
					<td>8</td>
				</tr>
				
				<tr>
					<th scope="row">check-out.html</th>	
					<td>92</td>
				</tr>
				<tr>
					<th scope="row">change-password.html</th>	
					<td>63</td>
				</tr>
				
			</tbody>
		</table>
	</div>



</body>
</html>