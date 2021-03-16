package vn.com.dutmobile.controller.Admin;

import vn.com.dutmobile.DAO.Implement.TypeProductDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteType")
public class DeleteType extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        TypeProductDAOImpl typeProductDAOImpl = new TypeProductDAOImpl();
        typeProductDAOImpl.deleteType(id);
        response.sendRedirect(request.getContextPath() + "/Admin/ListProductType.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}