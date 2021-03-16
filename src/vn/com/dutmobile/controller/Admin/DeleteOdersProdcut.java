package vn.com.dutmobile.controller.Admin;

import vn.com.dutmobile.DAO.Implement.ProductDAOimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteOdersProdcut")
public class DeleteOdersProdcut extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAOimpl productDAOimpl = new ProductDAOimpl();
        int id = Integer.parseInt(request.getParameter("id"));
        productDAOimpl.deleteOdersProduct(id);
//        request.setAttribute("getcart" , AdminOdersDAOImpl.deleteOrders(id) );
        response.sendRedirect("ListOdersAdmin");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}