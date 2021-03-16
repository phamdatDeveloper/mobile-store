<%@ page import="vn.com.dutmobile.utils.UtilsPath" %><%--
  Created by IntelliJ IDEA.
  User: PhamDat_PC
  Date: 12/18/2019
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script src="<%=UtilsPath.getPathAdmin("lib/ckeditor/ckeditor.js")%>"></script>
    <script src="<%=UtilsPath.getPathAdmin("lib/ckfinder/ckfinder.js")%>"></script>

</head>
<body>
<textarea name=""  id="ckeditor" cols="30" rows="10"></textarea>
<input type="text" id="1" value="1">
<input type="button" onclick="selectFileWithCKFinder('1')" value="chọn">


<input id="xImagePath" name="abc" type="text" size="60" />
<input type="button" value="Browse Server" onclick="BrowseServer( 'Files:/', 'xImagePath' );" />
<script type="text/javascript" src="<%=UtilsPath.getPathAdmin("lib/js/admin.js")%>"></script>
<script !src="">
    var f = CKEDITOR.replace("ckeditor");
    CKFinder.setupCKEditor(f,'lib/ckfinder/');

</script>
</body>
</html>
