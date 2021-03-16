package vn.com.dutmobile.controller.Admin;

import vn.com.dutmobile.DAO.Implement.TypeProductDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/InsertType")
public class InsertType extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        String newNameType = request.getParameter("newnametype");
        String active = request.getParameter("active");
        int activeType;
        TypeProductDAOImpl typeProductImpl = new TypeProductDAOImpl();
        if (active.equalsIgnoreCase("yes")) {
            activeType = 1;
        } else {
            activeType = 0;
        }
        typeProductImpl.insertType(newNameType,activeType);
        response.sendRedirect(request.getContextPath() + "/Admin/ListProductType.jsp");
    }

}