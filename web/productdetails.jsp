<%@ page import="vn.com.dutmobile.model.ProductModel" %>
<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page import="vn.com.dutmobile.utils.PriceProcess" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.ProductDAOimpl" %>
<%@ page import="javax.servlet.jsp.jstl.sql.Result" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang 1 sản phẩm</title>
    <!--Jquery-->
    <script type="text/javascript" src="vendor/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="vendor/jquery-migrate-3.1.0.min.js"></script>
    <!--Jquery-->
    <!--Slick-->
    <script type="text/javascript" src="vendor/slick/slick.min.js"></script>
    <link rel="stylesheet" type="text/css" href="vendor/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="vendor/slick/slick-theme.css"/>
    <script type="text/javascript" src="vendor/slick/slick.js"></script>
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
    <!--zoom-->
    <script src="vendor/zoom-image.js"></script>
    <!--zoom-->
    <link rel="stylesheet" href="lib/css/productdetails.css">
    <%--    <link rel="stylesheet" href="lib/css/index.css">--%>
    <%--    <style>--%>
    <%--        img{--%>
    <%--            max-width: 700px;--%>
    <%--            max-height: 500px;--%>
    <%--        }--%>
    <%--    </style>--%>
</head>
<body>
<!--header-->
<!--<logo - login-reg>-->
<jsp:include page="header.jsp"></jsp:include>
<!--Hết header-->

