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

@WebServlet("/AdminInsertDeleteNews")
public class AdminInsertDeleteNews extends HttpServlet {
    DateConverter dateConverter = new DateConverter();
    NewsDAOImpl newsDAO = new NewsDAOImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        Integer id = Integer.parseInt(request.getParameter("id"));

        try {
            switch (action) {
                case "Delete":
                    newsDAO.deleteNews(id);
                    request.getRequestDispatcher("Admin/ListNews.jsp").forward(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        String title = request.getParameter("title");
        String type = request.getParameter("type");
        String description = request.getParameter("description");
        String content = request.getParameter("content");
        String img = request.getParameter("img");
        String author = request.getParameter("author");
        Date timerelease = dateConverter.convertStringToDate(request.getParameter("timerelease"));
        Integer popular = Integer.parseInt(request.getParameter("popular"));
        Integer active = Integer.parseInt(request.getParameter("active"));

        try {
            switch (action) {
                case "Insert":
                    NewsModel newsModel = new NewsModel();
                    newsModel.setTitle(title);
                    newsModel.setType(type);
                    newsModel.setDescription(description);
                    newsModel.setContent(content);
                    newsModel.setImg(img);
                    newsModel.setAuthor(author);
                    newsModel.setTimerelease(timerelease);
                    newsModel.setPopular(popular);
                    newsModel.setActive(active);
                    newsDAO.insertNews(newsModel);
                    request.getRequestDispatcher("Admin/ListNews.jsp").forward(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
