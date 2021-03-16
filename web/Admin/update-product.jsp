<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.ProductDAOimpl" %>
<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page import="vn.com.dutmobile.model.ProductModel" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
    <title>Sửa sản phẩm</title>
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
            <form action="http://localhost:8080/ProjectWeb_1920/UpdateProduct?id=<%=request.getParameter("id")%>"
                  method="post">
                <%
                    ProductDAOimpl productDAO = new ProductDAOimpl();
                    ProductModel product = new ProductModel();
                    request.setCharacterEncoding("UTF-8");
                    response.setCharacterEncoding("UTF-8");
                    product = productDAO.getProductById(Integer.parseInt(request.getParameter("id")));
                %>
                <table class="table ">
                    <tr>
                        <td><p class="tensp">Tên Sản Phẩm:</p></td>
                        <td>
                            <input type="text" name="nameproduct" class="" value="<%=product.getProductName()%>"
                                   required>
                        </td>
                    </tr>
                    <tr>
                        <td><p class="hsxsp">Hãng Sản Xuất Sản Phẩm:</p></td>
                        <td>
                            <select name="typeproduct" id="typeproduct">
                                <option value="<%=product.getType()%>" selected hidden><%=product.getType()%>
                                </option>
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
                            <input type="number" name="priceproduct" class=""
                                   value="<%=Math.round(product.getPrice())%>"></td>
                    </tr>
                    <tr>
                        <td><p class="giasp">Khuyến mãi:</p></td>
                        <td>
                            <%
                                String checkedYes = "";
                                String checkedNo = "";
                                System.out.println(product.getPricePromotion());
                                if (product.getPricePromotion() > 0) {
                                    checkedYes = "checked";
                                } else {
                                    checkedNo = "checked";
                                }
                            %>
                            <input name="promotion" id="khuyenmai" type="radio" value="yes" <%=checkedYes%> />Có
                            <input type="radio" id="khongkhuyenmai" name="promotion" value="no" <%=checkedNo%> />Không
                            <br>
                            <div id="promotion" style="display: none;">
                                <p class="giasp">Giá khuyến mãi:</p>
                                <input type="number" name="pricepromotionproduct"
                                       value="<%=Math.round(product.getPricePromotion())%>">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><p class="imgsp">Hình ảnh sản phẩm:</p></td>
                        <td>
                            <p>Ảnh đại diện</p>
                            <div class="form-group">
                                <input id="input-image-home" name="imageproduct" type="text" size="60"
                                       value="<%=product.getImage()%>"/>
                                <input type="button" value="Chọn ảnh"
                                       onclick="BrowseServer( '', 'input-image-home' );"/>
                            </div>
                            <p>Ảnh chi tiết</p>
                            <%
                                String[] img = product.getImageDetail().split("-");
                                int numberImg = img.length;
                            %>
                            <input type="text" name="numberimg" id="number-image" value="<%=numberImg%>" style="display: none;">
                            <ol id="image-detail">
                                <%
                                    for (int i = 0; i < img.length; i++) {
                                %>


                                <li class="li-img-<%=i+1%>">

                                    <input id="input-image-<%=i+1%>" name="input-image-<%=i+1%>" type="text" size="60"
                                           value="<%=img[i]%>"/>
                                    <input type="button" value="Chọn ảnh"
                                           onclick="BrowseServer( '', 'input-image-<%=i+1%>');"/>
                                </li>
                                <%
                                    }
                                %>
                            </ol>

                            <input class="btn-add-delete" type="button" id="add-image" value="thêm">
                            <input class="btn-add-delete" type="button" id="delete-image" value="xóa">
                        </td>
                    </tr>
                    <tr>
                        <td><p class="motasp">Mô tả sản phẩm:</p></td>
                        <td>
                            <textarea class="ckeditor" name="decriptionproduct" id="ckeditor" cols="40"
                                      rows="20" datasrc="<%=product.getDescription()%>"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td><p class="info-kythuat">Thông số kỹ thuật</p></td>
                        <%
                            String[] detail = product.getDetail().split("-");
                            ArrayList<String> title = new ArrayList<>();
                            ArrayList<String> text = new ArrayList<>();
                            for (int iDetail = 0; iDetail < detail.length; iDetail++) {
                                if (iDetail == 0) {
                                    title.add(detail[iDetail]);
                                } else if (iDetail == 1) {
                                    text.add(detail[iDetail]);
                                } else if (iDetail % 2 == 0) {
                                    title.add(detail[iDetail]);
                                } else {
                                    text.add(detail[iDetail]);
                                }
                            }
                        %>
                        <td>
                            <input type="number" name="number-detail" id="number-detail" value="<%=detail.length/2%>"
                                   style="display: none">

                            <div class="row">
                                <div class="col-md-6">
                                    <p>Tiêu đề</p>
                                    <ol id="title-detail">
                                        <%
                                            for (int j = 0; j < title.size(); j++) {
                                        %>
                                        <li class="li-<%=j+1%>"><input type="text" name="input-title-<%=j+1%>"
                                                                       value="<%=title.get(j)%>"></li>
                                        <%
                                            }
                                        %>
                                    </ol>
                                </div>
                                <div class="col-md-6">
                                    <p>Thông số</p>
                                    <ul id="text-detail" style="list-style-type: none;">
                                        <%
                                            for (int j = 0; j < title.size(); j++) {
                                        %>
                                        <li class="li-<%=j+1%>"><input type="text" name="input-<%=j+1%>"
                                                                       value="<%=text.get(j)%>"></li>
                                        <%
                                            }
                                        %>
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
                            <%
                                String activeCheck = "";
                                String activeNoCheck = "";
                                if (product.getActive() == 1) {
                                    activeCheck = "checked";
                                } else {
                                    activeNoCheck = "checked";
                                }
                            %>
                            <input type="radio" name="show" value="1" <%=activeCheck%>>hiện
                            <input type="radio" name="show" value="0" <%=activeNoCheck%>>ẩn
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <div class="buttons-tac-vu">
                                <input id="submit-product" class="btn btn-info" type="submit" value="Lưu">
                            </div>
                        </td>
                    </tr>
                </table>
            </form>

        </div>
    </div>
</div>
<script type="text/javascript" src="<%=UtilsPath.getPathAdmin("lib/js/admin.js")%>"></script>
<script src="<%=UtilsPath.getPathAdmin("vendor/jquery.dataTables.min.js")%>"></script>
<script src="<%=UtilsPath.getPathAdmin("vendor/dataTables.bootstrap4.min.js")%>"></script>
<script>

    // CKEDITOR.instances.editor1.setData( '<p>This is the editor data.</p>' );
    //
    // CKEDITOR.instances.editor.setData( '<p>Some other editor data.</p>', function()
    // {
    //     this.checkDirty();  // true
    // });
    var f = CKEDITOR.replace("ckeditor");
    CKFinder.setupCKEditor(f, 'lib/ckfinder/');
</script>
</body>
</html>


