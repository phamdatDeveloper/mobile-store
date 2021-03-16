<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page import="vn.com.dutmobile.model.ProductModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.ProductDAOimpl" %>
<%@ page import="vn.com.dutmobile.utils.PriceProcess" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <script type="text/javascript" src="<%=UtilsPath.getPathAdmin("vendor/jquery-3.4.1.min.js")%>"></script>
    <link rel="stylesheet" href="<%=UtilsPath.getPathAdmin("vendor/jquery-ui.css")%>">
    <script src="<%=UtilsPath.getPathAdmin("vendor/jquery-ui.js")%>"></script>
    <script type="text/javascript" src="<%=UtilsPath.getPathAdmin("vendor/bootstrap.min.js")%>"></script>
    <link rel="stylesheet" href="<%=UtilsPath.getPathAdmin("vendor/bootstrap.min.css")%>">
    <link rel="stylesheet" href="<%=UtilsPath.getPathAdmin("vendor/all.css")%>">
    <script type="text/javascript" src="<%=UtilsPath.getPathAdmin("vendor/all.js")%>"></script>
    <link rel="stylesheet" href="<%=UtilsPath.getPathAdmin("lib/css/style.css")%>">
    <link rel="stylesheet" href="<%=UtilsPath.getPathAdmin("lib/css/AdminStyle.css")%>">
    <link rel="stylesheet" href="<%=UtilsPath.getPathAdmin("vendor/dataTables.bootstrap4.min.css")%>">
    <link rel="stylesheet" href="<%=UtilsPath.getPathAdmin("vendor/bootstrap.css")%>">
    <script src="<%=UtilsPath.getPathAdmin("lib/ckeditor/ckeditor.js")%>"></script>
</head>
<body>
<div class="" >
    <div class="row section_content">
        <jsp:include page="SlideBar.jsp"></jsp:include>
        <div class="col-md-9">
            <div id="product_manager_info" class="active">
                <div class="row" style="width: 100%;">
                    <p class="col-md-10 title-info">Thông Tin sản Phẩm</p>
                    <div class="col-md-2">
                        <a href="http://localhost:8080/ProjectWeb_1920/Admin/InsertProduct.jsp">
                            <button id="btn-addnew">Thêm</button>
                        </a>
                    </div>
                </div>
                <hr>
                <table id="table-info-product" class="table table-striped table-bordered " style="width:100%;">
                    <thead>
                    <tr class="header-table">

                        <td>STT</td>
                        <td>Tên sản phẩm</td>
                        <td>Giá</td>
                        <td>Ảnh</td>
                        <td>Giá KM</td>
                        <td>Hiển thị</td>
                        <td>Tác vụ</td>

                    </tr> <!--end header-table-->
                    </thead>

                    <tbody>
                    <%
                        ProductDAOimpl productDAOimpl = new ProductDAOimpl();
                        ArrayList<ProductModel> productinfo = productDAOimpl.getAllProduct();
                        int count = 1;
                        for (ProductModel oneProduct : productinfo) {
                    %>
                    <tr>
                        <td><%=count%>
                        </td>
                        <td><%=oneProduct.getProductName()%>
                        </td>
                        <td><%=PriceProcess.price(oneProduct.getPrice())%> đ
                        </td>
                        <td><img src="<%=oneProduct.getImage()%>" alt=""
                                 style="width: 40px;height: 40px"></td>
                        <td><%=PriceProcess.price(oneProduct.getPricePromotion())%> đ</td>
                        <%
                            String srcImg="";
                            if(oneProduct.getActive() == 1){
                                srcImg="images/yes.png";
                            }else{
                                srcImg="images/no.png";
                            }
                        %>
                        <td><img src="<%=UtilsPath.getPath(srcImg)%>" alt="" style="width:30px;height:30px;"></td>
                        <td>
                            <a href="<%=UtilsPath.getPath("Admin/update-product.jsp?id="+oneProduct.getId())%>"><i
                                    class="fas fa-edit" style="cursor: pointer"></i></a>
                            <a href="<%=UtilsPath.getPath("DeleteProduct?id="+oneProduct.getId())%>"> <i
                                    class="fas fa-trash" style="cursor: pointer"></i></a>
                        </td>
                    </tr>
                    <%
                            count++;
                        }
                    %>

                    </tbody>

                    <tfoot></tfoot>

                </table>
                <!--pagination-->
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=UtilsPath.getPathAdmin("lib/js/admin.js")%>"></script>
<script src="<%=UtilsPath.getPathAdmin("vendor/jquery.dataTables.min.js")%>"></script>
<script src="<%=UtilsPath.getPathAdmin("vendor/dataTables.bootstrap4.min.js")%>"></script>
<script>
    $(document).ready(function() {
        $('#table-info-product').DataTable();
    } );
</script>
</body>
</html>
