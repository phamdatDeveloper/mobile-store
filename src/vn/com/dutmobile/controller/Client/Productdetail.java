package vn.com.dutmobile.controller.Client;

import vn.com.dutmobile.DAO.Implement.CommentDAOImpl;
import vn.com.dutmobile.DAO.Implement.ProductDAOimpl;
import vn.com.dutmobile.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.sql.Result;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet("/Productdetail")
public class Productdetail extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        CommentDAOImpl commentDAOImpl = new CommentDAOImpl();
        ProductDAOimpl productDAOimpl = new ProductDAOimpl();
        ProductModel product = new ProductModel();
        product = productDAOimpl.getProductById(Integer.parseInt(id));
        request.setAttribute("productdetail",product);
        ArrayList<ProductModel> listProductSameType = productDAOimpl.getProduct(product.getType(),0,20);
        request.setAttribute("ListProductSameType",listProductSameType);
        ResultSet rs = commentDAOImpl.getCommentProduct(id);
        request.setAttribute("comment",rs);
        request.getRequestDispatcher("productdetails.jsp").forward(request,response);
        System.out.println(product.getDetail());
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}