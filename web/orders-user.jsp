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
    <%--    <link rel="stylesheet" href="<%=UtilsPath.getPathAdmin("vendor/bootstrap.css")%>">--%>
</head>
<body>

<%
    if (session.getAttribute("account") == null) {
        response.sendRedirect("login.jsp");
    }
%>

<!--header-->
<!--<logo - login-reg>-->
<jsp:include page="header.jsp"></jsp:include>
<!--Hết header-->

<div class="tabs" style="padding-top: 100px">
    <div class="container">
        <div class="row">
            <jsp:include page="user-tab.jsp"></jsp:include>
            <div class="col-xl-6" style="flex: 0 0 83%;max-width: 100%;">
                <div class="tab-pane" id="tab_c">
                    <div class="password" style="background: #FFFFFF ;">
                        <table id="table-info-order" class="table table-striped table-bordered" style="width:100%">
                            <thead>
                            <tr class="header-table">
                                <td style="text-align: center">Mã Đơn Hàng</td>
                                <td style="text-align: center">Tên Sản Phẩm</td>
                                <td style="text-align: center">Ngày Đặt</td>
                                <td style="text-align: center">Địa Chỉ</td>
                            </tr> <!--end header-table-->
                            </thead>
                            <tbody>
                            <%
                                ResultSet set = (ResultSet) request.getAttribute("odersUser");

                                while (set.next()) {

                            %>
                            <tr style="text-align: center">
                                <td><%=set.getInt("id")%></td>
                                <td><%=set.getString("productname")%></td>
                                <td><%=set.getTimestamp("ngay_gio")%></td>
                                <td><%=set.getString("address")%></td>

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
    </div>
</div>

<jsp:include page="button-scroll-top.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>
<!--Hết footer-->

<script type="text/javascript" src="lib/js/1.js"></script>
<script src="<%=UtilsPath.getPathAdmin("vendor/jquery.dataTables.min.js")%>"></script>
<script src="<%=UtilsPath.getPathAdmin("vendor/dataTables.bootstrap4.min.js")%>"></script>
<script>
    // $(document).ready(function () {
    //     $('#table-info-order').DataTable();
    // });
</script>
</body>
</html>