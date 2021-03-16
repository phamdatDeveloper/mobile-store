<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang Giới Thiệu</title>
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
    <link rel="stylesheet" href="lib/css/aboutus.css">
</head>
<body>
<!--header-->
<!--<logo - login-reg>-->
<jsp:include page="header.jsp"></jsp:include>
<!--Hết header-->

<div class="container" style="padding-top: 100px">
    <div class="row">
        <div class="first-section">
            <div class="mask"></div>
            <h1>Chào mừng bạn đến với DUT Mobile</h1>
            <h3>Chúng tôi hân hạnh mang đến cho bạn những ưu đãi và dịch vụ tốt nhất</h3>
            <div class="cards-section">
                <div class="card text-center" style="width: 18rem; height: 10rem;">
                    <div class="card-body">
                        <span class="icon-cb"><i class="far fa-handshake"></i></span>
                        <h5 class="card-title">UY TÍN</h5>
                        <p class="card-text">Chúng tôi bán uy tín để mua sự tin tưởng từ bạn.</p>
                    </div>
                </div> <!--end card-->
                <div class="card text-center" style="width: 18rem; height: 10rem;">
                    <div class="card-body">
                        <span class="icon-cb"><i class="fas fa-award"></i></span>
                        <h5 class="card-title">CHẤT LƯỢNG</h5>
                        <p class="card-text">Sản phẩm đảm bảo chất lượng tốt nhất đến với bạn.</p>
                    </div>
                </div> <!--end card-->
                <div class="card text-center" style="width: 18rem; height: 10rem;">
                    <div class="card-body">
                        <span class="icon-cb"><i class="fas fa-money-check-alt"></i></span>
                        <h5 class="card-title">GIÁ Ưu Đãi</h5>
                        <p class="card-text">Giá Rẽ - Giá Ngon - Hợp túi tiền với mọi người.</p>
                    </div>
                </div> <!--end card-->
            </div> <!--end cards-section-->
        </div> <!--end first section-->


    </div> <!--end row-->
</div> <!--end container-->


<jsp:include page="button-scroll-top.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>
<!--Hết footer-->

<script type="text/javascript" src="lib/js/1.js"></script>
</body>
</html>