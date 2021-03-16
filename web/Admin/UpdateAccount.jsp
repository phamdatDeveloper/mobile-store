<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page import="vn.com.dutmobile.model.ProductModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.ProductDAOimpl" %>
<%@ page import="vn.com.dutmobile.utils.PriceProcess" %>
<%@ page import="vn.com.dutmobile.model.AccountModel" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.AccountDAOImpl" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<%
    AccountModel accountModel = new AccountModel();
    AccountDAOImpl accountDAO = new AccountDAOImpl();
    ArrayList<AccountModel> listAccount = accountDAO.getAll();

    String type_ping = "";
    String fullname_ping = "";
    String email_ping = "";
    String sdt_ping = "";
    String gender_ping = "";
    String dob_ping = "";
    String password_ping = "";
    String repassword_ping = "";
    String active_ping = "";

    if (request.getAttribute("type_ping") != null) {
        type_ping = (String) request.getAttribute("type_ping");
    }
    if (request.getAttribute("fullname_ping") != null) {
        fullname_ping = (String) request.getAttribute("fullname_ping");
    }
    if (request.getAttribute("email_ping") != null) {
        email_ping = (String) request.getAttribute("email_ping");
    }
    if (request.getAttribute("sdt_ping") != null) {
        sdt_ping = (String) request.getAttribute("sdt_ping");
    }
    if (request.getAttribute("gender_ping") != null) {
        gender_ping = (String) request.getAttribute("gender_ping");
    }
    if (request.getAttribute("dob_ping") != null) {
        dob_ping = (String) request.getAttribute("dob_ping");
    }
    if (request.getAttribute("password_ping") != null) {
        password_ping = (String) request.getAttribute("password_ping");
    }
    if (request.getAttribute("repassword_ping") != null) {
        repassword_ping = (String) request.getAttribute("repassword_ping");
    }
    if (request.getAttribute("active_ping") != null) {
        active_ping = (String) request.getAttribute("active_ping");
    }

%>
<div class="" >
    <div class="row section_content">
        <jsp:include page="SlideBar.jsp"></jsp:include>
        <div class="col-md-9">
            <div id="user_manager_edit" class="">
                <p class="title-info">Chỉnh Sửa Thông Tin Khách Hàng</p>
                <form action="<%=UtilsPath.getPath("AdminUpdateAccount")%>" method="post" style="width: 100%;">
                    <table class="table ">
                        <tr>
                            <td><p>Loại tài khoản:</p></td>
                            <td><select class="select-tag" name="type" id="" style="width: 300px;">
                                <option value="no">Chọn</option>
                                <option value="admin">Quản trị viên</option>
                                <option value="user">Người dùng</option>
                            </select></td>
                            <td><span style="color:red;"><%=type_ping%></span></td>
                        </tr>
                        <tr>
                            <td>
                                <p>Tên hiển thị:</p>
                            </td>
                            <%
                                if (request.getParameter("id") != null) {
                                    accountModel = accountDAO.getAccountById(request.getParameter("id"));
                                }
                            %>
                            <td>
                                <input type="text" name="fullname" placeholder="Nhập tên hiển thị" class=""
                                       value="<%=accountModel.getFullname()%>">
                            </td>
                            <td><span style="color:red;"><%=fullname_ping%></span></td>
                        </tr>
                        <tr>
                            <td><p>Email:</p></td>
                            <td><input name="email" placeholder="Nhập email" class="margin8" type="text"
                                       value="<%=accountModel.getEmail()%>"></td>
                            <td><span style="color: red"><%=email_ping%></span></td>
                        </tr>
                        <tr>
                            <td><p>Số điện thoại:</p></td>
                            <td><input type="text" name="sdt" placeholder="Nhập số điện thoại" class=""
                                       value="<%=accountModel.getPhoneNumber()%>"></td>
                            <td><span style="color: red"><%=sdt_ping%></span></td>
                        </tr>
                        <tr>
                            <td><p>Giới tính:</p></td>
                            <td>
                                <select class="select-tag" name="gender" style="width: 300px;">
                                    <option value="no">Chọn</option>
                                    <option value="Nam">Nam</option>
                                    <option value="Nu">Nữ</option>
                                </select>
                            </td>
                            <td><span style="color: red"><%=gender_ping%></span></td>
                        </tr>
                        <tr>
                            <td><p>Địa chỉ:</p></td>
                            <td><textarea name="address" cols="50" rows="10"></textarea></td>
                        </tr>
                        <tr>
                            <td><p>Ngày sinh:</p></td>
                            <td><input type="date" name="dob" placeholder="YYYY-MM-DD" required="required"
                                       style=""></td>
                            <td><span style="color: red"><%=dob_ping%></span></td>
                        </tr>
                        <tr>
                            <td><p>Mật khẩu:</p></td>
                            <td><input type="password" name="password" placeholder="Nhập mật khẩu" class=""
                                       value=""></td>
                            <td><span style="color: red"><%=password_ping%></span></td>
                        </tr>
                        <tr>
                            <td><p>Xác nhận mật khẩu:</p></td>
                            <td><input type="password" name="repassword" placeholder="Xác nhận mật khẩu" class="" value="">
                            </td>
                            <td><span style="color: red"><%=repassword_ping%></span></td>
                        </tr>
                        <tr>
                            <td><p>Active:</p></td>
                            <td><label style="cursor: pointer; margin-right: 50px" value="1">
                                <input name="active" type="radio" value="1">
                                <p style="">Có</p>
                            </label>
                                <label style="cursor: pointer;" value="0">
                                    <input name="active" type="radio" value="0">
                                    <p style="">Không</p>
                                </label></td>
                            <td><span style="color: red"><%=active_ping%></span></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <div class="contain-btn">
                                    <input type="hidden" name="action" value="Update">
                                    <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                                    <button type="submit" class="btn btn-success">Lưu</button>
                                    <button type="reset" class="btn btn-danger yellow">Reset</button>
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
