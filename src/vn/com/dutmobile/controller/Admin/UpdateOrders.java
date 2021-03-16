package vn.com.dutmobile.controller.Admin;

import vn.com.dutmobile.DAO.Implement.ProductDAOimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateOrders")
public class UpdateOrders extends HttpServlet {
    ProductDAOimpl productDAOimpl = new ProductDAOimpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String done = request.getParameter("status");
        request.setAttribute("display", "display: none");
        productDAOimpl.updateOrders(id, done);
        request.getAttribute("getcart");
        response.sendRedirect("ListOdersAdmin");
//        request.getRequestDispatcher("ListOdersAdmin").forward(request,response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}