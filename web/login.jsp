<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đăng nhập / Đăng kí</title>
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
    <link rel="stylesheet" href="lib/css/styleLongi.css">
</head>
<body>
<%
    String username_ping = "";
    String name_ping = "";
    String sdt_ping = "";
    String email_ping = "";
    String address_ping = "";
    String password_ping = "";
    String repassword_ping = "";
    String gender_ping = "";
    String dob_ping = "";

    if (request.getAttribute("username_ping") != null) {
        username_ping = (String) request.getAttribute("username_ping");
    }
    if (request.getAttribute("name_ping") != null) {
        name_ping = (String) request.getAttribute("name_ping");
    }
    if (request.getAttribute("sdt_ping") != null) {
        sdt_ping = (String) request.getAttribute("sdt_ping");
    }
    if (request.getAttribute("email_ping") != null) {
        email_ping = (String) request.getAttribute("email_ping");
    }
    if (request.getAttribute("address_ping") != null) {
        address_ping = (String) request.getAttribute("address_ping");
    }
    if (request.getAttribute("password_ping") != null) {
        password_ping = (String) request.getAttribute("password_ping");
    }
    if (request.getAttribute("repassword_ping") != null) {
        repassword_ping = (String) request.getAttribute("repassword_ping");
    }
    if (request.getAttribute("gender_ping") != null) {
        gender_ping = (String) request.getAttribute("gender_ping");
    }
    if (request.getAttribute("dob_ping") != null) {
        dob_ping = (String) request.getAttribute("dob_ping");
    }

    String username = "";
    String name = "";
    String sdt = "";
    String email = "";
    String address = "";
    String password = "";
    String repassword = "";

    if (request.getAttribute("username") != null) {
        username = (String) request.getAttribute("username");
    }
    if (request.getAttribute("name") != null) {
        name = (String) request.getAttribute("name");
    }
    if (request.getAttribute("sdt") != null) {
        sdt = (String) request.getAttribute("sdt");
    }
    if (request.getAttribute("email") != null) {
        email = (String) request.getAttribute("email");
    }
    if (request.getAttribute("address") != null) {
        address = (String) request.getAttribute("address");
    }
    if (request.getAttribute("password") != null) {
        password = (String) request.getAttribute("password");
    }
    if (request.getAttribute("repassword") != null) {
        repassword = (String) request.getAttribute("repassword");
    }

    String err = "";
    if (request.getAttribute("err") != null) {
        err = (String) request.getAttribute("err");
    }
    String uname = "";
    String pass = "";
    if (request.getAttribute("uname") != null) {
        uname = (String) request.getAttribute("uname");
    }
    if (request.getAttribute("pass") != null) {
        pass = (String) request.getAttribute("pass");
    }
%>


<!--header-->
<!--<logo - login-reg>-->
<jsp:include page="header.jsp"></jsp:include>
<!--Hết header-->

