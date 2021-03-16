<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page import="vn.com.dutmobile.model.AccountModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.com.dutmobile.DAO.AccountDAO" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.AccountDAOImpl" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="vn.com.dutmobile.model.TypeProductModel" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.TypeProductDAOImpl" %>
<%@ page import="vn.com.dutmobile.DAO.TypeProductDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
    <title>Danh sách phân loại</title>

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

    <Style>
        td{
            text-align: center;
        }
    </Style>
</head>
<body>

<div class="" >
    <div class="row section_content">
        <jsp:include page="SlideBar.jsp"></jsp:include>
        <div class="col-md-9">
            <div id="order_manager_info" class="">

                <div class="row" style="width: 100%;">
                    <p class="col-md-10 title-info">Danh sách phân loại</p>
                    <div class="col-md-2">
                        <a href="http://localhost:8080/ProjectWeb_1920/Admin/InsertType.jsp">
                            <button id="btn-addnew">Thêm</button>
                        </a>
                    </div>
                </div>
                <hr>

                <table id="table-info-order" class="table table-striped table-bordered ">
                    <thead>
                    <tr class="header-table">
                        <td>Tên phân loại</td>
                        <td>Hiển thị</td>
                        <td>Tác vụ</td>
                    </tr> <!--end header-table-->
                    </thead>
                    <tbody>
                    <%
                        TypeProductDAOImpl typeProduct = new TypeProductDAOImpl();
                        ArrayList<TypeProductModel> listType = typeProduct.getAllType();
                        for (TypeProductModel type : listType) {
                            String srcActiveIcon = "";
                            if (type.getActive() == 1) {
                                srcActiveIcon = "images/yes.png";
                            } else {
                                srcActiveIcon = "images/no.png";
                            }
                    %>
                    <tr>
                        <td style="text-align: center;font-weight: bold"><%=type.getType()%></td>
                        <td><img src="<%=UtilsPath.getPath(srcActiveIcon)%>" alt="" style="width: 30px;height: 30px;"></td>
                        <td>
                            <a href="<%=UtilsPath.getPath("Admin/UpdateType.jsp?id="+type.getId())%>"><i
                                    class="fas fa-edit" style="cursor: pointer;margin-right: 14px;"></i></a>
                            <a href="<%=UtilsPath.getPath("DeleteType?id="+type.getId())%>"> <i
                                    class="fas fa-trash" style="cursor: pointer"></i></a>
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

