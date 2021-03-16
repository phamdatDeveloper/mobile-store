package vn.com.dutmobile.controller.Admin;

import vn.com.dutmobile.DAO.Implement.AdminOdersDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet("/ListOdersAdmin")
public class ListOdersAdmin extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        ResultSet rs = AdminOdersDAOImpl.getCart();
        request.setAttribute("getcart" , AdminOdersDAOImpl.getCart() );

        request.getRequestDispatcher("Admin/ListOrder.jsp").forward(request,response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}