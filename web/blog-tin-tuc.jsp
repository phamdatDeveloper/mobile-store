<%@ page import="vn.com.dutmobile.DAO.Implement.NewsDAOImpl" %>
<%@ page import="vn.com.dutmobile.model.NewsModel" %>
<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Blog tin tức</title>
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
    <link rel="stylesheet" href="lib/css/blogtintuc.css">
</head>
<body>
<%
    NewsDAOImpl newsDAO = new NewsDAOImpl();

    int pages = 1;
    int offset = 0;
    int limit = 0;

    if (request.getParameter("pages") != null) {
        pages = Integer.parseInt(request.getParameter("pages"));
    }

    int total = newsDAO.getCountNews();
    if (total <= 5) {
        offset = 0;
        limit = total;
    } else {
        offset = (pages - 1) * 5;
        limit = 5;
    }

    ArrayList<NewsModel> list = newsDAO.getAllNews(offset, limit);
%>
<!--header-->
<!--<logo - login-reg>-->
<jsp:include page="header.jsp"></jsp:include>
<!--Hết header-->

<!--blog-post-->
<!--Carousel-blog-->
<div class="carousel-blog" style="padding-top: 82px">
    <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active bor-circle"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="1" class="bor-circle"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="2" class="bor-circle"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <a href="<%=UtilsPath.getPath("NewsDetailsController?id=13")%>"> <img src="images/tin-tuc-cong-nghe/apple_800x449.jpg" class="d-block w-100 img-blog-carousel"></a>
                <div class="carousel-caption d-none d-md-block">
                    <p class="text-carousel-blog">Apple yêu cầu chính quyền Trump miễn thuế cho một vài linh kiện của
                        iPhone, iPad, Apple Watch và AirPods</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/tin-tuc-cong-nghe/samsung-galaxy-s10-1-1_800x448.jpg"
                     class="d-block w-100 img-blog-carousel">
                <div class="carousel-caption d-none d-md-block">
                    <p class="text-carousel-blog">Galaxy S10 Lite sẽ được trang bị viên pin 4.370 mAh, công nghệ sạc
                        nhanh 45W</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/tin-tuc-cong-nghe/1_800x451.jpg" class="d-block w-100 img-blog-carousel">
                <div class="carousel-caption d-none d-md-block">
                    <p class="text-carousel-blog">Redmi Note 8T với 4 camera mặt sau được xác nhận có sạc nhanh 18W, hỗ
                        trợ NFC</p>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev control-icon" href="#carouselExampleCaptions" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon icon-prev-control" aria-hidden="true"><i
                    class="fas fa-angle-left"></i></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next control-icon" href="#carouselExampleCaptions" role="button" data-slide="next">
            <span class="carousel-control-next-icon icon-next-control" aria-hidden="true"><i
                    class="fas fa-angle-right"></i></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
<!--end carousel-blog-->

<!--Posts-->
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <p class="title-blog">TIN TỨC HẰNG NGÀY</p>
        </div> <!--end col-sm-12-->
    </div> <!--end row-->
    <div class="row">
        <div class="col-sm-9">
            <%
                for (NewsModel news : list) {
            %>
            <div class="card mb-4">
                <a class="title-post" href="<%=UtilsPath.getPath("NewsDetailsController?id="+news.getId())%>"><img
                        class="card-img-top" src="<%=news.getImg()%>" alt="Card image cap"></a>
                <div class="card-body">
                    <a class="title-post" href="<%=UtilsPath.getPath("NewsDetailsController?id="+news.getId())%>">
                        <h2 class="card-title"><%=news.getTitle()%>
                        </h2></a>
                    <p class="card-text"><%=news.getDescription()%>
                    </p>
                    <a href="<%=UtilsPath.getPath("NewsDetailsController?id="+news.getId())%>"
                       class="btn btn-primary">Đọc
                        thêm &rarr;</a>
                </div>
            </div> <!-- end card mb-4 -->
            <%
                }
            %>
        </div> <!--end col-sm-9-->
        <div class="col-sm-3">
            <%--<form action="<%=UtilsPath.getPath("NewsSearchByTitle")%>" method="post" class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="text" name="searchByTitle" placeholder="Tìm kiếm">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm kiếm</button>
            </form>--%>

            <div class="popular-posts">
                <div class="big-title-pp">
                    Bài viết nổi bật khác
                </div>
                <div class="pp-list">
                    <%
                        for (NewsModel news : newsDAO.getAllPopularNews()) {
                    %>
                    <div class="one-pp-list">
                        <img src="<%=news.getImg()%>" alt=""
                             class="img-one-pp">
                        <a href="<%=UtilsPath.getPath("NewsDetailsController?id="+news.getId())%>"
                           class="title-one-pp"><%=news.getTitle()%>
                        </a>
                        <br>
                        <span class="time-release-one-pp"><i
                                class="far fa-clock mr-1"></i><%=news.getTimerelease()%></span>
                    </div> <!--end one-pp-list-->
                    <%
                        }
                    %>
                </div> <!--end pp-list-->
            </div> <!--end popular-post-->
        </div> <!--end col-sm-3-->
    </div> <!--end row-->
    <div class="row">
        <div class="col-sm-9">
            <nav aria-label="Page navigation example" class="pagi-text-center" style="transform: translateX(30%);">
                <ul class="pagination">

                    <%
                        //Button Number pages
                        int loop = 0, num = 0;
                        if ((total / 5) % 2 == 0) {
                            num = total / 5;
                        } else {
                            num = (total + 1) / 5;
                        }
                        //Nếu total lẻ thêm 1
                        if (total % 2 != 0) {
                            loop = (total / 5) + 1;

                        } else {
                            //Nếu total chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
                            if (total < (num * 5) + 5 && total != num * 5) {
                                loop = (total / 5) + 1;
                            } else {
                                //Nếu bằng fullPage thì không thêm
                                loop = (total / 5);
                            }
                        }
                        //Lap so pages
                        for (int i = 1; i <= loop; i++) {%>
                    <% if (pages == i) {%>

                    <li class="page-item"><span><a class="page-link" href="blog-tin-tuc.jsp?pages=<%=i%>"><%=i%></a></span></li>
                    <%} else {%>
                    <li class="page-item"><a class="page-link" href="blog-tin-tuc.jsp?pages=<%=i%>"><%=i%>
                    </a></li>
                    <%
                            }
                        }
                    %>

                    <%--<li class="page-item"><a class="page-link"
                                             href="blog-tin-tuc.jsp">1
                    </a></li>--%>
                </ul>
            </nav>
        </div> <!--end col-sm-9-->
    </div><!--end row-->
</div> <!--end container-->
<!--end Posts-->
<!--end blog-post-->

<jsp:include page="button-scroll-top.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>
<!--Hết footer-->
<script type="text/javascript" src="lib/js/1.js"></script>
</body>
</html>