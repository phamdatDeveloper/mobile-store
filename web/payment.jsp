<%@ page import="vn.com.dutmobile.model.AccountModel" %>
<%@ page import="vn.com.dutmobile.model.Cart" %>
<%@ page import="vn.com.dutmobile.model.ProductModel" %>
<%@ page import="vn.com.dutmobile.utils.PriceProcess" %>
<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang Thanh toán</title>
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
    <link rel="stylesheet" href="http://localhost:8080/ProjectWeb_1920/lib/css/payment.css">
</head>
<body>
<!--header-->
<!--<logo - login-reg>-->
<jsp:include page="header.jsp"></jsp:include>
<!--Hết header-->

<!--content-->
<div>
    <div class="container" style="min-height:600px; margin-top: 100px;">
        <form class="abc" action="http://localhost:8080/ProjectWeb_1920/RemoveOders" method="post">
            <div class="row">
                <div class="col-sm-8">
                    <p style="font-weight: bold;font-size: 20px;margin: 20px auto;">Hình thức giao hàng</p>
                    <div class="row row-stype">
                        <div class="col-sm-1">
                            <div class="iradio_square-blue checked ">
                                <input type="radio" name="pay" value="Thanh toán khi nhận hàng" class="plan-1" checked>
                            </div>
                        </div>
                        <div class="col-sm-11">
                            <p>Thanh toán khi nhận hàng</p>
                        </div>

                        <div class="col-sm-1">
                            <div class="iradio_square-blue  ">
                                <input type="radio" name="pay" value="Thanh toán bằng thẻ quốc tế Visa, Master, JCB"
                                       class="plan-1">
                            </div>
                        </div>
                        <div class="col-sm-11">
                            <p>Thanh toán bằng thẻ quốc tế Visa, Master, JCB</p>
                        </div>

                        <div class="col-sm-1">
                            <div class="iradio_square-blue  ">
                                <input type="radio" name="pay" value="Thanh toán thẻ ATM nội địa/Internet Banking "
                                       class="plan-1">
                            </div>
                        </div>
                        <div class="col-sm-11">
                            <p>Thẻ ATM nội địa/Internet Banking (Miễn phí thanh toán)</p>
                        </div>

                    </div>
                    <p style="font-weight: bold;font-size: 20px;margin: 20px auto;">Thông tin khách hàng</p>

                    <%
                        AccountModel user = (AccountModel) session.getAttribute("account");
                    %>

                    <div class="row row-stype" style="display: block">
                        <div class="User userES">
                            <label style="font-weight: bold" for="hoten">Họ tên :</label>
                            <span style=" font-size: 17px" type="text" id="hoten" name="hoten"
                                  placeholder="    "
                                  class="Input-sc-1sflv1m-0 coLFjn"><%=user.getFullname()%></span>
                            <%--                            <input style=" font-size: 17px" type="text" id="hoten" name="hoten"--%>
                            <%--                                   placeholder="    " class="Input-sc-1sflv1m-0 coLFjn">--%>
                        </div>


                        <div class="User userES usEmail">
                            <label style="font-weight: bold" for="email">Email :</label>
                            <span style="font-size: 17px" type="email" id="email" name="hoten"
                                  placeholder=" " class="Input-sc-1sflv1m-0 coLFjn"
                                  value=""><%=user.getEmail()%></span>

                        </div>

                        <div class="User userES">
                            <label style="font-weight: bold" for="diachi">SĐT :</label>
                            <span style=" font-size: 17px" type="text" id="diachi" name="hoten"
                                  placeholder="  " class="Input-sc-1sflv1m-0 coLFjn"
                                  value=""><%=user.getPhoneNumber()%></span>
                            <%--                            <input style=" font-size: 17px;  display: none;" type="text" id="setSDT" name="hoten"--%>
                            <%--                                  placeholder="  " class="Input-sc-1sflv1m-0 coLFjn"--%>
                            <%--                                  value="" >--%>
                            <%--                            <a href="" onclick="showStuff('setSDT', 'diachi', this); return false;" style="color:#00B6F6;">Thay đổi</a>--%>
                        </div>


                        <div class="User userES">
                            <label style="font-weight: bold" for="address">Địa Chỉ :</label>
                            <input style=" font-size: 17px;" type="text" id="address" name="address"
                                   placeholder="Nhập địa chỉ giao hàng" class="Input-sc-1sflv1m-0 coLFjn"
                                   value="" required>
                        </div>
                    </div>

                </div>
                <div class="col-sm-4">
                    <p style="font-weight: bold;font-size: 20px;margin: 20px auto;">Đơn hàng</p>
                    <div class="row row-stype" style="margin-left: 5px;">

                        <%
                            Cart cart = (Cart) request.getAttribute("Cart");
                            if (cart == null) cart = new Cart();

                            for (ProductModel p : cart.list()) {
                        %>

                        <div class="row">
                            <div class="col-sm-3 border-bottom margin5px">
                                <img class="img-payment" src="<%=p.getImage()%>" height="300" width="300"/>
                            </div>
                            <div class="col-sm-9 border-bottom margin5px">
                                <p class="text-item-payment"><%=p.getProductName()%>
                                </p>
                                <p class="text-number-item-payment">Số lượng :<%=p.getQuantity()%>
                                </p>
                                <p class="price"><span
                                        style="color: black;">Giá sản phẩm:</span> <%=PriceProcess.price(p.totalSum())%>
                                    VND
                                </p>
                            </div>

                        </div>


                        <%}%>


                        <p class="price" style="font-size: 20px"><span
                                style="color: black;">Tổng Giá:</span> <%=PriceProcess.price(cart.total())%>
                            VND</p>
                        <%----%>
                        <%--                        <button type="submit" class="btn-order"><a--%>
                        <%--                                href="<%=UtilsPath.getPath("RemoveOders")%>">Đặt--%>
                        <%--                            Hàng</a></button>--%>

                        <button style="display: none" type="submit" id="click_btn" class="btn-order" data-toggle="modal"
                                data-target="#login-modal"></button>
                        <button type="submit" class="btn-order">Đặt Hàng</button>

                        <%

                            String mess = (String) request.getAttribute("mes_success");
                            if (mess != null) {
                        %>
                        <script>
                            $(function () {
                                $('#click_btn').click();

                                window.onclick = function () {
                                    window.location.href = 'http://localhost:8080/ProjectWeb_1920/HomeController';
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
                                    <p class="titel">Đặt Hàng Thành Công</p>
                                    <p class="store"> Cửa Hàng D.U.T Mobile </p>
                                    <p class="thank">Cảm Ơn Bạn Đã Tin Dùng Sản Phẩm Của Chúng Tôi </p>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </form>
    </div>
    <%--        <button type="submit" class="btn-order">Đặt Hàng</button>--%>

</div>


<jsp:include page="button-scroll-top.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>
<!--Hết footer-->
</body>
</html>