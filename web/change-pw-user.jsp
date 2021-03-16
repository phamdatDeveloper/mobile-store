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
    <link rel="stylesheet" href="http://localhost:8080/ProjectWeb_1920/lib/css/userStyle.css">
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
<%
    String text_passOld = "";
    String flase_pass = "";
    String password_ping = "";
    if (request.getAttribute("text_pass") != null) {
        text_passOld = (String) request.getAttribute("text_pass");
    }
    if (request.getAttribute("text_false") != null) {
        flase_pass = (String) request.getAttribute("text_false");
    }
    if (request.getAttribute("password_ping") != null) {
        password_ping = (String) request.getAttribute("password_ping");
    }
%>

<div class="tabs" style="padding-top: 100px">
    <div class="container">
        <div class="row">
            <jsp:include page="user-tab.jsp"></jsp:include>
            <div class="col-xl-6" style="flex: 0 0 83%;max-width: 100%;">
                <div class="tab-pane" id="tab_d">
                    <div class="bank" style="background: #FFFFFF ; height: 700px">
                        <div class="DC" style="height: 125px">
                            <div class="leftBank" style="float: left; overflow: auto">
                                <h3 style="margin: 0px">Thêm mật khẩu</h3>
                                <p style="color:dimgray ">Để bảo mật tài khoản, vui lòng không chia sẻ mật khẩu
                                    cho người khác</p>
                            </div>
                            <div style="width: 90%;height: 1px;background:grey;float: left; margin-left: 45px"></div>
                        </div>
                        <div class="DCForm" style="height: 200px; margin-left: 250px">
                            <form style="width: 450px" action="UpdatePasswordUser" method="post">
                                <div class="User userES Diachi">
                                    <label for="Mkc">Mật khẩu cũ</label>
                                    <span style="color: red"><%=text_passOld%></span>
                                    <input type="password" id="Mkc" name="passwordOld"
                                           placeholder="Nhập mật khẩu hiện tại"
                                           class="Input-sc-1sflv1m-0 coLFjn"
                                           value="" required>
                                </div>
                                <div class="User userES Diachi">
                                    <label for="Mk">Mật khẩu mới</label>
                                    <span style="color: red"><%=password_ping%></span>
                                    <input type="password" id="MK" name="passwordNew"
                                           placeholder="Nhập vào mật khẩu mới"
                                           class="Input-sc-1sflv1m-0 coLFjn"
                                           value="" required>
                                </div>

                                <div class="User userES Diachi">
                                    <label for="Mkm">Nhập lại mật khẩu</label>
                                    <span style="color: red"><%=flase_pass%></span>
                                    <input type="password" id="MKm" name="password"
                                           placeholder="Xác nhận lại mật khẩu"
                                           class="Input-sc-1sflv1m-0 coLFjn"
                                           value="" required>
                                </div>

                                <div>

                                    <button type="submit" class="btGui">Xác Nhận</button>
                                </div>
                            </form>
                        </div>
                        <%--                        model--%>

                        <%--                        --%>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<button style="display: none" type="submit" id="click_btn" class="btn-order" data-toggle="modal"
        data-target="#login-modal"></button>

<%

    String mess = (String) request.getAttribute("pass_success");
    if (mess != null) {
%>
<script>
    $(function () {
        $('#click_btn').click();
        <%
                     session.removeAttribute("account");
                   %>
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
            <%--            <p class="titel"></p>--%>
            <p class="store">Mật khẩu đã thay đổi thành công</p>
            <p class="store">Mời bạn đăng nhập lại</p>
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