<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.ProductDAOimpl" %>
<%@ page import="vn.com.dutmobile.model.ProductModel" %>
<%@ page import="vn.com.dutmobile.model.Cart" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="lib/css/header.css">
</head>
<body>
<!--header-->
<!--<logo - login-reg>-->
<header>
    <div class="container">
        <nav id='cssmenu'>
            <div class="logo"><a href="<%=UtilsPath.getPath("HomeController")%>"><img src="images/logo.png" alt=""></a></div>
            <div id="head-mobile">
                <input id="search-head" type="search">
            </div>
            <div class="button" onclick="clickBtn(this)">
                <div class="bar1"></div>
                <div class="bar2"></div>
                <div class="bar3"></div>
            </div>
            <ul>
                <li class=''><a href='<%=UtilsPath.getPath("HomeController")%>'><i class="fas fa-home mr-1"></i>Trang
                    Chủ</a></li>
                <li><a href='About%20Us.jsp'>Giới Thiệu</a></li>
                <li><a href='<%=UtilsPath.getPath("ListProduct")%>'>Sản Phẩm</a>
                    <ul>
                        <%
                            ProductDAOimpl productDAOimpl = new ProductDAOimpl();
                            ArrayList<String> type = productDAOimpl.getTypeProduct();
                            String pageProductCaterogy = request.getParameter("page");
                            String addPage="";
                            if(pageProductCaterogy == null){
                                addPage = "&page=1";
                            }else{
                               addPage ="&page="+pageProductCaterogy;
                            }
                            for (int typeItem = 0; typeItem < type.size(); typeItem++) {
                        %>
                        <li>
                            <a href='<%=UtilsPath.getPath("productSeachByCategory?type="+type.get(typeItem))+addPage%>'><%=type.get(typeItem)%>
                            </a>
                            <ul>
                                <%
                                    ArrayList<ProductModel> listProduct = productDAOimpl.getProduct(type.get(typeItem),0,4);
                                    for (int i=0;i<listProduct.size();i++){
                                %>
                                <li><a href='<%=UtilsPath.getPath("Productdetail?id="+listProduct.get(i).getId())%>'><%=listProduct.get(i).getProductName()%></a></li>
                           <%
                               }
                           %>
                                <li><a href='<%=UtilsPath.getPath("productSeachByCategory?type="+type.get(typeItem))%>'>Xem
                                    thêm</a></li>
                            </ul>
                        </li>
                        <%
                            }
                        %>
                    </ul>

                </li>
                <li><a href='blog-tin-tuc.jsp'>Tin tức</a></li>
                <li><a href='ContactUs.jsp'>Liên hệ</a></li>

                <li class="btn-login"   ><a href="login.jsp" style="<%=session.getAttribute("nodisplay")%>"><span class="btn btn-info" >Đăng nhập</span></a></li>
                <li class="drop-down-item">
                    <%
                        if (session.getAttribute("account") != null) {
                    %>
                    <div class="btn btn-info dropdown button-intro-r"><i
                            class="fas fa-user-circle mr-1"></i><span
                            class="name_account">${account.username}</span>
                        <div class="dropdown-content">
                            <div class="navbar-login">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <img class="img-fluid" src="images/user-image-demo.png"
                                             alt="anh-cua-user">
                                    </div> <!--end col-lg-4-->
                                    <div class="col-lg-8">
                                        <p class="text-left"><strong>${account.fullname}</strong></p>
                                        <p class="text-left small">${account.email}</p>
                                        <p class="text-left">
                                            <a href="<%=UtilsPath.getPath("LoginController")%>" class="btn btn-primary btn-block btn-sm">Đăng
                                                xuất</a>
                                        </p>
                                    </div> <!--end col-lg-8-->
                                </div> <!--end row-->
                            </div> <!--end navbar-login-->
                            <div class="navbar-login navbar-login-session">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <p>
                                            <a href="user.jsp" class="btn btn-primary btn-block">Tài khoản của tôi</a>
                                            <a href="change-pw-user.jsp" class="btn btn-danger btn-block">Đổi mật khẩu</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div> <!--end dropdown-content-->
                    </div> <!--end dropdown-->
                    <%
                        }
                    %>

                    <%--account admin--%>

                    <%
                        if (session.getAttribute("accountAdmin") != null) {
                    %>
                    <div class="btn btn-info dropdown button-intro-r"><i
                            class="fas fa-user-circle mr-1"></i><span
                            class="name_account">${accountAdmin.username}</span>
                        <div class="dropdown-content">
                            <div class="navbar-login">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <img class="img-fluid" src="images/user-image-demo.png"
                                             alt="anh-cua-user">
                                    </div> <!--end col-lg-4-->
                                    <div class="col-lg-8">
                                        <p class="text-left"><strong>Admin ${accountAdmin.fullname}</strong></p>
                                        <p class="text-left small">${accountAdmin.email}</p>
                                        <p class="text-left">
                                            <a href="<%=UtilsPath.getPath("LoginController")%>" class="btn btn-danger btn-block btn-sm">Đăng
                                                xuất</a>
                                        </p>
                                    </div> <!--end col-lg-8-->
                                </div> <!--end row-->
                            </div> <!--end navbar-login-->
                            <div class="navbar-login navbar-login-session">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <p>
                                            <a href="http://localhost:8080/ProjectWeb_1920/Admin?id=0&page=page1"
                                               class="btn btn-primary btn-block">Về trang admin</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div> <!--end dropdown-content-->
                    </div> <!--end dropdown-->
                    <%
                        }
                    %>

                </li>
                <li class="cart-display" style="display: inline-flex"><a
                        href="http://localhost:8080/ProjectWeb_1920/Cart" class="cart-icon-link"
                        style=""><i class="fas fa-shopping-cart"></i></a>
                    <% Cart cart = (Cart) session.getAttribute("Cart");
                        int count = cart == null ? 0 : cart.list().size();
                    %>
                    <a href="#" style="padding: 0px;float: right"><span style="position: absolute;right: 7px;"><%=count%></span></a>
                </li>
                <li class="search-bar">
                    <form class="form-timkiem" action="<%=UtilsPath.getPath("SearchByName")%>">
                        <input id="search-input" name="search" type="search">
                    </form>
                </li>
            </ul>
        </nav>
    </div>
