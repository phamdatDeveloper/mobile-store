package vn.com.dutmobile.controller.Client;

import vn.com.dutmobile.DAO.Implement.NewsDAOImpl;
import vn.com.dutmobile.model.NewsModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/NewsDetailsController")
public class NewsDetailsController extends HttpServlet {
    NewsDAOImpl newsDAO = new NewsDAOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Integer id = Integer.parseInt(request.getParameter("id"));
        NewsModel newsDetails = newsDAO.getDetails(id);
        request.setAttribute("newsDetails", newsDetails);
        request.getRequestDispatcher("post.jsp").forward(request, response);
    }
}
