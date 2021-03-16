<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đặt lại mật khẩu</title>
    <!--Jquery-->
    <script type="text/javascript" src="vendor/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="vendor/jquery-migrate-3.1.0.min.js"></script>
    <!--Jquery-->
    <!--Slick-->
    <script type="text/javascript" src="vendor/slick/slick.min.js"></script>
    <link rel="stylesheet" type="text/css" href="vendor/slick/slick.css"/>
    <!--Slick-->
    <!--bs and fa-->
    <script type="text/javascript" src="vendor/bootstrap.min.js"></script>
    <link rel="stylesheet" href="vendor/bootstrap.min.css">
    <link rel="stylesheet" href="vendor/all.css">
    <script type="text/javascript" src="vendor/all.js"></script>
    <!--bs and fa-->
    <!--animate-->
    <link rel="stylesheet" href="vendor/animate.css">
    <!--animate-->
    <link rel="stylesheet" href="lib/css/styleRestpass.css">

</head>
<body>
<%
    String message = "";

    if (request.getAttribute("message") != null) {
        message = (String) request.getAttribute("message");
    }
%>

<!--header-->
<!--<logo - login-reg>-->
<jsp:include page="header.jsp"></jsp:include>
<!--Hết header-->
<div class="wrapper">
    <span style="color: red"><%=message%></span>
    <h1>Thay đổi mật khẩu</h1>
    <form class="form-resetpass" action="ResetPassProcessCheckMail" method="post">
        <input type="email" name="email" class="password" placeholder="Hãy nhập email của bạn để lấy lại mật khẩu">
        <input type="submit" class="change_password" value="Xác nhận">
    </form>
</div>
<%--end wrapper--%>


<jsp:include page="footer.jsp"></jsp:include>
<!--Hết footer-->


<script type="text/javascript" src="lib/js/1.js"></script>
</body>
</html>