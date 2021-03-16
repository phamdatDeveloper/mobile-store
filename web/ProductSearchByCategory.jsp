<%@ page import="java.sql.ResultSet" %>
<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.com.dutmobile.model.ProductModel" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.ProductDAOimpl" %>
<%@ page import="vn.com.dutmobile.utils.PriceProcess" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang Sản Phẩm</title>
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
    <link rel="stylesheet" href="lib/css/product.css">
</head>
<body>
<!--header-->
<!--<logo - login-reg>-->
<jsp:include page="header.jsp"></jsp:include>
<!--Hết header-->

<!--content-->
<div style="padding-top: 100px">
    <div class="container">
        <div class="contain-btn">
            <%
                ArrayList<String> type = (ArrayList<String>) request.getAttribute("typeProduct");
                String s = request.getServletPath();
                for (int typeItem =0;typeItem<type.size();typeItem++){
            %>

            <a href="<%=UtilsPath.getPath("productSeachByCategory?type="+type.get(typeItem))%>&page=1">
                <button class="btn button-top "><%=type.get(typeItem)%></button>
            </a>
            <%
                }
            %>

        </div>

        <div class=" row " style="background-color: white;border-bottom: 1px solid lightgrey;">
            <div class="col-sm-2 border-top"><p class="title">Điện thoại</p></div>
            <div class="col-sm-10 border-top">
                <select name="Sort" id="" class="sort" style="display: none">
                    <option hidden value="" style="font-weight: bold">Sắp xếp</option>
                    <option value="">Giá từ thấp đến cao</option>
                    <option value="">Giá từ cao đến thấp</option>
                    <option value="">Giá dưới 3 triệu</option>
                    <option value="">Giá từ 3 - 7 triệu</option>
                    <option value="">Giá từ 7 - 11 triệu</option>
                    <option value="">Giá trên 11 triệu</option>
                </select>
            </div>
        </div>

        <ul class="row " style="padding: 10px;background-color: white;">
            <%
                ArrayList<ProductModel> list = (ArrayList<ProductModel>) request.getAttribute("searchByCategory");
                for (int i = 0; i < list.size(); i++) {
                    if(list.get(i).getActive() == 0){
                        i++;
                    }
            %>
            <div class="col-md-3 one-product-list">
                <a href="<%=UtilsPath.getPath("Productdetail?id="+list.get(i).getId())%>" class="img-link-opl">
                    <img src="<%= list.get(i).getImage() %>"
                         alt=""
                         class="img-one-product-list"></a>
                <a href="<%=UtilsPath.getPath("Productdetail?id="+list.get(i).getId())%>" class="name-product-opl"><%=list.get(i).getProductName()%>
                </a>
                <p class="price-product-opl"><%=PriceProcess.price(list.get(i).getPrice()) %> VND</p>
                <hr>
<%--                <div class="btn btn-cart-now"><i class="fas fa-shopping-cart"></i></div>--%>
                <a href="http://localhost:8080/ProjectWeb_1920/AddCart?id=<%=list.get(i).getId()%>&path=<%=request.getServletPath()%>&type=<%=list.get(i).getType()%>&page=<%=request.getParameter("page")%>"> <div class="btn btn-cart-now"><i class="fas fa-shopping-cart"></i></div></a>
                <a href="<%=UtilsPath.getPath("Productdetail?id="+list.get(i).getId())%>"><div class="btn btn-detail-product">Xem chi tiết</div></a>
            </div>
            <%
                }
            %>
        </ul>
        <div style="max-width: 228px;margin: 0px auto;">
            <nav aria-label="Page navigation example ">
                <ul class="pagination">
                    <%
                        ArrayList<String> listNumber = (ArrayList<String>) request.getAttribute("pageNumber");
                        for (int pageNumber = 0; pageNumber < listNumber.size(); pageNumber++) {
                    %>
                    <li class="page-item"><a class="page-link" id="active<%=pageNumber+1%>" href="<%=UtilsPath.getPath("productSeachByCategory?type="+request.getParameter("type")+"&page="+listNumber.get(pageNumber))%>"><%=listNumber.get(pageNumber)%></a></li>
                    <%
                        }
                    %>
                </ul>
            </nav>
        </div>
    </div>
</div>
<!--ket thuc content-->

<jsp:include page="button-scroll-top.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>
<!--Hết footer-->

<script type="text/javascript" src="lib/js/1.js"></script>
<script>
    $(document).ready(function() {
        <%
        if(request.getParameter("page") == null){
        %>
        $("#active1").attr("class", "page-link active-number");
        <%
        }else{
        %>
        $("#active<%=request.getParameter("page")%>").attr("class", "page-link active-number");
        <%
        }
        %>
    });

</script>

</body>
</html>