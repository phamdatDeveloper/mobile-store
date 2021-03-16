<%@ page import="vn.com.dutmobile.utils.UtilsPath" %>
<%@ page import="vn.com.dutmobile.model.AccountModel" %>
<%@ page import="vn.com.dutmobile.DAO.Implement.AccountDAOImpl" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="col-sm-12">
    <%
        AccountModel account = (AccountModel) session.getAttribute("accountAdmin");
    %>
    <div id="admin-bar">Xin chào <%=account.getFullname()%>
    </div>

</div>
<div class="col-md-3 menu">
    <div id="accordion">
        <h3 style="text-transform: uppercase"><i class="fas fa-home pr-1"></i>Trang chủ Admin</h3>
        <div class="padding5">
            <a href="<%=UtilsPath.getPath("LoginController")%>">
                <button class="tablinks button-bar " type="submit"><i class="fas fa-sign-out-alt"></i> Đăng xuất
                </button>
            </a>
            <a href="<%=UtilsPath.getPath("HomeController")%>">
                <button class="tablinks button-bar " type="submit"><i class="fas fa-reply"></i>
                    Về trang chủ
                </button>
            </a>
        </div>
        <h3 style="text-transform: uppercase"><i class="fab fa-product-hunt pr-1"></i>Quản lý sản phẩm</h3>
        <div class="padding5">
            <a href="http://localhost:8080/ProjectWeb_1920/Admin/ListProductAdmin.jsp">
                <button class="tablinks button-bar" onclick="openCity(event, 'product_manager_info')"><i
                        class="fas fa-list"></i> Danh sách sản phẩm
                </button>
            </a>
            <a href="http://localhost:8080/ProjectWeb_1920/Admin/InsertProduct.jsp">
                <button class="tablinks button-bar" onclick="openCity(event, 'product_manager_edit')"><i
                        class="fas fa-plus"></i> Thêm sản phẩm
                </button>
            </a>
        </div>
        <h3 style="text-transform: uppercase"><i class="fab fa-product-hunt pr-1"></i>Quản lý phân loại</h3>
        <div class="padding5">
            <a href="http://localhost:8080/ProjectWeb_1920/Admin/ListProductType.jsp">
                <button class="tablinks button-bar" onclick="openCity(event, 'product_manager_info')"><i
                        class="fas fa-list"></i> Danh sách phân loại
                </button>
            </a>
            <a href="http://localhost:8080/ProjectWeb_1920/Admin/InsertType.jsp">
                <button class="tablinks button-bar" onclick="openCity(event, 'product_manager_edit')"><i
                        class="fas fa-plus"></i> Thêm phân loại
                </button>
            </a>
        </div>
        <h3 style="text-transform: uppercase"><i class="fas fa-scroll pr-1"></i>Quản lý đơn hàng</h3>
        <div class="padding5">
            <a href="<%=UtilsPath.getPath("ListOdersAdmin")%>">
                <button class="tablinks button-bar" onclick="openCity(event,'order_manager_info')"><i
                        class="fas fa-list"></i> Danh sách đơn hàng
                </button>
            </a>
            <a href="<%=UtilsPath.getPath("/Admin/UpdateOrders.jsp")%>">
                <button style="display: none" class="tablinks button-bar" onclick="openCity(event,'user_manager_edit')"><i
                        class="fas fa-edit"></i> Chỉnh sửa  thông tin đơn hàng
                </button>
            </a>
        </div>
        <h3 style="text-transform: uppercase"><i class="fas fa-users pr-1"></i>Quản lý khách hàng</h3>
        <div class="padding5">
            <a href="<%=UtilsPath.getPath("/Admin/ListAccount.jsp")%>">
                <button class="tablinks button-bar" onclick="openCity(event,'user_manager_info')"><i
                        class="fas fa-list"></i> Danh sách khách hàng
                </button>
            </a>
            <a href="<%=UtilsPath.getPath("/Admin/InsertAccount.jsp")%>">
                <button class="tablinks button-bar" onclick="openCity(event,'user_manager_add')"><i
                        class="fas fa-edit"></i> Thêm mới khách hàng
                </button>
            </a>
        </div>
        <h3 style="text-transform: uppercase"><i class="fas fa-clipboard pr-1"></i>Quản lý bài viết</h3>
        <div class="padding5">
            <a href="<%=UtilsPath.getPath("Admin/ListNews.jsp")%>">
                <button class="tablinks button-bar" onclick="openCity(event,'news_manager_info')"><i
                        class="fas fa-list"></i> Danh sách bài viết
                </button>
            </a>
            <a href="<%=UtilsPath.getPath("/Admin/InsertNews.jsp")%>">
                <button class="tablinks button-bar" onclick="openCity(event,'news_manager_edit')"><i
                        class="fas fa-plus"></i> Thêm bài viết
                </button>
            </a>
        </div>
    </div>
</div>
<!--end col 3-->