</header>
<!--Hết header-->
<script type="text/javascript">
    (function ($) {
        $.fn.menumaker = function (options) {
            var cssmenu = $(this), settings = $.extend({
                format: "dropdown",
                sticky: false
            }, options);
            return this.each(function () {
                $(this).find(".button").on('click', function () {
                    $(this).toggleClass('menu-opened');
                    var mainmenu = $(this).next('ul');
                    if (mainmenu.hasClass('open')) {
                        mainmenu.slideToggle().removeClass('open');
                    } else {
                        mainmenu.slideToggle().addClass('open');
                        if (settings.format === "dropdown") {
                            mainmenu.find('ul').show();
                        }
                    }
                });
                cssmenu.find('li ul').parent().addClass('has-sub');
                multiTg = function () {
                    cssmenu.find(".has-sub").prepend('<span class="submenu-button"></span>');
                    cssmenu.find('.submenu-button').on('click', function () {
                        $(this).toggleClass('submenu-opened');
                        if ($(this).siblings('ul').hasClass('open')) {
                            $(this).siblings('ul').removeClass('open').slideToggle();
                        } else {
                            $(this).siblings('ul').addClass('open').slideToggle();
                        }
                    });
                };
                if (settings.format === 'multitoggle') multiTg();
                else cssmenu.addClass('dropdown');
                if (settings.sticky === true) cssmenu.css('position', 'fixed');
                resizeFix = function () {
                    var mediasize = 1000;
                    if ($(window).width() > mediasize) {
                        cssmenu.find('ul').show();
                    }
                    if ($(window).width() <= mediasize) {
                        cssmenu.find('ul').hide().removeClass('open');
                    }
                };
                resizeFix();
                return $(window).on('resize', resizeFix);
            });
        };
    })(jQuery);

    (function ($) {
        $(document).ready(function () {
            $("#cssmenu").menumaker({
                format: "multitoggle"
            });
        });
    })(jQuery);

    function clickBtn(x) {
        x.classList.toggle("change");
    }
</script>
</body>
</html>