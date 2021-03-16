package vn.com.dutmobile.controller.Admin;

import vn.com.dutmobile.DAO.Implement.ProductDAOimpl;
import vn.com.dutmobile.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProductDAOimpl productDAOimpl = new ProductDAOimpl();
        productDAOimpl.deleteProduct(id);
        request.getRequestDispatcher("Admin/ListProductAdmin.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}