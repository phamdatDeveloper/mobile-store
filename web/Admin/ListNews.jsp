<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page import="vn.com.dutmobile.model.AccountModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.com.dutmobile.DAO.AccountDAO" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.AccountDAOImpl" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.NewsDAOImpl" %>
<%@ page import="vn.com.dutmobile.model.NewsModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
    <title>Danh sách tài khoản</title>

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

<div class="">
    <div class="row section_content">
        <jsp:include page="SlideBar.jsp"></jsp:include>
        <div class="col-md-9" style="overflow: auto;">
            <div id="user_manager_info" class="">
                <div class="row col-md-12">
                    <p class="col-md-9 title-info">Thông Tin Bài Viết</p>
                    <div class="col-md-3">
                        <a href="<%=UtilsPath.getPath("Admin/InsertNews.jsp")%>">
                            <button class="btn"
                                    style="margin-top: 10px;outline: none !important; background-color: #007bff; color: white;">
                                Thêm Bài Viết
                            </button>
                        </a>
                    </div>
                </div>
                <hr>
                <table id="table-info" class="table table-striped table-bordered " style="width:100%;">
                    <thead>
                    <tr class="header-table">
                        <td class="set">ID</td>
                        <td class="set">TITLE</td>
                        <td class="set">TYPE</td>
                        <td class="set">HÌNH ẢNH ĐẠI DIỆN</td>
                        <td class="set">NỔI BẬT</td>
                        <td class="set">HIỂN THỊ</td>
                        <td class="set">TÁC VỤ</td>
                    </tr> <!--end header-table-->
                    </thead>
                    <tbody>
                    <%
                        NewsDAOImpl newsDAO = new NewsDAOImpl();
                        ArrayList<NewsModel> listNews = newsDAO.getNews();
                        for (NewsModel news : listNews) {
                    %>
                    <tr>
                        <td><%=news.getId()%>
                        </td>
                        <td><%=news.getTitle()%>
                        </td>
                        <td><%=news.getType()%>
                        </td>
                        <td><img src="<%=news.getImg()%>" style="width: 70px; height: 60px;" alt="">
                        </td>
                        <%
                            String srcImg = "";
                            if (news.getPopular() == 1) {
                                srcImg = "images/yes.png";
                            } else {
                                srcImg = "images/no.png";
                            }
                        %>
                        <td>
                            <%--<%=news.getPopular()%>--%>
                            <img src="<%=UtilsPath.getPath(srcImg)%>" alt="" style="width:30px;height:30px;">
                        </td>
                        <%
                            String activeImg = "";
                            if (news.getActive() == 1) {
                                activeImg = "images/yes.png";
                            } else {
                                activeImg = "images/no.png";
                            }
                        %>
                        <td>
                            <img src="<%=UtilsPath.getPath(activeImg)%>" alt="" style="width:30px;height:30px;">
                            <%--<%=news.getActive()%>--%>
                        </td>
                        <td>
                            <p data-placement="top" data-toggle="tooltip" title="Chỉnh sửa">
                                <a href="<%=UtilsPath.getPath("Admin/UpdateNews.jsp?action=Update&id="+news.getId())%>"><i
                                        class="fas fa-edit" style="cursor: pointer"></i>
                                </a>
                            </p>
                            <p data-placement="top" data-toggle="tooltip" title="Xóa">
                                <a href="<%=UtilsPath.getPath("AdminInsertDeleteNews?action=Delete&id="+news.getId())%>"
                                   onclick="return confirm('Bạn chắc chắn chứ ?')"><i
                                        class="fas fa-trash" style="cursor: pointer"></i></a>
                            </p>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                    <tfoot>

                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=UtilsPath.getPathAdmin("lib/js/admin.js")%>"></script>
<script src="<%=UtilsPath.getPathAdmin("vendor/jquery.dataTables.min.js")%>"></script>
<script src="<%=UtilsPath.getPathAdmin("vendor/dataTables.bootstrap4.min.js")%>"></script>
<script>
    $(document).ready(function () {
        $('#table-info').DataTable();
    });
</script>
</body>
</html>
