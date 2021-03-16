<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang Liên Hệ</title>
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
    <link rel="stylesheet" href="http://localhost:8080/ProjectWeb_1920/lib/css/contactStyle.css">
    <link rel="stylesheet" href="http://localhost:8080/ProjectWeb_1920/lib/js/1.js">


</head>
<body>
    <%
    String name_ping = "";
    String email_ping = "";
    String topic_ping = "";
    String question_ping = "";

    if(request.getAttribute("name_ping") != null) {
        name_ping = (String) request.getAttribute("name_ping");
    }
    if(request.getAttribute("email_ping") != null) {
        email_ping = (String) request.getAttribute("email_ping");
    }
    if(request.getAttribute("topic_ping") != null) {
        topic_ping = (String) request.getAttribute("topic_ping");
    }
    if(request.getAttribute("question_ping") != null) {
        question_ping = (String) request.getAttribute("question_ping");
    }

    String message = "";
    if(request.getAttribute("message") != null) {
        message = (String) request.getAttribute("message");
    }
%>

<!--header-->
<!--<logo - login-reg>-->
<jsp:include page="header.jsp"></jsp:include>
<!--Hết header-->

<div class="contact1" id="contact" style="padding-top: 100px; margin-top: 0px">
    <div class="container-contact1">
        <div class="contact1-pic js-tilt" data-tilt>
            <img src="images/email_ss.png">
        </div>

        <form id="contactform" class="contact1-form validate-form" action="ContactController" method="POST">
				<span class="contact1-form-title">
					Chúng tôi sẽ trả lời mọi thắc mắc của bạn <br> Mời bạn nhập thông tin vào form
				</span>
            <span class="success-send"><%=message%></span>
            <div class="wrap-input1 validate-input">
                <span class="ping-value"><%=name_ping%></span>
                <input class="input1" type="text" name="name" id="name" placeholder="Tên">

            </div>

            <div class="wrap-input1 validate-input">
                <span class="ping-value"><%=email_ping%></span>
                <input class="input1" type="text" name="email" placeholder="xxx@xmail.com"
                       pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 4}$">
            </div>

            <div class="wrap-input1 validate-input">
                <span class="ping-value"><%=topic_ping%></span>
                <input class="input1" type="text" name="topic" placeholder="Chủ đề">
            </div>

            <div class="wrap-input1 validate-input">
                <span class="ping-value"><%=question_ping%></span>
                <textarea class="input1" name="question" placeholder="Nội dung"></textarea>
            </div>

            <div class="container-contact1-form-btn">
                <button type="submit" class="contact1-form-btn">Gửi</button>
            </div>
        </form>
    </div>
</div>

<!--//login-->

<jsp:include page="button-scroll-top.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>
<!--Hết footer-->


</body>
</html>