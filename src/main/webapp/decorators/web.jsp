<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><decorator:title></decorator:title></title>
    <!-- Css Styles -->
    <link rel="stylesheet" href="<c:url value="/template/web/css/bootstrap.min.css" />" type="text/css">
    <link rel="stylesheet" href="<c:url value="/template/web/css/font-awesome.min.css" />" type="text/css">
    <link rel="stylesheet" href="<c:url value="/template/web/css/themify-icons.css" />" type="text/css">
    <link rel="stylesheet" href="<c:url value="/template/web/css/elegant-icons.css" />" type="text/css">
    <link rel="stylesheet" href="<c:url value="/template/web/css/owl.carousel.min.css" />" type="text/css">
    <link rel="stylesheet" href="<c:url value="/template/web/css/nice-select.css" />" type="text/css">
    <link rel="stylesheet" href="<c:url value="/template/web/css/jquery-ui.min.css" />" type="text/css">
    <link rel="stylesheet" href="<c:url value="/template/web/css/slicknav.min.css" />" type="text/css">
    <link rel="stylesheet" href="<c:url value="/template/web/css/style.css" />" type="text/css">
    <script src="<c:url value="/template/web/js/jquery-3.3.1.min.js" />"></script>
    <script src="<c:url value="/template/web/js/jquery.validate.min.js"/> "></script>
    <script src="<c:url value="/template/pagination/jquery.twbsPagination.js" />"></script>

    <script src="https://www.google.com/recaptcha/api.js" async defer></script>


</head>
<body>

<div id="preloder">
    <div class="loader"></div>
</div>

<%@ include file="/common/web/header.jsp" %>
<decorator:body></decorator:body>
<%@ include file="/common/web/footer.jsp" %>


<script src="<c:url value="/template/web/js/fashi.js" />"></script>
<script src="<c:url value="/template/web/js/register.js" />"></script>
<script src="<c:url value="/template/web/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/template/web/js/jquery-ui.min.js" />"></script>
<script src="<c:url value="/template/web/js/jquery.countdown.min.js" />"></script>
<script src="<c:url value="/template/web/js/jquery.nice-select.min.js" />"></script>
<script src="<c:url value="/template/web/js/jquery.zoom.min.js" />"></script>
<script src="<c:url value="/template/web/js/jquery.dd.min.js" />"></script>
<script src="<c:url value="/template/web/js/jquery.slicknav.js" />"></script>
<script src="<c:url value="/template/web/js/owl.carousel.min.js" />"></script>
<script src="<c:url value="/template/web/js/main.js" />"></script>

<%--Format currency for web 21/1--%>
<script>
    $().ready(function () {
        $('.money').each(function () {
            var value = $(this).text();
            var i = new Intl.NumberFormat('it-IT', {
                style: 'currency',
                currency: 'VND'
            }).format(value);
            $(this).text(i);
        });
    })
</script>
</body>
</html>