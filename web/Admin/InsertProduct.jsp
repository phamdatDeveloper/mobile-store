<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.ProductDAOimpl" %>
<%@ page import="vn.com.dutmobile.model.ProductModel" %>
<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
    <title>Thêm sản phẩm</title>

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
    <script src="<%=UtilsPath.getPathAdmin("lib/ckfinder/ckfinder.js")%>"></script>

</head>
<body>
<div class="">
    <div class="row section_content">
        <jsp:include page="SlideBar.jsp"></jsp:include>
        <div class="col-md-9">
            <div id="product_manager_edit" class="">
                <input type="text" id="check_click" name="checkclickadd" value="unclick" style="display: none;">

                <p class="title-info ">Thêm sản Phẩm</p>

                <form action="http://localhost:8080/ProjectWeb_1920/InsertProduct" method="post">
                    <table class="table ">
                        <tr>
                            <td><p class="tensp">Tên Sản Phẩm:</p></td>
                            <td>
                                <input type="text" name="nameproduct" class="" required style="width: 50%">
                            </td>
                        </tr>
                        <tr>
                            <td><p class="hsxsp">Hãng Sản Xuất Sản Phẩm:</p></td>
                            <td>
                                <select name="typeproduct" id="typeproduct" required style="width: 50%">
                                    <%
                                        ProductDAOimpl productDAOimpl = new ProductDAOimpl();
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
                                <input type="number" name="priceproduct" class="" required style="width: 50%"></td>
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

                                    <input id="input-image-home" name="imageproduct"  type="text" size="60"  />
                                    <input type="button" value="Chọn ảnh" onclick="BrowseServer( '', 'input-image-home' );" />
                                </div>
                                <p>Ảnh chi tiết</p>
                                <input type="text" name="numberimg" id="number-image" value="1" style="display: none;">
                                <ol id="image-detail">
                                    <li class="li-image-1">
                                        <input id="input-image-1" name="input-image-1"  type="text" size="60"  />
                                        <input type="button" value="Chọn ảnh" onclick="BrowseServer( '', 'input-image-1');" />
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
                                      rows="10" required></textarea></td>
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
                                            <li class="li-1"><input type="text" name="input-title-1" required></li>
                                        </ol>
                                    </div>
                                    <div class="col-md-6">
                                        <p>Thông số</p>
                                        <ul id="text-detail" style="list-style-type: none;">
                                            <li class="li-1"><input type="text" name="input-1" required></li>
                                        </ul>
                                    </div>
                                </div>
                                <input class="btn-add-delete" id="add-detail" type="button" value="Thêm">

                                <input class="btn-add-delete" id="delete-detail" type="button" value="Xóa">
                            </td>
                        </tr>
                        <tr>
                            <td>Hiển thị</td>
                            <td>
                                <input type="radio" name="show" value="1">hiện
                                <input type="radio" name="show" value="0">ẩn
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <div class="buttons-tac-vu">
                                    <input id="submit-product" class="btn btn-info" type="submit" value="Thêm">
<%--                                    <input class="btn btn-warning" type="reset" value="Hủy">--%>
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=UtilsPath.getPathAdmin("lib/js/admin.js")%>"></script>
<script src="<%=UtilsPath.getPathAdmin("vendor/jquery.dataTables.min.js")%>"></script>
<script src="<%=UtilsPath.getPathAdmin("vendor/dataTables.bootstrap4.min.js")%>"></script>
<Script>
    var f = CKEDITOR.replace("ckeditor");
    CKFinder.setupCKEditor(f, 'lib/ckfinder/');
</Script>
</body>
</html>
