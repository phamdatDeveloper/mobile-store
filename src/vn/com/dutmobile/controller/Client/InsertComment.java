package vn.com.dutmobile.controller.Client;

import vn.com.dutmobile.DAO.Implement.CommentDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/InsertComment")
public class InsertComment extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("nameuser");
        String email = request.getParameter("emailuser");
        String comment = request.getParameter("commentuser");
        String id = request.getParameter("id");
        CommentDAOImpl commentDAOImpl = new CommentDAOImpl();
        commentDAOImpl.insertComment(Integer.parseInt(id),name,email,comment);
        String path = "/Productdetail?id=" + id;
        response.sendRedirect("http://localhost:8080/ProjectWeb_1920"+  path);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}