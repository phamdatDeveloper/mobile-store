<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.ProductDAOimpl" %>
<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page import="vn.com.dutmobile.model.ProductModel" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.NewsDAOImpl" %>
<%@ page import="vn.com.dutmobile.model.NewsModel" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
    <title>Sửa bài viết</title>
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
            <form action="http://localhost:8080/ProjectWeb_1920/AdminUpdateNews?id=<%=request.getParameter("id")%>"
                  method="post">
                <%
                    NewsDAOImpl newsDAO = new NewsDAOImpl();
                    NewsModel newsModel = new NewsModel();
                    request.setCharacterEncoding("UTF-8");
                    response.setCharacterEncoding("UTF-8");
                %>
                <table class="table ">
                    <tr>
                        <td><p class="tensp">Tiêu đề bài viết:</p></td>
                        <%
                            if(request.getParameter("id") != null) {
                                newsModel = newsDAO.getNewsById(Integer.parseInt(request.getParameter("id")));
                            }
                        %>
                        <td>
                            <input type="text" name="title" class="" value="<%=newsModel.getTitle()%>"
                                   required>
                        </td>
                    </tr>
                    <tr>
                        <td><p class="hsxsp">Loại bài bài:</p></td>
                        <td>
                            <select name="type" id="type">
                                <option value="no">Chọn</option>
                                <option value="Tin tức">Tin tức</option>
                                <option value="Khuyến mãi">Khuyến mãi</option>
                                <option value="Thủ thuật">Thủ thuật</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><p class="loaisp">Nội dung khái quát:</p></td>
                        <td>
                            <input type="text" name="description" class=""
                                   value="<%=newsModel.getDescription()%>"></td>
                    </tr>
                    <tr>
                        <td><p class="imgsp">Hình ảnh:</p></td>
                        <td>
                            <div class="form-group">
                                <input id="input-image-home" name="img" type="text" size="60"
                                       value="<%=newsModel.getImg()%>"/>
                                <input type="button" value="Chọn ảnh"
                                       onclick="BrowseServer( '', 'input-image-home' );"/>
                            </div>
                        </td>
                    </tr>
                    <td><p>Tên tác giả:</p></td>
                    <td>
                        <input type="text" name="author" placeholder="Nhập tên tác giả" class=""
                               value="<%=newsModel.getAuthor()%>">
                    </td>
                    <tr>
                        <td><p>Ngày đăng:</p></td>
                        <td><input type="date" name="timerelease" placeholder="YYYY-MM-DD" required="required"
                                   style=""></td>
                    </tr>
                    <tr>
                        <td><p class="motasp">Nội dung bài viết:</p></td>
                        <td>
                            <textarea class="ckeditor" name="content" id="ckeditor" cols="40"
                                      rows="20" datasrc="<%=newsModel.getContent()%>"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td><p>Phổ biến:</p></td>
                        <td><label style="cursor: pointer; margin-right: 50px" value="1">
                            <input name="popular" type="radio" value="1">
                            <p style="">Có</p>
                        </label>
                            <label style="cursor: pointer;" value="0">
                                <input name="popular" type="radio" value="0">
                                <p style="">Không</p>
                            </label></td>
                    </tr>
                    <tr>
                        <td><p>Active:</p></td>
                        <td><label style="cursor: pointer; margin-right: 50px" value="1">
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
                            <div class="buttons-tac-vu">
                                <input type="hidden" name="action" value="Update">
                                <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
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
    var f = CKEDITOR.replace("ckeditor");
    CKFinder.setupCKEditor(f, 'lib/ckfinder/');
</script>
</body>
</html>