<!--content-->
<div style="padding-top: 100px">
    <div class="product_details">
        <div class="container">
            <%
                ProductModel product = (ProductModel) request.getAttribute("productdetail");
            %>
            <div class="row" style="background-color: white;">
                <div class="col-sm-6 " style="margin-top: 20px;">
                    <%
                        String[] imgdetail = product.getImageDetail().split("-");
                    %>
                    <div class="show" href="">
                        <img src="<%=imgdetail[0]%>" id="show-img">
                    </div>
                    <div class="small-img">
                        <img src="images/online_icon_right@2x.png" class="icon-left" alt="" id="prev-img">
                        <div class="small-container">
                            <div id="small-img-roll">
                                <%

                                    for (int img = 0; img < imgdetail.length; img++) {
                                %>
                                <img src="<%=imgdetail[img]%>" class="show-small-img" alt="">
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <img src="images/online_icon_right@2x.png" class="icon-right" alt="" id="next-img">
                    </div>
                    <%--                    <img id="img-lager" class="details_image_large" src="<%=product.getImage()%>"/>--%>
                    <%--                    <div class="d-flex slider demo">--%>
                    <%--                        <div><img id="img1" onclick="changeImage1()" class="details_image_thumbnail active"--%>
                    <%--                             src="images/iphone11xam.jpg" height="300" width="300"/></div>--%>
                    <%--                        <div><img id="img2" onclick="changeImage2()" class="details_image_thumbnail"--%>
                    <%--                             src="images/iphone11xanh.jpg" height="300"--%>
                    <%--                             width="300"/></div>--%>
                    <%--                        <img id="img3" onclick="changeImage3()" class="details_image_thumbnail"--%>
                    <%--                             src="images/iphone11den.jpg" height="300"--%>
                    <%--                             width="300"/>--%>
                    <%--                        <img id="img4" onclick="changeImage4()" class="details_image_thumbnail"--%>
                    <%--                             src="images/iphone11do.jpg" height="300" width="300"/>--%>
                    <%--                    </div>--%>
                </div>

                <div class="col-sm-6" style="padding: 50px;">
                    <h2 style="font-size: 40px; margin: 0px 0px 30px 0px;"><%=product.getProductName()%>
                    </h2>
                    <span class="price"><%=PriceProcess.price(product.getPrice())%> ₫</span>
                    <div class="VnpayText" style="border:none; margin: 40px 0px 20px 0px;">
                        <img src="images/logo-vnp.png" alt="Thanh toán qua VNPay QR COde">
                        <div>
                            <p style="margin-top: -1px;">Nhập <span class="codeVNPay">DUT</span> Giảm thêm <span
                                    class="cm">5% tối đa 300.000đ</span> khi thanh toán bằng quét QRcode qua App của 15
                                ngân hàng hàng đầu.</p>
                        </div>

                    </div>
                    <div>
                        <ul class="policy ">
                            <li class="inpr">
                                <span>Trong hộp có: <a class="stdImg" href="">Sạc, Tai nghe, S&#225;ch hướng dẫn, C&#225;p, C&#226;y lấy sim <i
                                        class='icondetail-camera standkit' href=''></i></a></span>
                            </li>
                            <li class="wrpr">
                                <span>Bảo hành chính hãng 12 tháng.</span>
                            </li>
                            <li class="chpr">
                                Lỗi là đổi mới trong 1 tháng tại hơn 1800 siêu thị toàn quốc
                            </li>

                        </ul>
                    </div>
                    <%--                    <div class="quantity-product">--%>
                    <%--                        <p style="float: left;margin-right: 10px; font-size: 20px; ">Số lượng: </p>--%>
                    <%--                        <div class="box-quantity">--%>
                    <%--                            <input class="btn-plus" onclick="addquantity()" type="button" value="+">--%>
                    <%--                            <input type="text" class="text-quantity" value="1">--%>
                    <%--                            <button class="btn-minus" value="-">-</button>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="properties-mobile">--%>
                    <%--                            <p class="color-mobile">Màu:</p>--%>
                    <%--                            <select name="" class="option-color-mobile">--%>
                    <%--                                <option value="Đỏ">Đỏ</option>--%>
                    <%--                                <option value="Xanh">Xanh</option>--%>
                    <%--                                <option value="Vàng">Vàng</option>--%>
                    <%--                                <option value="Tím">Tím</option>--%>
                    <%--                            </select>--%>
                    <%--                        </div>--%>
                    <div class="two-button">

                        <a href="http://localhost:8080/ProjectWeb_1920/AddCart?id=<%=request.getParameter("id")%>&path=<%=request.getServletPath()%>">
                            <button class="btn-add">Thêm vào giỏ hàng</button>
                        </a>
                        <a href="<%=UtilsPath.getPath("CheckNullCart")%>">
                            <button class="btn-buy">Mua Hàng</button>
                        </a>
                    </div>
                </div>
                <%--                    <div class="two-button">--%>
                <%--                        <button class="btn-add">Thêm vào giỏ hàng</button>--%>
                <%--                        <button class="btn-buy">Mua Hàng</button>--%>
                <%--                    </div>--%>
            </div>
            <div class="row" style="background-color: white">
                <div class="col-sm-8 ">
                    <h2 class="ex_cntitle">Đánh giá chi tiết</h2>
                    <%=product.getDescription()%>

                    <!--bắt đầu phần đánh giá-->
                    <div class="row border-top" style="margin-bottom: 30px">
                        <p class="title_evaluate" style="    padding-top: 10px;">Đánh giá</p>
                        <%
                            System.out.println(request.getParameter("id"));
                            ResultSet listComment = (ResultSet) request.getAttribute("comment");
                            while (listComment.next()) {
                        %>
                        <div class="col-sm-12 " style="margin-left: 25px;">
                            <p class="name-cmt"><%=listComment.getString("name")%> |<span style="font-size: 15px;font-weight: normal;">Đã đánh giá</span>
                            </p>
                            <p class="text-cmt"><%=listComment.getString("comment")%>
                            </p>
                        </div>
                        <%
                            }
                        %>


                        <div class="col-sm-12 ">
                            <div class="comment">
                                <form action="<%=UtilsPath.getPath("/InsertComment")%>" method="get">
                                    <p>Nhận xét của bạn</p>
                                    <input type="text" name="id" style="display: none"
                                           value="<%=request.getParameter("id")%>">
                                    <textarea class="text_comment" name="commentuser" id="" cols="30"
                                              rows="10" required></textarea><br>
                                    <input class="input_conment" name="nameuser" type="text" placeholder=" Tên" required><br>
                                    <input class="input_conment" name="emailuser" type="email" placeholder=" Email" required><br>

                                    <button class="btn_comment">Gửi nhận xét</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!--  kết thúc phần đánh giá -->
                </div>
                <div class="col-sm-4">
                    <p style="font-weight: bold">Thông số kỹ thuật</p>

                    <table class="table">
                        <%
                            String[] detail = product.getDetail().split("-");
                            for (int j = 0; j < detail.length; j = j + 2) {
                        %>
                        <tr>
                            <th><%=detail[j]%>
                            </th>
                            <td><%=detail[j + 1]%>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12 title-same-type"> Sản Phẩm Cùng Loại</div>
                <div class="col-sm-12" style="padding: 0px !important;">
                    <div class="promotion-section">
                        <%
                            ArrayList<ProductModel> listPromotion = (ArrayList<ProductModel>) request.getAttribute("ListProductSameType");
                            for (int item = 0; item < listPromotion.size(); item++) {
                        %>
                        <div class="one-ps">
                            <a href="<%=UtilsPath.getPath("Productdetail?id="+listPromotion.get(item).getId())%>"
                               class="text-link-slick"><img src="<%=listPromotion.get(item).getImage()%>" alt=""
                                                            class="slick-img"></a>
                            <a href="<%=UtilsPath.getPath("Productdetail?id="+listPromotion.get(item).getId())%>"
                               class="text-link-slick"><p
                                    class="name-product-bottom"><%=listPromotion.get(item).getProductName()%>
                            </p></a>
                            <%--                            <p class="text-price-slick">Giá cũ:--%>
                            <%--                                <del><%= PriceProcess.price( listPromotion.get(item).getPrice())%> VND</del>--%>
                            <%--                            </p>--%>
                            <p class="text-price-slick active-red">Giá: <span
                                    class="text-price-slick active-red"><%= PriceProcess.price(listPromotion.get(item).getPrice())%> VND</span>
                            </p>
                        </div>
                        <%
                            }
                        %>
                    </div> <!--end promotion-section-->
                </div> <!--end col-sm-12-->
            </div> <!--end row-->

        </div>

    </div>
</div>
</div>

<jsp:include page="button-scroll-top.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>
<!--Hết footer-->

<script type="text/javascript" src="lib/js/index.js"></script>
<script>
    $('.show').zoomImage();

    $('.show-small-img:first-of-type').css({'border': 'solid 1px #951b25', 'padding': '2px'})
    $('.show-small-img:first-of-type').attr('alt', 'now').siblings().removeAttr('alt')
    $('.show-small-img').click(function () {
        $('#show-img').attr('src', $(this).attr('src'))
        $('#big-img').attr('src', $(this).attr('src'))
        $(this).attr('alt', 'now').siblings().removeAttr('alt')
        $(this).css({'border': 'solid 1px #951b25', 'padding': '2px'}).siblings().css({
            'border': 'none',
            'padding': '0'
        })
        if ($('#small-img-roll').children().length > 4) {
            if ($(this).index() >= 3 && $(this).index() < $('#small-img-roll').children().length - 1) {
                $('#small-img-roll').css('left', -($(this).index() - 2) * 76 + 'px')
            } else if ($(this).index() == $('#small-img-roll').children().length - 1) {
                $('#small-img-roll').css('left', -($('#small-img-roll').children().length - 4) * 76 + 'px')
            } else {
                $('#small-img-roll').css('left', '0')
            }
        }
    });

    $('#next-img').click(function () {
        $('#show-img').attr('src', $(".show-small-img[alt='now']").next().attr('src'))
        $('#big-img').attr('src', $(".show-small-img[alt='now']").next().attr('src'))
        $(".show-small-img[alt='now']").next().css({
            'border': 'solid 1px #951b25',
            'padding': '2px'
        }).siblings().css({'border': 'none', 'padding': '0'})
        $(".show-small-img[alt='now']").next().attr('alt', 'now').siblings().removeAttr('alt')
        if ($('#small-img-roll').children().length > 4) {
            if ($(".show-small-img[alt='now']").index() >= 3 && $(".show-small-img[alt='now']").index() < $('#small-img-roll').children().length - 1) {
                $('#small-img-roll').css('left', -($(".show-small-img[alt='now']").index() - 2) * 76 + 'px')
            } else if ($(".show-small-img[alt='now']").index() == $('#small-img-roll').children().length - 1) {
                $('#small-img-roll').css('left', -($('#small-img-roll').children().length - 4) * 76 + 'px')
            } else {
                $('#small-img-roll').css('left', '0')
            }
        }
    });

    $('#prev-img').click(function () {
        $('#show-img').attr('src', $(".show-small-img[alt='now']").prev().attr('src'))
        $('#big-img').attr('src', $(".show-small-img[alt='now']").prev().attr('src'))
        $(".show-small-img[alt='now']").prev().css({
            'border': 'solid 1px #951b25',
            'padding': '2px'
        }).siblings().css({'border': 'none', 'padding': '0'})
        $(".show-small-img[alt='now']").prev().attr('alt', 'now').siblings().removeAttr('alt')
        if ($('#small-img-roll').children().length > 4) {
            if ($(".show-small-img[alt='now']").index() >= 3 && $(".show-small-img[alt='now']").index() < $('#small-img-roll').children().length - 1) {
                $('#small-img-roll').css('left', -($(".show-small-img[alt='now']").index() - 2) * 76 + 'px')
            } else if ($(".show-small-img[alt='now']").index() == $('#small-img-roll').children().length - 1) {
                $('#small-img-roll').css('left', -($('#small-img-roll').children().length - 4) * 76 + 'px')
            } else {
                $('#small-img-roll').css('left', '0')
            }
        }
    });
</script>

</body>
</html>