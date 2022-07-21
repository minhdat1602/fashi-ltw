<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="apiURL" value="/api/danh-gia"></c:url>
<c:url var="newURL" value="/admin/danh-sach-danh-gia"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết đánh giá</title>
</head>
<body>
	<input type="hidden" id="flag-index" value=".list-review-page">
	<h2 class="ml-4 mt-3">Chi tiết đánh giá</h2>
	<div class="customer-review-option ml-5">
		<h3>ID: ${product.id}</h3>
		<h3>Tên: ${product.name}</h3>
		<img alt="" src="<c:url value="${product.imageUrl}"/>">
		<div class="personal-rating">
			<h5>Số sao trung bình: ${product.avgStar}</h5>

		</div>
		<h2>${listReviewDetails.size()} Bình luận</h2>
		<div class="comment-option">
			<div class="co-item">
				<c:forEach items="${listReviewDetails}" var="review">
					<form id="submitForm${review.id}">

						<div class="avatar-text">
							<h5>Số sao: ${review.vote}</h5>
							<h5>
								${review.user.firstName} ${review.user.lastName} <span>${review.dateReview}</span>
							</h5>
							<div class="at-reply mb-1">Bình luận: ${review.comment}</div>
							<h6>
								<c:if test="${empty review.reply}">
									Trả lời : <textarea id="reply${review.id}" name="reply" rows="1" cols="50"></textarea>
								</c:if>
								<c:if test="${not empty review.reply}">
									Trả lời : <textarea id="reply${review.id}" name="reply" rows="1" cols="50">${review.reply}</textarea>
								</c:if>
							</h6>
							<input type="hidden" name="id" value="${review.id}" class="f-13"
								style="height: 30px; width: 250px" />
							<button data-review="${review.id}" type="button"
								class="btnUpdate btn btn-danger">Gửi</button>
						</div>
					</form>
				</c:forEach>


			</div>


		</div>
		<script type="text/javascript">
			$(".btnUpdate").click(function() {
				var data = {};
				var stt = $(this).attr('data-review');
				var content = $('#reply'+stt).val();
				var dataForm = $("#submitForm" + stt).serializeArray();
				$.each(dataForm, function(i, v) {
					data["" + v.name + ""] = v.value;
				})
				console.log(stt);
				$.ajax({
					url : '${apiURL}',
					type : 'PUT',
					contentType : 'application/json',
					dataType : 'text',
					data : JSON.stringify(data),
					success : function(result) {
					},
					error : function(error) {
						alert("Trả lời thất bại");
					}
				})

			})

			
		</script>
</body>
</html>