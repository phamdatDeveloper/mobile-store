<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page import="vn.com.dutmobile.model.AccountModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.com.dutmobile.DAO.AccountDAO" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.AccountDAOImpl" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
    <title>Danh sách đặt hàng</title>

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
        <div class="col-md-9">
            <div id="order_manager_info" class="">
                <p class="title-info">Thông Tin Đơn Hàng</p>
                <hr>

                <table id="table-info-order" class="table table-striped table-bordered ">
                    <thead>
                    <tr class="header-table">
                        <%--<td><input type="checkbox" name="checkbox-table" value="1"></td>--%>
                        <td>Mã Đơn Hàng</td>
                        <td>Tên Khách Hàng</td>
                        <td>Thanh Toán</td>
                        <td>Trạng Thái</td>
                        <td>Tác vụ</td>
                    </tr> <!--end header-table-->
                    </thead>
                    <tbody>
                    <%
                        ResultSet resul = (ResultSet) request.getAttribute("getcart");
                        String done ="Đã Xử lí";
                        String huy = "Hủy";
                        while (resul.next()) {

                    %>
                    <tr>
                        <%--<td><input type="checkbox" name="checkbox-table" value="1"></td>--%>
                        <td><%=resul.getInt("id")%>
                        </td>
                        <td><%=resul.getString("fullname")%></td>
                        <td><%=resul.getString("thanh_toan")%>
                        </td>
                        <td><%=resul.getString("trang_thai")%>
                        </td>

                        <td>
                            <%
                                if(!resul.getString("trang_thai").equals(done) && !resul.getString("trang_thai").equals(huy)){
                            %>
                            <a  href="<%=UtilsPath.getPath("Admin/UpdateOrders.jsp?id="+resul.getInt("id"))%>"><i
                                    class="fas fa-edit" style="cursor: pointer"></i></a>
                            <%
                                }
                            %>

                            <a href="<%=UtilsPath.getPath("DeleteOdersProdcut?id="+ resul.getInt("id") )%>"><i class="fas fa-trash" style="cursor: pointer"></i></a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                    <tfoot></tfoot>
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
        $('#table-info-order').DataTable();
    });
</script>
</body>
</html>
