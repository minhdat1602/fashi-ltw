<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm câu hỏi thường gặp</title>
</head>
<body>
<input type="hidden" id="flag-index" value=".faq-page">
	<h3 class="ml-4 mt-3">Thêm câu hỏi thường gặp</h3>
	<form action="" class="p-5">

		<div class="form-group">
			<label for="exampleFormControlInput1">Câu hỏi</label> <input
				type="text" class="form-control" id="exampleFormControlInput1"
				placeholder="Câu hỏi">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1" class="d-block">Câu trả lời</label> 
			<textarea class="p-3" rows="12" cols="90" placeholder="Câu trả lời"></textarea>
		</div>


	</form>
	<a style="color: white; text-decoration: none; width: 20%;"
		href="<c:url value ="/view/admin/add-product.jsp"/>" type="button"
		class="btn btn-info ml-5 mb-3"> Thêm </a>
</body>
</html>