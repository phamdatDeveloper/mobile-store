<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.ProductDAOimpl" %>
<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page import="vn.com.dutmobile.model.ProductModel" %>
<%@ page import="vn.com.dutmobile.utils.PriceProcess" %>
<%@ page import="javax.xml.xpath.XPath" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width. initial-scale=1">
    <title>Trang chủ admin</title>
    <%--    <script type="text/javascript" src="vendor/jquery-3.4.1.min.js"></script>--%>
    <%--    <link rel="stylesheet" href="vendor/jquery-ui.css">--%>
    <%--    <script src="vendor/jquery-ui.js"></script>--%>
    <%--    <script type="text/javascript" src="vendor/bootstrap.min.js"></script>--%>
    <%--    <link rel="stylesheet" href="vendor/bootstrap.min.css">--%>
    <%--    <link rel="stylesheet" href="vendor/all.css">--%>
    <%--    <script type="text/javascript" src="vendor/all.js"></script>--%>
    <%--    <link rel="stylesheet" href="lib/css/style.css">--%>
    <%--    <link rel="stylesheet" href="lib/css/AdminStyle.css">--%>
    <%--    <link rel="stylesheet" href="vendor/dataTables.bootstrap4.min.css">--%>
    <%--    <link rel="stylesheet" href="vendor/bootstrap.css">--%>
    <%--    <script src="lib/ckeditor/ckeditor.js"></script>--%>
    <%--    <script src="lib/tinymce.min.js"></script>--%>


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
<%
    ProductDAOimpl productDAOimpl = new ProductDAOimpl();
    ProductModel productModel = new ProductModel();