<div id="tabs" style="padding-top: 100px">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 ">
                <nav>
                    <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                        <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home"
                           role="tab" aria-controls="nav-home" aria-selected="true">Đăng Nhập</a>
                        <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
                           role="tab" aria-controls="nav-profile" aria-selected="false">Tạo Tài Khoản</a>
                    </div>
                </nav>
                <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                        <div class="left">
                            <h2>Đăng nhập</h2>
                            <p>Đăng nhập để theo dõi đơn hàng, lưu
                                danh sách sản phẩm yêu thích, nhận
                                nhiều ưu đãi hấp dẫn.</p>
                            <div><img src="images/10.jpg" height="426" width="426"/></div>
                        </div>

                        <div class="right">
                            <div>
                                <form class="form-action" action="LoginController" method="post" style="background-color: white;">

                                    <div class="User userES">
                                        <label for="uname">Tài khoản</label>
                                        <input type="text" id="uname" name="uname"
                                               placeholder="Nhập tên tài khoản"
                                               class="Input-sc-1sflv1m-0 coLFjn"
                                               value="<%=uname%>">
                                    </div>
                                    <div class="User userES">
                                        <label for="pass">Mật khẩu</label>
                                        <input type="password" id="pass" name="pass"
                                               placeholder="Mật khẩu từ 6 đến 32 ký tự"
                                               class="Input-sc-1sflv1m-0 coLFjn"
                                               value="<%=pass%>">
                                    </div>
                                    <%
                                        if(request.getAttribute("err") != null) {
                                    %>
                                    <p class="p_tags_ping_login"><%=err%>
                                    </p>
                                    <%
                                        }
                                    %>
                                    <div class="User userES">
                                        <input type="hidden" name="type" value="user"/>
                                        <input type="hidden" name="active" value="1"/>
                                    </div>
                                    <div style="margin-left: 50px ;margin-top: 20px;">
                                        <p class="forgot-password"><a style="text-decoration: underline;" href="resetpass.jsp">Quên mật khẩu?</a></p>
                                        <button type="submit" class="User butDN">Đăng nhập</button>
                                        <button type="button" class="User butFB ">
                                            <span class="User iconfb"><i class="fab fa-facebook-f"></i></span>
                                            Đăng nhập bằng FaceBook
                                        </button>
                                        <button type="button" class="User butgg ">
                                            <span class="User iconfb"><i class="fab fa-google-plus-g"></i></span>
                                            Đăng nhập bằng Google
                                        </button>
                                        <button type="button" class="User butig ">
                                            <span class="User iconfb"><i class="fab fa-instagram"></i></span>
                                            Đăng nhập bằng Instagram
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                        <div class=" left1">
                            <h2>Đăng kí</h2>
                            <p>Tạo tài khoản để theo dõi đơn hàng, lưu
                                danh sách sản phẩm yêu thích, nhận
                                nhiều ưu đãi hấp dẫn.</p>
                            <div><img src="images/10.jpg" height="426" width="426"/></div>
                        </div>

                        <div class=" right1">
                            <div>
                                <form class="form-action" action="RegisterController" method="post" style="background-color: white;">
                                    <div class="User userES">
                                        <p class="p_tags_ping" style="color: red;"><%=username_ping%>
                                        </p>
                                        <label for="hoten">Tài khoản</label>
                                        <input type="text" id="username" name="username"
                                               placeholder="Nhập tên tài khoản" class="Input-sc-1sflv1m-0 coLFjn"
                                               value="<%=username%>">
                                    </div>
                                    <div class="User userES">
                                        <p class="p_tags_ping" style="color: red;"><%=name_ping%>
                                        </p>
                                        <label for="hoten">Họ tên</label>
                                        <input type="text" id="hoten" name="name"
                                               placeholder="Nhập họ tên" class="Input-sc-1sflv1m-0 coLFjn"
                                               value="<%=name%>">
                                    </div>
                                    <div class="User userES">
                                        <p class="p_tags_ping" style="color: red;"><%=sdt_ping%>
                                        </p>
                                        <label for="SDT">SĐT</label>
                                        <input type="text" id="SDT" name="SDT"
                                               placeholder="Nhập số điện thoại" class="Input-sc-1sflv1m-0 coLFjn"
                                               value="<%=sdt%>">
                                    </div>

                                    <div class="User userES">
                                        <p class="p_tags_ping" style="color: red;"><%=email_ping%>
                                        </p>
                                        <label for="email1">Email</label>
                                        <input type="email" id="email1" name="email"
                                               placeholder="Nhập Email" class="Input-sc-1sflv1m-0 coLFjn"
                                               value="<%=email%>">
                                    </div>
                                    <div class="User userES">
                                        <p class="p_tags_ping" style="color: red;"><%=address_ping%>
                                        </p>
                                        <label for="address">Địa chỉ</label>
                                        <input type="text" id="address" name="address"
                                               placeholder="Nhập địa chỉ" class="Input-sc-1sflv1m-0 coLFjn"
                                               value="<%=address%>">
                                    </div>
                                    <div class="User userES">
                                        <p class="p_tags_ping" style="color: red;"><%=password_ping%>
                                        </p>
                                        <label for="password1">Mật khẩu</label>
                                        <input type="password" id="password1" name="password"
                                               placeholder="Mật khẩu từ 6 đến 32 ký tự"
                                               class="Input-sc-1sflv1m-0 coLFjn"
                                               value="<%=password%>">
                                    </div>
                                    <div class="User userES">
                                        <p class="p_tags_ping" style="color: red; top: 75px;"><%=repassword_ping%>
                                        </p>
                                        <label style="margin-bottom: 0; position: relative; top: 10px;"
                                               for="repassword">Nhập lại mật khẩu</label>
                                        <input type="password" id="repassword" name="repassword"
                                               placeholder="Xác nhận mật khẩu"
                                               class="Input-sc-1sflv1m-0 coLFjn"
                                               value="" style="margin-bottom: 10px">
                                    </div>

                                    <div class="User userES" style="margin: 5px 0px">
                                        <p class="p_tags_ping" style="color: red; left: 340px; top: 18px;"><%=gender_ping%>
                                        </p>
                                        <label style="margin-left: 5px"> Giới tính</label>
                                        <span style="width: 300px; margin-left: 50px">
                                           <label style="cursor: pointer;" value="Nam">
                                                    <input id="gen" name="gender" type="radio" value="Nam"><p
                                                   style="float: right; padding-left: 15px">Nam</p>
                                           </label>

                                             <label style="cursor: pointer; float: right; margin-right: 200px"
                                                    value="Nu">
                                                    <input id="gen1" name="gender" type="radio" value="Nu"><p
                                                     style="float: right; padding-left: 15px">Nữ</p>
                                           </label>
                                       </span>
                                    </div>

                                    <div class="User userES">
                                        <p class="p_tags_ping" style="color: red;"><%=dob_ping%>
                                        </p>
                                        <label>Ngày sinh</label>
                                        <div style="width: 80%; display: flex; float: right; position: relative; bottom: 8px;">
                                            <input type="date" name="dob" placeholder="YYYY-MM-DD" required="required"
                                                   style="position:relative; left: -20px; width: 100%; padding: 5px;">
                                        </div>
                                    </div>

                                    <div class="User userES">
                                        <label for></label>
                                        <div style="width: 88%; display: inline-block ; margin-left: 50px">
                                            <button type="submit" class="User btTTk">Tạo tài khoản</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
</div>
<!-- ./Tabs -->

<jsp:include page="button-scroll-top.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>
<!--Hết footer-->
<script type="text/javascript" src="lib/js/1.js"></script>
</body>
</html>