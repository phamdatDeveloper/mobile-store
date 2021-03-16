package vn.com.dutmobile.controller.Client;

import vn.com.dutmobile.DAO.Implement.ProductDAOimpl;
import vn.com.dutmobile.model.Cart;
import vn.com.dutmobile.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AddCart")
public class AddCart extends HttpServlet {
    ProductDAOimpl productDAO = new ProductDAOimpl();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String path = request.getParameter("path");
        String type = request.getParameter("type");
        String page = request.getParameter("page");
        String search = request.getParameter("search");
        int iddetails = Integer.parseInt(request.getParameter("id"));
        System.out.println(page);
        System.out.println(type);

        if(path.equals("/product.jsp")){
            path="/ListProduct" +"?page="+page ;
        }else if(path.equals("/trang-chu.jsp")){
            path="/HomeController";
        }else  if(path.equals("/ProductSearchByCategory.jsp")){
            path="/productSeachByCategory?type="+type+"&page="+page;
        }else if(path.equals("/productdetails.jsp")) {
            path = "/Productdetail?id=" + iddetails ;
        }else if(path.equals("/ProductSearchByName.jsp")){
            path = "/SearchByName?search="+search +"&page=" + page;
        }

        try {
            HttpSession session = request.getSession();
            int id = Integer.parseInt(request.getParameter("id"));
            ProductModel product = productDAO.find(id);
            vn.com.dutmobile.model.Cart cart = (vn.com.dutmobile.model.Cart) session.getAttribute("Cart");
            if(cart == null) cart = new Cart();
            if(cart !=null) cart.put(product);
            session.setAttribute("Cart", cart);
        } catch (NumberFormatException e) {

        }
        response.sendRedirect("http://localhost:8080/ProjectWeb_1920"+  path);


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}