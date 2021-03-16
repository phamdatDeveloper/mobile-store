<%@ page import="vn.com.dutmobile.model.Cart" %>
<%@ page import="vn.com.dutmobile.model.ProductModel" %>
<%@ page import="vn.com.dutmobile.utils.PriceProcess" %>
<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang Giỏ Hàng</title>
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
    <link rel="stylesheet" href="http://localhost:8080/ProjectWeb_1920/lib/css/styleCart.css">
</head>
<body>
<!--header-->
<!--<logo - login-reg>-->
<jsp:include page="header.jsp"></jsp:include>
<!--Hết header-->

<div class="container" style="padding-top: 100px">
    <table id="cart" class="table table-hover table-condensed" style="background-color: white;">
        <thead>
        <tr>
            <th style="width:20%;text-align: center">Hình ảnh</th>
            <th style="width:20%;text-align: center">Tên</th>
            <th style="width:15%;text-align: center">Giá tiền</th>
            <th style="width:15% ; text-align: center">Số lượng</th>
            <th style="width:20%;text-align: center" class="text-center">Tổng Tiền</th>
            <th style="width:20%;text-align: center">Thao tác</th>
        </tr>
        </thead>
        <tbody class="product">
        <% Cart cart = (Cart) request.getAttribute("Cart");
            if (cart == null) cart = new Cart();
            for (ProductModel p : cart.list()) {

        %>
        <tr>
            <td data-th="Product">
                <div class="row">
                    <div><img src="<%=p.getImage()%>"
                              style="width: 180px ; height: 150px;background-image: none"></div>
                    <div class="col-sm-10">
                    </div>
                </div>
            </td>
            <td data-th="Price"><p class="product-title" style="margin-bottom: 0px"><%=p.getProductName()%>
            </p></td>
            <td data-th="Subtotal" class="text-center cartPrice"><%=PriceProcess.price(p.getPrice()) + " VND"%>
            </td>
            <td data-th="Quantity" class="quantity">
                <form method="post" action="<%=UtilsPath.getPath("UpdateQuantityCart")%>">
                    <input type="hidden" name="id" value="<%=p.getId()%>">
                    <input type="number" min="1" name="quantity"
                           class="form-control text-center"
                           style="width: 60%; display: inline-block"
                           value="<%=p.getQuantity()%>">
                    <button type="submit" class="btn btn-info btn-sm"><i class="fas fa-sync-alt"></i></button>
                </form>
            </td>
            <td id="sumPrice_<%=p.getId()%>">
                <p style="margin-left: 60px;margin-top: 10px"><%=PriceProcess.price(p.totalSum())%>  VND</p>
            </td>
            <td class="actions" data-th="" class="product-quantity">
                <%--                <button class="btn btn-info btn-sm"><i class="fas fa-sync-alt"></i></button>--%>
                <button class="btn btn-danger btn-sm" style="margin-left: 27px;background: white;border: none"><a
                        href="<%= UtilsPath.getPath("DeleteProductCart?id="+p.getId())%>"><i
                        class="fas fa-trash-alt"></i></a></button>
            </td>
            <%}%>
        </tr>
        </tbody>
        <tfoot>

        <tr>
            <td colspan="4" class="hidden-xs" style="margin-left: 100px"></td>
            <td>
                <div href=""
                     style="width: 220px"><%="Tổng Tiền : " + PriceProcess.price(cart.total()) + " VND"%>
                </div>
            </td>
            <%--            <% if (cart.total() == 0) {%>--%>

            <td><a href="<%=UtilsPath.getPath("CheckNullCart")%>" class="btn btn-success btn-block">Mua Hàng</a></td>
        </tr>
        <button type="submit" style="display: none" id="click_btn_fail" class="btn-order" data-toggle="modal"
                data-target="#fail"> Tiến Hành
        </button>

        <%
            String mess_fail = (String) request.getAttribute("mes_fail");
            if (mess_fail != null) {
        %>
        <script>
            $(function () {
                $('#click_btn_fail').click();

                window.onclick = function () {
                    window.location.href = 'http://localhost:8080/ProjectWeb_1920/ListProduct';
                }
            });
            <%
            }
            %>

        </script>

        <div class="modal fade" id="fail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" style="margin-top: 100px">
                <div class="loginmodal-container">
                    <p class="titel">Mua Hàng Không Thành Công</p>
                    <p class="thank">Bạn Chưa Có Sản Phẩm Nào Trong Giỏ Hàng</p>

                </div>
            </div>
        </div>
        </tfoot>
    </table>
</div>

<button style="display: none" type="submit" id="click_btn" class="btn-order" data-toggle="modal"
        data-target="#login-modal"></button>

<%

    String mess = (String) session.getAttribute("mes_success");
    if (mess != null) {
%>
<script>
    $(function () {
        $('#click_btn').click();

        window.onclick = function () {
            <%
           session.removeAttribute("mes_success");
           %>
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

<jsp:include page="button-scroll-top.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>
<!--Hết footer-->
<script type="text/javascript" src="lib/js/1.js">


</script>
</body>
</html>