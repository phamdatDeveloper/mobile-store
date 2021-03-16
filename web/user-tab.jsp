<%@ page import="vn.com.dutmobile.model.AccountModel" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang thông tin cá nhân</title>
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
    <link rel="stylesheet" href="lib/css/userStyle.css">
    <%--    data table--%>
    <link rel="stylesheet" href="<%=UtilsPath.getPathAdmin("vendor/dataTables.bootstrap4.min.css")%>">
</head>
<body>

<%
    if (session.getAttribute("account") == null) {
        response.sendRedirect("login.jsp");
    }
%>

<div class="col-xl-2">
    <div class="haed ">

    </div>
    <div class="filler">
        <i class="fas fa-user-circle" style="color: red"></i>
        <p style="float: right ; ">Tài khoản của tôi</p>
    </div>

    <ul class="nav nav-pills nav-stacked flex-column">
        <li><a href="<%=UtilsPath.getPath("user.jsp")%>">Hồ Sơ</a></li>
        <li><a href="<%=UtilsPath.getPath("change-pw-user.jsp")%>">Đổi Mật Khẩu</a></li>
        <li><a href="<%=UtilsPath.getPath("MyOrders")%>">Đơn hàng của tôi</a></li>
    </ul>

</div>
<%--end col-xl-2--%>

<script type="text/javascript" src="lib/js/1.js"></script>
</body>
</html>