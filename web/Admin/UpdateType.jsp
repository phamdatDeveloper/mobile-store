
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.ProductDAOimpl" %>
<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page import="vn.com.dutmobile.model.ProductModel" %>
<%@ page import="vn.com.dutmobile.model.TypeProductModel" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.TypeProductDAOImpl" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
    <title>Sửa phân loại</title>
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
            <form action="http://localhost:8080/ProjectWeb_1920/UpdateType?id=<%=request.getParameter("id")%>"
                  method="post">
<%
    TypeProductDAOImpl typeProductDAOImpl = new TypeProductDAOImpl();
    TypeProductModel type = typeProductDAOImpl.getTypeById(Integer.parseInt(request.getParameter("id")));
%>
                <table class="table ">
                 <tr>
                     <td>Tên phân loại</td>
                     <td><input name="newnametype" type="text" value="<%=type.getType()%>" >
                         <input name="oldnametype" type="text" value="<%=type.getType()%>" hidden ></td>
                 </tr>
                    <tr>
                        <td>Hiển thị</td>
                        <td>
                            <%
                                String check = "";
                                String nocheck ="";
                                if(type.getActive() == 1){
                                    check ="checked";
                                }else{
                                    nocheck ="checked";
                                }
                            %>
                            <input type="radio" name="active" value="yes" <%=check%>> có
                            <input type="radio" name="active" value="no" <%=nocheck%>> không
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input class="btn btn-info" type="submit" value="Lưu">
                            <a href="http://localhost:8080/ProjectWeb_1920/Admin/ListProductType.jsp"><button class="btn-info btn">Hủy</button></a>
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
</script>
</body>
</html>


