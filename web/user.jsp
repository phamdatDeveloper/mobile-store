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

<div class="tabs" style="padding-top: 100px">
    <div class="container">
        <div class="row">
            <jsp:include page="user-tab.jsp"></jsp:include>
            <div class="col-xl-6" style="flex: 0 0 83%;max-width: 100%;">
                <div class="tab-content">
                    <div class="tab-pane active" id="tab_a">
                        <h2 style="margin: 0px">Hồ sơ của tôi</h2>
                        <%
                            AccountModel user = (AccountModel) session.getAttribute("account");
                        %>
                        <p style="font-size: 17px">Quản lí thông tin hồ sơ tài khoản</p>
                        <div style="width: 100%; height: 1px; background: black"></div>
                        <div class="left" style="float: left;margin-top: 20px">
                            <form action="http://localhost:8080/ProjectWeb_1920/UpdateUser" method="post">
                                <div class="User userES">
                                    <label for="hoten">Họ tên</label>
                                    <input type="text" id="hoten" name="hoten"
                                           placeholder="Nhập họ tên" class="Input-sc-1sflv1m-0 coLFjn"
                                           value="<%=user.getFullname()%>">
                                </div>
                                <div class="User userES">
                                    <label for="sdt">SĐT</label>
                                    <input type="text" id="sdt" name="sdt"
                                           placeholder="Nhập số điện thoại" class="Input-sc-1sflv1m-0 coLFjn"
                                           value="<%=user.getPhoneNumber()%>">
                                </div>

                                <div class="User userES usEmail">
                                    <label for="email">Email</label>
                                    <input type="text" id="email" name="email"
                                           placeholder="Nhập vào email" class="Input-sc-1sflv1m-0 coLFjn"
                                           value="<%=user.getEmail()%>">
                                </div>

                                <div class="User userES usEmail">
                                    <label for="address">Địa chỉ</label>
                                    <input type="text" id="address" name="address"
                                           placeholder="Nhập địa chỉ" class="Input-sc-1sflv1m-0 coLFjn"
                                           value="<%=user.getAddress()%>">
                                </div>

                                <div class="User userES" style="margin: 20px 0px">
                                    <label style="margin-left: 20px">Giới tính</label>
                                    <%
                                        String gender = "";
                                        if (user.getGender() == "Nam") {
                                            gender = "checked";
                                        } else {
                                            gender = "";
                                        }
                                    %>
                                    <span style="width: 300px; margin-right: 50px">
                                           <label style="cursor: pointer;" value="Nam">
                                                    <input style="margin-left: 15px; margin-top: 5px" id="gen"
                                                           name="gender" type="radio"
                                                           value="Nam" <%=gender%>><p
                                                   style="float: left; padding-left: 15px">Nam</p>
                                           </label>

                                             <label style="cursor: pointer; float: right; margin-right: 200px"
                                                    value="Nu">
                                                    <input id="gen1" name="gender" type="radio" value="Nu" <%=gender%>><p
                                                     style="float: right;margin-left: 15px;margin-top: 5px;">Nữ</p>
                                           </label>
                                       </span>
                                </div>
                                <div class="User userES">
                                    <label>Ngày sinh</label>
                                    <div style="width: 80%; display: flex ; float: right">
                                        <input type="date" name="dob" required="required"
                                               value="<%=user.getDateOfBirth()%>">
                                    </div>
                                </div>

                                <div class="User userES">
                                    <div style="width: 88%; display: inline-block ; margin-left: 90px">
                                        <p style="margin: 10px 0px 15px; font-size: 12px; line-height: 22px;">
                                            <button type="submit" class="User btTTk">Lưu</button>
                                    </div>

                                </div>
                            </form>
                        </div>
                        <%--                        <div class="right" style=" width: 300px; height: 300px; float: right ; margin-top: 70px ;">--%>

                        <%--                            <div class="top" style="padding-left: 100px;padding-top: 20px">--%>
                        <%--                                <div><img src="images/1.jpg" width="100px " height=" 100px" style="border-radius: 50%"/>--%>
                        <%--                                </div>--%>
                        <%--                                <button class="btCA">Chọn ảnh</button>--%>
                        <%--                            </div>--%>

                        <%--                            <div class="dl" style="padding-left: 60px">--%>
                        <%--                                <p style="margin: 0px ; padding-top: 15px">Dung lượng file tối đa là 1MB</p>--%>
                        <%--                                <p>Định Dạng: JPEG , PNG</p>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<button style="display: none" type="submit" id="click_btn" class="btn-order" data-toggle="modal"
        data-target="#login-modal"></button>

<%

    String mess = (String) request.getAttribute("user_success");
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
            <p class="store">Thông tin của bạn đã được cập nhập</p>
            <p class="titel">Mời bạn đăng nhập lại để kiểm tra thông tin</p>
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