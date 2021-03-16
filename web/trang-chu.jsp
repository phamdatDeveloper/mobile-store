<%@ page import="java.sql.ResultSet" %>
<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page import="vn.com.dutmobile.model.ProductModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.ProductDAOimpl" %>
<%@ page import="vn.com.dutmobile.utils.PriceProcess" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.NewsDAOImpl" %>
<%@ page import="vn.com.dutmobile.model.NewsModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang chủ</title>
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
    <link rel="stylesheet" href="lib/css/index.css">
</head>
<body>
<%
    NewsDAOImpl newsDAO = new NewsDAOImpl();

%>

<!--header-->
<!--<logo - login-reg>-->
<jsp:include page="header.jsp"></jsp:include>
<!--Hết header-->

<div id="inner-body-website">
    <div class="carousel-slider">
        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="images/ip11ad.jpg" class="d-block w-100" alt="">
                            </div>
                            <div class="carousel-item">
                                <img src="images/p20ad.jpg" class="d-block w-100" alt="">
                            </div>
                            <div class="carousel-item">
                                <img src="images/samsungnote10ad.jpg" class="d-block w-100" alt="">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                           data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                           data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div> <!--end carousel-->
                </div> <!--end col-sm-8-->
                <div class="col-sm-4">
                    <%
                        for(NewsModel news : newsDAO.getAllPopularNews()) {
                    %>
                    <div class="side-info animated forward fadeInUp">
                        <a href="<%=UtilsPath.getPath("NewsDetailsController?id="+news.getId())%>"><img src="<%=news.getImg()%>" alt="" class="img-side-info"></a>
                        <a href="<%=UtilsPath.getPath("NewsDetailsController?id="+news.getId())%>" class="text-side-info"><%=news.getTitle()%></a>
                        <p class="text-time-side-info"><i class="far fa-clock"></i><%=news.getTimerelease()%></p>
                    </div> <!--end side-info-->
                    <%
                        }
                    %>
                </div> <!--end col-sm-4-->
            </div> <!--end row-->
        </div> <!--end container-->
    </div> <!--hết carousel-slider-->

    <div class="container">
        <div class="row">
            <div class="col-sm-12 name-kind-tag">
                <div class="the-line"></div>
                <p class="text-the-line">SẢN PHẨM KHUYẾN MÃI</p>
            </div> <!--end col-sm-12-->
        </div> <!--end row-->
        <div class="row">
            <div class="col-sm-12">
                <div class="promotion-section">
                    <%
                        ArrayList<ProductModel> listPromotion = (ArrayList<ProductModel>) request.getAttribute("productPromotion");
                        for (int item = 0; item < listPromotion.size(); item++) {
                            System.out.println(PriceProcess.price( listPromotion.get(item).getPromotion()));
                    %>
                    <div class="one-ps">
                        <a href="<%=UtilsPath.getPath("Productdetail?id="+listPromotion.get(item).getId())%>" class="text-link-slick"><img src="<%=listPromotion.get(item).getImage()%>" alt=""
                             class="slick-img"></a>
                        <a href="<%=UtilsPath.getPath("Productdetail?id="+listPromotion.get(item).getId())%>" class="text-link-slick"><%=listPromotion.get(item).getProductName()%>
                        </a>
                        <p class="text-price-slick">Giá cũ:
                            <del><%= PriceProcess.price( listPromotion.get(item).getPrice())%> VND</del>
                        </p>
                        <p class="text-price-slick active-red">Giá đặc biệt: <span
                                class="text-price-slick active-red"><%=PriceProcess.price( listPromotion.get(item).getPricePromotion()) %> VND</span>
                        </p>
                    </div>
                    <%
                        }
                    %>
                </div> <!--end promotion-section-->
            </div> <!--end col-sm-12-->
        </div> <!--end row-->
    </div> <!--end container-->

    <!--IPHONE-->
    <%
        ArrayList<String> product = (ArrayList<String>) request.getAttribute("type");
        for (int i = 0; i < product.size(); i++) {
    %>
    <div class="container products-list">
        <div class="row">
            <div class="col-sm-2 name-product-tag">
                <img src="images/img-<%=product.get(i)%>.png" alt="" class="img-product-in-tag img-fluid">
            </div> <!--end col-sm-2-->
            <div class="col-sm-10 product-list">
                <%
                    ArrayList<ProductModel> list = (ArrayList<ProductModel>) request.getAttribute("typenumber"+i);
                    for (int j = 0; j < list.size(); j++) {
                %>
                <div class="one-product-list">
                    <a href="<%=UtilsPath.getPath("Productdetail?id="+list.get(j).getId())%>" class="img-link-opl"><img
                            src=" <%=list.get(j).getImage()%>" alt=""
                            class="img-one-product-list"></a>
                    <a href="<%=UtilsPath.getPath("Productdetail?id="+list.get(j).getId())%>" class="name-product-opl"><%=list.get(j).getProductName()%>
                    </a>
                    <p class="price-product-opl"> <%=PriceProcess.price( list.get(j).getPrice()) %> VND</p>
                    <hr>
                    <a  href="http://localhost:8080/ProjectWeb_1920/AddCart?id=<%=list.get(j).getId()%>&path=<%=request.getServletPath()%>"><div class="btn btn-cart-now">
                        <i class="fas fa-shopping-cart"></i></div></a>
                    <a href="<%=UtilsPath.getPath("Productdetail?id="+list.get(j).getId())%>">
                        <div class="btn btn-detail-product">Xem chi tiết</div>
                    </a>

                </div> <!--end one-product-list-->
                <%
                    }
                %>
            </div> <!--end col-sm-10-->
        </div> <!--end row-->
        <div class="row">
            <div class="col-sm-12 wanna-detail">
                <a href="<%=UtilsPath.getPath("ListProduct?search=")%><%=product.get(i)%>" class="link-wanna-detail">Xem
                    thêm</a>
            </div>
        </div>
    </div> <!--end container-->
    <!--IPHONE-->
    <%
        }
    %>


</div>
<!--Hết inner-body-website-->

<jsp:include page="button-scroll-top.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>
<!--Hết footer-->

<script type="text/javascript" src="lib/js/index.js"></script>
</body>
</html>