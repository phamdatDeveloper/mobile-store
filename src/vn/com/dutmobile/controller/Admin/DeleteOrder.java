package vn.com.dutmobile.controller.Admin;

import vn.com.dutmobile.DAO.Implement.AdminOdersDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteOrder")
public class DeleteOrder extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        AdminOdersDAOImpl order = new AdminOdersDAOImpl();
        order.deleteOrder(id);
        request.getRequestDispatcher("Admin/ListOrder.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}