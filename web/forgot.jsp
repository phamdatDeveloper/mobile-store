<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quên mật khẩu</title>
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
    <link rel="stylesheet" href="lib/css/styleForGot.css">
</head>
<body>
<!--header-->
<!--<logo - login-reg>-->
<jsp:include page="header.jsp"></jsp:include>
<!--Hết header-->

<div class="container" style="background-image: url('images/12.jpg') ; width: 100%;">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="text-center">
                        <h3><i class="fa fa-lock fa-4x"></i></h3>
                        <h2 class="text-center">Quên mật khẩu?</h2>
                        <p>Bạn có thể thiết lập lại mật khẩu của bạn ở đây..</p>
                        <div class="panel-body">

                            <form id="register-form" role="form" autocomplete="off" class="form" method="post"
                                  style="width: 500px; margin-left: -93px">
                                <div class="User userES">
                                    <label for="email1">Nhập email</label>
                                    <input type="email" id="email1" name="email"
                                           placeholder="Nhập Email  " class="Input-sc-1sflv1m-0 coLFjn"
                                           value="">
                                </div>

                                <div class="form-group">
                                    <input  name="recover-submit" class="btnn btn-lg btn-primary btn-block" value="Submit"
                                           type="submit">
                                </div>

                                <input  type="hidden" class="hide" name="token" id="token" value="">
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
<!--Hết footer-->
<script type="text/javascript" src="lib/js/1.js"></script>
</body>
</html>