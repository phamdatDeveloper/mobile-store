<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page import="vn.com.dutmobile.model.AccountModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.com.dutmobile.DAO.AccountDAO" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.AccountDAOImpl" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
    <title>Danh sách tài khoản</title>

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

<div class="" >
    <div class="row section_content">
        <jsp:include page="SlideBar.jsp"></jsp:include>
        <div class="col-md-9" style="overflow: auto;">
            <div id="user_manager_info" class="">
                <div class="row col-md-12">
                    <p class="col-md-9 title-info">Thông Tin Khách Hàng</p>
                    <div class="col-md-3">
                        <a href="<%=UtilsPath.getPath("/Admin/InsertAccount.jsp")%>">
                            <button class="btn"
                                    style="margin-top: 10px;outline: none !important; background-color: #007bff; color: white;">
                                Thêm Tài Khoản
                            </button>
                        </a>
                    </div>
                </div>
                <hr>
                <table id="table-info" class="table table-striped table-bordered " style="width:100%;">
                    <thead>
                    <tr class="header-table">
                        <td class="set">ID</td>
                        <td class="set">UserName</td>
                        <td class="set"> Tên Hiển Thị</td>
                        <td class="set">Email</td>
                        <td class="set">Số điện Thoại</td>
                        <td class="set">Địa chỉ</td>
<%--                        <td class="set">Giới tính</td>--%>
<%--                        <td class="set">Loại tài khoản</td>--%>
                        <td class="set">Sửa</td>
                        <td class="set">Xóa</td>
                    </tr> <!--end header-table-->
                    </thead>
                    <tbody>
                    <%
                        AccountDAOImpl accountDAO = new AccountDAOImpl();
                        ArrayList<AccountModel> listAccount = accountDAO.getAll();
                        for (AccountModel acc : listAccount) {
                    %>
                    <tr>
                        <td><%= acc.getId()%>
                        </td>
                        <td><%=acc.getUsername()%>
                        </td>
                        <td><%= acc.getFullname()%></td>
                        <td><%= acc.getEmail()%>
                        </td>
                        <td><%= acc.getPhoneNumber()%>
                        </td>
                        <td><%= acc.getAddress()%>
                        </td>
<%--                        <td><%= acc.getGender()%></td>--%>
<%--                        <td><%=acc.getType()%>--%>
<%--                        </td>--%>
                        <td>
                            <p data-placement="top" data-toggle="tooltip" title="Chỉnh sửa">
                                <a href="<%=UtilsPath.getPath("Admin/UpdateAccount.jsp?action=Update&id="+acc.getId())%>"><i
                                        class="fas fa-edit" style="cursor: pointer"></i>
                                </a>
                            </p>
                        </td>
                        <td>
                            <p data-placement="top" data-toggle="tooltip" title="Xóa">
                                <a href="<%=UtilsPath.getPath("AdminInsertDeleteAccount?action=Delete&id="+acc.getId())%>"
                                   onclick="return confirm('Bạn chắc chắn chứ ?')"><i
                                        class="fas fa-trash" style="cursor: pointer"></i></a>
                            </p>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                    <tfoot>

                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=UtilsPath.getPathAdmin("lib/js/admin.js")%>"></script>
<script src="<%=UtilsPath.getPathAdmin("vendor/jquery.dataTables.min.js")%>"></script>
<script src="<%=UtilsPath.getPathAdmin("vendor/dataTables.bootstrap4.min.js")%>"></script>
<script>
    $(document).ready(function () {
        $('#table-info').DataTable();
    });
</script>
</body>
</html>
