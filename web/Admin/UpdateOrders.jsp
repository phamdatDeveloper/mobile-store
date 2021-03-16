<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page import="vn.com.dutmobile.model.ProductModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.ProductDAOimpl" %>
<%@ page import="vn.com.dutmobile.utils.PriceProcess" %>
<%@ page import="vn.com.dutmobile.model.AccountModel" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.AccountDAOImpl" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
    <title>Chỉnh sửa tài khoản</title>
    <script type="text/javascript" src="<%=UtilsPath.getPathAdmin("vendor/jquery-3.4.1.min.js")%>"></script>
    <link rel="stylesheet" href="<%=UtilsPath.getPathAdmin("vendor/jquery-ui.css")%>">
    <script src="<%=UtilsPath.getPathAdmin("vendor/jquery-ui.js")%>"></script>
    <script type="text/javascript" src="<%=UtilsPath.getPathAdmin("vendor/bootstrap.min.js")%>"></script>
    <link rel="stylesheet" href="<%=UtilsPath.getPathAdmin("vendor/bootstrap.min.css")%>">
    <link rel="stylesheet" href="<%=UtilsPath.getPathAdmin("vendor/all.css")%>">
    <script type="text/javascript" src="<%=UtilsPath.getPathAdmin("vendor/all.js")%>"></script>
    <link rel="stylesheet" href="<%=UtilsPath.getPathAdmin("lib/css/style.css")%>">
    <link rel="stylesheet" href="<%=UtilsPath.getPathAdmin("lib/css/AdminStyle.css")%>">
    <link rel="stylesheet" href="<%=UtilsPath.getPathAdmin("vendor/dataTables.bootstrap4.min.css")%>">
    <link rel="stylesheet" href="<%=UtilsPath.getPathAdmin("vendor/bootstrap.css")%>">
    <script src="<%=UtilsPath.getPathAdmin("lib/ckeditor/ckeditor.js")%>"></script>
</head>
<body>

<div class="">
    <div class="row section_content">
        <jsp:include page="SlideBar.jsp"></jsp:include>
        <div class="col-md-9">
            <div id="user_manager_edit" class="">
                <p class="title-info">Chỉnh Sửa Thông Tin Đơn Hàng </p>
                <form action="<%=UtilsPath.getPath("UpdateOrders")%>" method="post" style="width: 100%;">
                    <table class="table ">

                        <tr>
                            <td>
                                <p>Trạng Thái:</p>
                            </td>
                            <td>
                                <select name="status" style="width: 40%">
                                    <option value="Đã Xử lí">Đã xử lí</option>
                                    <option value="Đang Xử lí">Đang xử lí</option>
                                    <option value="Hủy">Hủy</option>
                                </select>
                            </td>
                            <td><span style="color:red;"></span></td>
                        </tr>


                        <tr>
                            <td></td>
                            <td>
                                <div class="contain-btn" style="margin-left: 50px">
                                    <input type="hidden" name="action" value="Update">
                                    <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                                    <button type="submit" class="btn btn-success">Lưu</button>
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=UtilsPath.getPathAdmin("lib/js/admin.js")%>"></script>
<script src="<%=UtilsPath.getPathAdmin("vendor/jquery.dataTables.min.js")%>"></script>
<script src="<%=UtilsPath.getPathAdmin("vendor/dataTables.bootstrap4.min.js")%>"></script>
</body>
</html>
