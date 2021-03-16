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
    <link rel="stylesheet" href="http://localhost:8080/ProjectWeb_1920/lib/css/styleRestpass.css">

</head>
<body>
<%
    String email = "";
    String code = "";

    if (request.getAttribute("email") != null) {
        email = (String) request.getAttribute("email");
    }
    if (request.getAttribute("code") != null) {
        code = (String) request.getAttribute("code");
    }

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
    <form class="form-resetpass" action="ResetPassFinalProcess" method="post">
        <input type="hidden" name="code" class="password" value="<%=code%>">
        <input type="text" name="recode" class="password" placeholder="Vui lòng nhập mã code đã được gửi vào email của bạn tại đây!">
        <input type="hidden" name="email" class="password" value="<%=email%>">
        <input type="password" name="password" class="password" placeholder="Nhập mật khẩu của bạn">
        <input type="password" name="repassword" class="retype_password" placeholder="Xác nhận lại mật khẩu">
        <input type="submit" class="change_password" value="Xác nhận">
    </form>
</div>
<%--end wrapper--%>

<button style="display: none" type="submit" id="click_btn" class="btn-order" data-toggle="modal"
        data-target="#login-modal"></button>

<%

    String mess = (String) request.getAttribute("forgot_Pass");
    if (mess != null) {
%>
<script>
    $(function () {
        $('#click_btn').click();

        window.onclick = function () {
            window.location.href = 'http://localhost:8080/ProjectWeb_1920/LoginController';
        }
    });

</script>

<%
    }
%>


<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="margin-top: 100px">
        <div class="loginmodal-container">
            <p class="store">Mật khẩu đã thay đổi thành công</p>
            <p class="titel">Mời bạn đăng nhập lại </p>
        </div>
    </div>
</div>


<jsp:include page="footer.jsp"></jsp:include>
<!--Hết footer-->


<script type="text/javascript" src="lib/js/1.js"></script>
</body>
</html>