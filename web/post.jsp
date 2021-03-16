<%@ page import="vn.com.dutmobile.model.NewsModel" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.NewsDAOImpl" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang nội dung bài viết</title>
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
    <link rel="stylesheet" href="lib/css/poststyle.css">
</head>
<body>
<%
    NewsDAOImpl newsDAO = new NewsDAOImpl();
    NewsModel newsModel = (NewsModel) request.getAttribute("newsDetails");
%>

<!--header-->
<!--<logo - login-reg>-->
<jsp:include page="header.jsp"></jsp:include>
<!--Hết header-->

<!-- Page Content -->
<div class="container" style="padding-top: 100px">

    <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-8" style="background-color: white;">

            <!-- Title -->
            <h1 class="mt-4"><%=newsModel.getTitle()%></h1>


            <!-- Date/Time -->
            <p style="color: #a5a0a2; ">Đăng vào lúc <%=newsModel.getTimerelease()%></p>

            <hr>

            <!-- Preview Image -->
            <img class="img-fluid" style="width: 100%;" src="<%=newsModel.getImg()%>" alt="">

            <hr>

            <!-- Post Content -->
            <p class="lead"><%=newsModel.getContent()%></p>
            <%--<img class="img-fluid" src="<%=newsModel.getImg()%>" alt="">--%>

            <hr>

            <!-- Comments Form -->
            <div class="card my-4">
                <h5 class="card-header">Hãy nêu ý kiến của bạn:</h5>
                <div class="card-body">
                    <form>
                        <div class="form-group">
                            <textarea class="form-control" rows="3"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">GỬI</button>
                    </form>
                </div>
            </div>

        </div>

        <div class="col-md-4">
            <!-- Các bài viết nổi bật -->
            <div class="card my-4">
                <h5 class="card-header">Các bài viết nổi bật khác</h5>
                <div class="card-body">
                    <%
                        for(NewsModel newsModel1 : newsDAO.getAllPopularNews()) {
                    %>
                    <div class="one-pp-list">
                        <img src="<%=newsModel1.getImg()%>" alt=""
                             class="img-one-pp">
                        <a href="" class="title-one-pp"><%=newsModel1.getTitle()%>
                        </a>
                        <br>
                        <span class="time-release-one-pp"><i class="far fa-clock mr-1"></i><%=newsModel1.getTimerelease()%></span>
                    </div> <!--end one-pp-list-->
                    <%
                        }
                    %>
                </div> <!--body các bài viết nổi bật-->
            </div>
            <!--end các bài viết nổi bật-->
        </div>

    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<jsp:include page="button-scroll-top.jsp"></jsp:include>
<!--button-scroll-top-->

<jsp:include page="footer.jsp"></jsp:include>
<!--Hết footer-->
<script type="text/javascript" src="lib/js/1.js"></script>
</body>
</html>