%>
<div class="" style="max-width: 1320px !important;padding: 0px !important;">
    <div class="row section_content">
        <div class="col-sm-12">
            <div id="admin-bar">Administrator</div>
        </div>
        <div class="col-md-3 menu">
            <div id="accordion">
                <h3 style="text-transform: uppercase"><i class="fas fa-home pr-1"></i>Trang chủ Admin</h3>
                <div class="padding5">
                    <button class="tablinks button-bar" onclick="openCity(event, 'page1')"><i
                            class="fa fa-info-circle"></i> Thông tin
                    </button>
                    <a href="<%=UtilsPath.getPath("HomeController")%>">
                        <button class="tablinks button-bar " type="submit"> quay về Client</button>
                    </a>
                </div>
                <h3 style="text-transform: uppercase"><i class="fab fa-product-hunt pr-1"></i>Quản lý sản phẩm</h3>
                <div class="padding5">
                    <button class="tablinks button-bar" onclick="openCity(event, 'product_manager_info')"><i class="fa fa-info-circle"></i> Thông tin sản phẩm</button>
                    <button class="tablinks button-bar" onclick="openCity(event, 'product_manager_edit')"><i class="fas fa-edit"></i> Chỉnh sửa thông tin sản phẩm</button>
                </div>
                <h3 style="text-transform: uppercase"><i class="fas fa-scroll pr-1"></i>Quản lý đơn hàng</h3>
                <div class="padding5">
                    <button class="tablinks button-bar" onclick="openCity(event,'order_manager_info')"><i class="fa fa-info-circle"></i> Thông tin đơn hàng</button>
                </div>
                <h3 style="text-transform: uppercase"><i class="fas fa-users pr-1"></i>Quản lý khách hàng</h3>
                <div class="padding5">
                    <button class="tablinks button-bar" onclick="openCity(event,'user_manager_info')"><i class="fa fa-info-circle"></i> Thông tin khách hàng</button>
                    <%--                    <button class="tablinks button-bar" onclick="openCity(event,'user_manager_info')"><i--%>
                    <%--                            class="fa fa-info-circle"></i> Thông tin khách hàng--%>
                    <%--                    </button>--%>

                    <button class="tablinks button-bar" onclick="openCity(event,'user_manager_edit')"><i class="fas fa-edit"></i> Thay đổi thông tin khác hàng</button>
                </div>
                <h3 style="text-transform: uppercase"><i class="fas fa-clipboard pr-1"></i>Quản lý bài viết</h3>
                <div class="padding5">
                    <button class="tablinks button-bar" onclick="openCity(event,'news_manager_info')"><i class="fa fa-info-circle"></i> Thông tin bài viết
                    </button>
                    <button class="tablinks button-bar" onclick="openCity(event,'news_manager_edit')"><i class="fas fa-edit"></i> Thay đổi thông tin bài viết
                    </button>
                </div>
            </div>
        </div> <!--end col 3-->
        <div class="col-md-9">
            <div id="product_manager_info" class="tabcontent">
                <div class="row" style="width: 100%;">
                    <p class="col-md-10 title-info">Thông Tin sản Phẩm</p>
                    <div class="col-md-2">
                        <a href="http://localhost:8080/ProjectWeb_1920/Admin?page=product_manager_edit&active=add"><button id="btn-addnew">Thêm</button></a>
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
                        <td>Tác vụ</td>

                    </tr> <!--end header-table-->
                    </thead>

                    <tbody>
                    <%
                        ArrayList<ProductModel> productinfo = productDAOimpl.getAllProduct();
                        int count = 1;
                        for (ProductModel oneProduct : productinfo) {
                    %>
                    <tr>

                        <td><%=count%>
                        </td>
                        <td><%=oneProduct.getProductName()%>
                        </td>
                        <td><%=PriceProcess.price(oneProduct.getPrice())%>
                        </td>
                        <td><img src="<%=oneProduct.getImage()%>" alt=""
                                 style="width: 40px;height: 40px"></td>
                        <td><%=oneProduct.getPricePromotion()%>
                        </td>
                        <td>
                            <a href="<%=UtilsPath.getPath("EditProduct?id="+oneProduct.getId()+"&active=edit")%>"><i
                                    class="fas fa-edit" style="cursor: pointer"></i></a>
                            <a href="<%=UtilsPath.getPath("DeleteProduct?id="+oneProduct.getId())%>"> <i class="fas fa-trash" style="cursor: pointer"></i></a>
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
                        <div id="product_manager_edit" class="tabcontent">
                            <%
                                String checkAdd = request.getParameter("checkclickadd");
                                String path = "";
                            %>
                            <input type="text" id="check_click" name="checkclickadd" value="unclick" style="display: none;">

                            <p class="title-info ">Chỉnh Sửa Thông Tin sản Phẩm</p>

                            <form action="http://localhost:8080/ProjectWeb_1920/UpdateProduct" method="post">
                                <table class="table ">
                                    <tr>
                                        <td><p class="tensp">Tên Sản Phẩm:</p></td>
                                        <td>
                                            <input type="text" name="nameproduct" class="" >
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><p class="hsxsp">Hãng Sản Xuất Sản Phẩm:</p></td>
                                        <td>
                                            <select name="typeproduct" id="typeproduct">
                                                <%
                                                    ArrayList<String> productType = productDAOimpl.getTypeProduct();
                                                    for (String typeItem : productType) {
                                                %>

                                                <option value="<%=typeItem%>"><%=typeItem%>
                                                </option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><p class="loaisp">Giá sản phẩm:</p></td>
                                        <td>
                                            <input type="number" name="priceproduct" class=""></td>
                                    </tr>
                                    <tr>
                                        <td><p class="giasp">Khuyến mãi:</p></td>
                                        <td>
                                            <input name="promotion" id="khuyenmai" type="radio" value="yes"/>Có
                                            <input type="radio" id="khongkhuyenmai" name="promotion" value="no"/>Không <br>
                                            <div id="promotion" style="display: none;">
                                                <p class="giasp">Giá khuyến mãi:</p>
                                                <input type="number" name="pricepromotionproduct">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><p class="imgsp">Hình ảnh sản phẩm:</p></td>
                                        <td>
                                            <p>Ảnh đại diện</p>
                                            <div class="form-group">
                                                <input type="file" name="imageproduct" multiple="multiple"
                                                       class="form-control-file input-file"
                                                       id="exampleFormControlFile1">
                                            </div>
                                            <p>Ảnh chi tiết</p>
                                            <input type="text" name="numberimg" id="number-image" value="1" style="display: none;">
                                            <ol id="image-detail">
                                                <li class="li-image-1"><input class="input-file" name="input-image-1" type="file">
                                                </li>
                                            </ol>

                                            <input class="btn-add-delete" type="button" id="add-image" value="thêm">
                                            <input class="btn-add-delete" type="button" id="delete-image" value="xóa">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><p class="motasp">Mô tả sản phẩm:</p></td>
                                        <td>
                                        <textarea class="ckeditor" name="decriptionproduct" id="" cols="40"
                                                  rows="10"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td><p class="info-kythuat">Thông số kỹ thuật</p></td>
                                        <td>
                                            <input type="number" name="number-detail" id="number-detail" value="1"
                                                   style="display: none;">

                                            <div class="row">
                                                <div class="col-md-6">
                                                    <p>Tiêu đề</p>
                                                    <ol id="title-detail">
                                                        <li class="li-1"><input type="text" name="input-title-1"></li>
                                                    </ol>
                                                </div>
                                                <div class="col-md-6">
                                                    <p>Thông số</p>
                                                    <ul id="text-detail" style="list-style-type: none;">
                                                        <li class="li-1"><input type="text" name="input-1"></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <input class="btn-add-delete" id="add-detail" type="button" value="Thêm">

                                            <input class="btn-add-delete" id="delete-detail" type="button" value="Xóa">
                                        </td>
                                    </tr>
                                </table>
                                </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <div class="buttons-tac-vu">
                                            <input id="submit-product" class="btn btn-info" type="submit" value="Lưu">
                                            <input class="btn btn-warning" type="reset" value="Hủy">
                                        </div>
                                    </td>
                                </tr>
                                </table>
                            </form>
                        </div>

            <div id="order_manager_info" class="tabcontent">
                <p class="title-info">Thông Tin Đơn Hàng</p>
                <hr>

                <table id="table-info-order" class="table table-striped table-bordered ">
                    <thead>
                    <tr class="header-table">
                        <td><input type="checkbox" name="checkbox-table" value="1"></td>
                        <td>Mã Đơn Hàng</td>
                        <td>Tên Khách Hàng</td>
                        <td>Ngày Đặt</td>
                        <td>Hình Thức</td>
                        <td>Địa Chỉ</td>
                        <td>Trạng Thái</td>
                        <td>Tác vụ</td>
                    </tr> <!--end header-table-->
                    </thead>
                    <tbody>
                    <tr>
                        <td><input type="checkbox" name="checkbox-table" value="1"></td>
                        <td>DMHH</td>
                        <td>Nguyễn Hữu Hải</td>
                        <td>Chưa biết</td>
                        <td>Chuyển khoảng</td>
                        <td>TPHCM</td>
                        <td>Đang giao</td>
                        <td><i class="fas fa-edit" style="cursor: pointer"></i><i
                                class="fas fa-trash"
                                style="cursor: pointer"></i>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="checkbox-table" value="1"></td>
                        <td>DMHH</td>
                        <td>Nguyễn Hữu Hải</td>
                        <td>Chưa biết</td>
                        <td>Chuyển khoảng</td>
                        <td>TPHCM</td>
                        <td>Đang giao</td>
                        <td><i class="fas fa-edit" style="cursor: pointer"></i><i
                                class="fas fa-trash"
                                style="cursor: pointer"></i>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="checkbox-table" value="1"></td>
                        <td>DMHH</td>
                        <td>Nguyễn Hữu Hải</td>
                        <td>Chưa biết</td>
                        <td>Chuyển khoảng</td>
                        <td>TPHCM</td>
                        <td>Đang giao</td>
                        <td><i class="fas fa-edit" style="cursor: pointer"></i><i
                                class="fas fa-trash"
                                style="cursor: pointer"></i>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="checkbox-table" value="1"></td>
                        <td>DMHH</td>
                        <td>Nguyễn Hữu Hải</td>
                        <td>Chưa biết</td>
                        <td>Chuyển khoảng</td>
                        <td>TPHCM</td>
                        <td>Đang giao</td>
                        <td><i class="fas fa-edit" style="cursor: pointer"></i><i
                                class="fas fa-trash"
                                style="cursor: pointer"></i>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="checkbox-table" value="1"></td>
                        <td>DMHH</td>
                        <td>Nguyễn Hữu Hải</td>
                        <td>Chưa biết</td>
                        <td>Chuyển khoảng</td>
                        <td>TPHCM</td>
                        <td>Đang giao</td>
                        <td><i class="fas fa-edit" style="cursor: pointer"></i><i
                                class="fas fa-trash"
                                style="cursor: pointer"></i>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="checkbox-table" value="1"></td>
                        <td>DMHH</td>
                        <td>Nguyễn Hữu Hải</td>
                        <td>Chưa biết</td>
                        <td>Chuyển khoảng</td>
                        <td>TPHCM</td>
                        <td>Đang giao</td>
                        <td><i class="fas fa-edit" style="cursor: pointer"></i><i
                                class="fas fa-trash"
                                style="cursor: pointer"></i>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="checkbox-table" value="1"></td>
                        <td>DMHH</td>
                        <td>Nguyễn Hữu Hải</td>
                        <td>Chưa biết</td>
                        <td>Chuyển khoảng</td>
                        <td>TPHCM</td>
                        <td>Đang giao</td>
                        <td><i class="fas fa-edit" style="cursor: pointer"></i><i
                                class="fas fa-trash"
                                style="cursor: pointer"></i>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="checkbox-table" value="1"></td>
                        <td>DMHH</td>
                        <td>Nguyễn Hữu Hải</td>
                        <td>Chưa biết</td>
                        <td>Chuyển khoảng</td>
                        <td>TPHCM</td>
                        <td>Đang giao</td>
                        <td><i class="fas fa-edit" style="cursor: pointer"></i><i
                                class="fas fa-trash"
                                style="cursor: pointer"></i>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="checkbox-table" value="1"></td>
                        <td>DMHH</td>
                        <td>Nguyễn Hữu Hải</td>
                        <td>Chưa biết</td>
                        <td>Chuyển khoảng</td>
                        <td>TPHCM</td>
                        <td>Đang giao</td>
                        <td><i class="fas fa-edit" style="cursor: pointer"></i><i
                                class="fas fa-trash"
                                style="cursor: pointer"></i>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="checkbox-table" value="1"></td>
                        <td>DMHH</td>
                        <td>Nguyễn Hữu Hải</td>
                        <td>Chưa biết</td>
                        <td>Chuyển khoảng</td>
                        <td>TPHCM</td>
                        <td>Đang giao</td>
                        <td><i class="fas fa-edit" style="cursor: pointer"></i><i
                                class="fas fa-trash"
                                style="cursor: pointer"></i>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="checkbox-table" value="1"></td>
                        <td>DMHH</td>
                        <td>Nguyễn Hữu Hải</td>
                        <td>Chưa biết</td>
                        <td>Chuyển khoảng</td>
                        <td>TPHCM</td>
                        <td>Đang giao</td>
                        <td><i class="fas fa-edit" style="cursor: pointer"></i><i
                                class="fas fa-trash"
                                style="cursor: pointer"></i>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="checkbox-table" value="1"></td>
                        <td>DMHH</td>
                        <td>Nguyễn Hữu Hải</td>
                        <td>Chưa biết</td>
                        <td>Chuyển khoảng</td>
                        <td>TPHCM</td>
                        <td>Đang giao</td>
                        <td><i class="fas fa-edit" style="cursor: pointer"></i><i
                                class="fas fa-trash"
                                style="cursor: pointer"></i>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="checkbox-table" value="1"></td>
                        <td>DMHH</td>
                        <td>Nguyễn Hữu Hải</td>
                        <td>Chưa biết</td>
                        <td>Chuyển khoảng</td>
                        <td>TPHCM</td>
                        <td>Đang giao</td>
                        <td><i class="fas fa-edit" style="cursor: pointer"></i><i
                                class="fas fa-trash"
                                style="cursor: pointer"></i>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="checkbox-table" value="1"></td>
                        <td>DMHH</td>
                        <td>Nguyễn Hữu Hải</td>
                        <td>Chưa biết</td>
                        <td>Chuyển khoảng</td>
                        <td>TPHCM</td>
                        <td>Đang giao</td>
                        <td><i class="fas fa-edit" style="cursor: pointer"></i><i
                                class="fas fa-trash"
                                style="cursor: pointer"></i>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="checkbox-table" value="1"></td>
                        <td>DMHH</td>
                        <td>Nguyễn Hữu Hải</td>
                        <td>Chưa biết</td>
                        <td>Chuyển khoảng</td>
                        <td>TPHCM</td>
                        <td>Đang giao</td>
                        <td><i class="fas fa-edit" style="cursor: pointer"></i><i
                                class="fas fa-trash"
                                style="cursor: pointer"></i>
                        </td>
                    </tr>
                    </tbody>
                    <tfoot></tfoot>
                </table>

            </div>
            <div id="user_manager_info" class="tabcontent">
                <p class="title-info">Thông Tin Khách Hàng</p>
                <hr>
                <!--                    <div class="tools">-->
                <!--                        <select class="select-find heigh-40 padding-element">-->
                <!--                            <option value="">Tác Vụ</option>-->
                <!--                            <option value="id">Thêm</option>-->
                <!--                            <option value="ten">Sửa</option>-->
                <!--                            <option value="soluong">Xóa</option>-->
                <!--                        </select>-->
                <!--                        <input type="text reseach" class="find heigh-40 padding-element" placeholder="Tìm kiếm">-->
                <!--                        <select class="select-find heigh-40 padding-element">-->
                <!--                            <option value="">Tìm theo</option>-->
                <!--                            <option value="id">Id</option>-->
                <!--                            <option value="ten">Tên</option>-->
                <!--                            <option value="soluong">Số lượng</option>-->
                <!--                        </select>-->
                <!--                        <select class="appearance heigh-40 padding-element">-->
                <!--                            <option value="">Hiển thị số lượng</option>-->
                <!--                            <option value="5">5</option>-->
                <!--                            <option value="10">10</option>-->
                <!--                            <option value="15">15</option>-->
                <!--                            <option value="20">20</option>-->
                <!--                        </select>-->
                <!--                        <button class="btn btn-info heigh-40 button-adding"><i class="fas fa-plus"></i>Thêm mới</button>-->
                <!--                    </div>-->
                <table id="table-info" class="table table-striped table-bordered " style="width:100%">
                    <thead>
                    <tr class="header-table">
                        <%--                        <td class="set"><input type="checkbox" name="checkbox-table" value="1"></td>--%>
                        <td class="set">STT</td>
                        <td class="set">UserName</td>
                        <td class="set"> Tên Hiển Thị</td>
                        <td class="set">Email</td>
                        <td class="set">Số điện Thoại</td>
                        <td class="set">Loại tài khoản</td>
                        <td class="set">Tác vụ</td>
                    </tr> <!--end header-table-->
                    </thead>
                    <tbody>
                    <tr>
                        <%--                        <td><input type="checkbox" name="checkbox-table" value="1"></td>--%>
                        <td>1</td>
                        <td>Nguyễn Hữu Hải</td>
                        <td>Hải</td>
                        <td>haingyen@gmail.com</td>
                        <td>0338070475</td>
                        <td></td>
                        <td><i class="fas fa-edit" style="cursor: pointer"></i><i
                                class="fas fa-trash"
                                style="cursor: pointer"></i>
                        </td>
                    </tr>
                    </tbody>
                    <tfoot>

                    </tfoot>
                </table>
            </div>

            <div id="user_manager_edit" class="tabcontent">
                <p class="title-info">Chỉnh Sửa Thông Tin Khách Hàng</p>
                <form action="" style="width: 100%;">
                    <table class="table ">
                        <tr>
                            <td><p>Loại tài khoản:</p></td>
                            <td><select class="select-tag" name="" id="">
                                <option value="">Quản trị viên</option>
                                <option value="">Người dùng</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td><p>Tên hiển thị:</p></td>
                            <td><input type="text" name="email" placeholder="Nhập Email" class="" value=""></td>
                        </tr>
                        <tr>
                            <td><p>Email:</p></td>
                            <td><input class="margin8" type="text"></td>
                        </tr>
                        <tr>
                            <td><p>Số điện thoại:</p></td>
                            <td><input type="text" name="sdt" placeholder="Nhập số điện thoại" class="" value=""></td>
                        </tr>
                        <tr>
                            <td><p>Giới tính:</p></td>
                            <td><select class="select-tag" name="gender">
                                <option value="Nam">Nam</option>
                                <option value="Nu">Nữ</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td><p>Địa chỉ:</p></td>
                            <td><textarea name="" cols="30" rows="10"></textarea></td>
                        </tr>
                        <tr>
                            <td><p>Ngày sinh:</p></td>
                            <td><input type="date" name="dob" placeholder="YYYY-MM-DD" required="required"
                                       style=""></td>

                        </tr>
                        <tr>
                            <td><p>Mật khẩu:</p></td>
                            <td><input type="text" name="password" placeholder="Nhập mật khẩu" class="" value=""></td>
                        </tr>
                        <tr>
                            <td><p>Xác nhận mật khẩu:</p></td>
                            <td><input type="text" name="repassword" placeholder="Xác nhận mật khẩu" class="" value="">
                            </td>
                        </tr>
                        <tr>
                            <td><p>Active:</p></td>
                            <td><label style="cursor: pointer;" value="1">
                                <input name="active" type="radio" value="1">
                                <p style="">Có</p>
                            </label>
                                <label style="cursor: pointer;" value="0">
                                    <input name="active" type="radio" value="0">
                                    <p style="">Không</p>
                                </label></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <div class="contain-btn">
                                    <button type="submit" class="btn btn-info">Lưu</button>
                                    <button type="reset" class="btn btn-info yellow">Hủy</button>
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div id="news_manager_info" class="tabcontent">
                <p class="title-info">Thông Tin Bài Viết</p>
                <hr>
                <table id="table-info-news" class="table table-striped table-bordered " style="width:100%">
                    <thead>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td class="baiviet">STT</td>
                        <td class="baiviet">Tên bài viết</td>
                        <td class="baiviet">Loại bài viết</td>
                        <td class="baiviet">Hiển thị</td>
                        <td>Nội Dung Bài Viết</td>
                        <td class="baiviet">Tác vụ</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td><p>Update ios13</p></td>
                        <td><p>Tin tức</p></td>
                        <td><textarea name="formotasp" id="text-for" cols="30" rows="1"></textarea></td>
                        <td><input type="checkbox"></td>
                        <td>
                            <i class="fas fa-edit" style="cursor: pointer"></i>
                            <i class="fas fa-trash" style="cursor: pointer"></i>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td><p>Update ios13</p></td>
                        <td><p>Tin tức</p></td>
                        <td><textarea name="formotasp" id="text" cols="30" rows="1"></textarea></td>
                        <td><input type="checkbox"></td>
                        <td>
                            <i class="fas fa-edit" style="cursor: pointer"></i>
                            <i class="fas fa-trash" style="cursor: pointer"></i>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td><p>Update ios13</p></td>
                        <td><p>Tin tức</p></td>
                        <td><textarea name="formotasp" id="text-fo" cols="30" rows="1"></textarea></td>
                        <td><input type="checkbox"></td>
                        <td>
                            <i class="fas fa-edit" style="cursor: pointer"></i>
                            <i class="fas fa-trash" style="cursor: pointer"></i>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td><p>Update ios13</p></td>
                        <td><p>Tin tức</p></td>
                        <td><textarea name="formotasp" id="text-f" cols="30" rows="1"></textarea></td>
                        <td><input type="checkbox"></td>
                        <td>
                            <i class="fas fa-edit" style="cursor: pointer"></i>
                            <i class="fas fa-trash" style="cursor: pointer"></i>
                        </td>
                    </tr>
                    </tbody>
                    <tfoot>

                    </tfoot>
                </table>
            </div>
            <div id="news_manager_edit" class="tabcontent">
                <p class="title-info">Chỉnh Sửa Thông Tin Bài Viết</p>
                <table class="table ">
                    <tr>
                        <td><p class="tensp">Tiêu Đề Bài Viết:</p></td>
                        <td><input type="text" class=""></td>
                    </tr>
                    <tr>
                        <td><p class="loaisp">Loại Bài Viết:</p></td>
                        <td><select style="margin-bottom: 10px;width: 300px;border-color: #cacaca">
                            <option value="">Loại Bài Viết</option>
                            <option value="moi">Xã Hội</option>
                            <option value="noibat">Công Nghệt</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td><p class="motasp">Nội Dung Bài Viết:</p></td>
                        <td>
                            <textarea class="ckeditor" name="formotasp" cols="80"
                                      rows="30"></textarea>


                        </td>

                    </tr>
                    <tr>
                        <td><p class="info-kythuat">Ngày Đăng Bài Viết</p></td>
                        <td><input type="text" class=""></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <div class="buttons-tac-vu">
                                <button class="btn btn-info" type="submit">Lưu</button>
                                <button class="btn btn-warning">Hủy</button>
                            </div> <!--end buttons-tac-vu-->
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

</div> <!--end col 3-->
</div>
</div> <!--end col 9-->
</div> <!--end row-->
</div> <!--end container-->
<script type="text/javascript" src="<%=UtilsPath.getPathAdmin("lib/js/admin.js")%>"></script>
<script src="<%=UtilsPath.getPathAdmin("vendor/jquery.dataTables.min.js")%>"></script>
<script src="<%=UtilsPath.getPathAdmin("vendor/dataTables.bootstrap4.min.js")%>"></script>

<script>
    // function edit() {
    //     document.getElementById("taginput").style.display = 'block';
    //     document.getElementsByName("tagp").style.display = "none";
    // }

    <%--window.onload = function () {--%>
    <%--    openCity(event, '<%=request.getParameter("page")%>');--%>
    <%--};--%>


    <%--$(document).ready(function () {--%>
    <%--    $("#btn-addnew").click(function () {--%>
    <%--        $("#product_manager_edit").show();--%>
    <%--        $("#product_manager_info").hide();--%>
    <%--        $("#check_click").val("click");--%>
    <%--        $("#submit-product").val("Thêm");--%>
    <%--    });--%>
    <%--});--%>
    <%--$(document).ready(function () {--%>
    <%--    $("input[name='promotion']").click(function () {--%>
    <%--        var inputValue = $(this).attr("value");--%>
    <%--        if (inputValue == "yes") {--%>
    <%--            $("#promotion").show();--%>
    <%--        } else {--%>
    <%--            $("#promotion").hide();--%>
    <%--        }--%>
    <%--    });--%>
    <%--});--%>
    <%--var number = 1;--%>
    <%--$(document).ready(function () {--%>
    <%--    $("#add-detail").click(function () {--%>
    <%--        number++;--%>
    <%--        $("#title-detail").append("<li class=li-" + number + "><input type=text class='" + number + "' name=input-title-" + number + "></li>");--%>
    <%--        $("#text-detail").append("<li class=li-" + number + "><input type=text class='" + number + "' name=input-" + number + "></li>");--%>
    <%--        $("#number-detail").val(number);--%>

    <%--    });--%>
    <%--});--%>
    <%--$(document).ready(function () {--%>
    <%--    $("#delete-detail").click(function () {--%>
    <%--        number--;--%>
    <%--        if (number < 1) {--%>
    <%--            number = 1;--%>
    <%--        }--%>
    <%--        var i = $("#number-detail").val();--%>
    <%--        $(".li-" + i).remove();--%>
    <%--        $("#number-detail").val(number);--%>

    <%--    })--%>
    <%--});--%>
    <%--var numberImage = 1;--%>
    <%--$(document).ready(function () {--%>
    <%--    $("#add-image").click(function () {--%>
    <%--        numberImage++;--%>
    <%--        $("#image-detail").append("<li class=li-img-" + numberImage + "><input type=file class='" + numberImage + " input-file' name=input-image-" + numberImage + "></li>");--%>
    <%--        $("#number-image").val(numberImage);--%>
    <%--    });--%>
    <%--});--%>
    <%--$(document).ready(function () {--%>
    <%--    $("#delete-image").click(function () {--%>
    <%--        numberImage--;--%>
    <%--        if (numberImage < 1) {--%>
    <%--            numberImage = 1;--%>
    <%--        }--%>
    <%--        var i = $("#number-image").val();--%>
    <%--        $(".li-img-" + i).remove();--%>
    <%--        $("#number-image").val(numberImage);--%>
    <%--    })--%>
    <%--});--%>

</script>
</body>
</html>