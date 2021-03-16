package vn.com.dutmobile.controller.Admin;

import vn.com.dutmobile.DAO.Implement.NewsDAOImpl;
import vn.com.dutmobile.converter.DateConverter;
import vn.com.dutmobile.model.NewsModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/AdminUpdateNews")
public class AdminUpdateNews extends HttpServlet {
    DateConverter dateConverter = new DateConverter();
    private static NewsDAOImpl newsDAO = new NewsDAOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String path = "";
        Integer id = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");
        String title = request.getParameter("title");
        String type = request.getParameter("type");
        String description = request.getParameter("description");
        String content = request.getParameter("content");
        String img = request.getParameter("img");
        String video = request.getParameter("video");
        String author = request.getParameter("author");
        Date timerelease = dateConverter.convertStringToDate(request.getParameter("timerelease"));
        Integer popular = Integer.parseInt(request.getParameter("popular"));
        Integer active = Integer.parseInt(request.getParameter("active"));


        try {
            switch (action) {
                case "Update":
                    NewsModel newsModel = new NewsModel(id, title, type, description, content, img, author, timerelease, popular, active);
                    newsDAO.updateNews(newsModel);
                    request.getRequestDispatcher("Admin/ListNews.jsp").forward(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
