package vn.com.dutmobile.controller.Client;

import vn.com.dutmobile.DAO.Implement.NewsDAOImpl;
import vn.com.dutmobile.model.NewsModel;
import vn.com.dutmobile.utils.UtilsPath;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/NewsSearchByTitle")
public class NewsSearchByTitle extends HttpServlet {
    NewsDAOImpl newsDAO = new NewsDAOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchByTitle = request.getParameter("searchByTitle");
        int pages = 1;
        if (request.getParameter("pages") != null) {
            pages = Integer.parseInt(request.getParameter("pages"));
        }

        int offset = 0;
        int limit = 0;

        int total = newsDAO.getCountNews();
        if (total <= 5) {
            offset = 0;
            limit = total;
        } else {
            offset = (pages - 1) * 5;
            limit = 5;
        }
        ArrayList<NewsModel> NewsSearchByTitle = newsDAO.findNews(searchByTitle, offset, limit);
        request.setAttribute("NewsSearchByTitle", NewsSearchByTitle);
        int loop = 0, num = 0;
        if ((total / 5) % 2 == 0) {
            num = total / 5;
        } else {
            num = (total + 1) / 5;
        }
        //Nếu total lẻ thêm 1
        if (total % 2 != 0) {
            loop = (total / 5) + 1;

        } else {
            //Nếu total chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
            if (total < (num * 5) + 5 && total != num * 5) {
                loop = (total / 5) + 1;
            } else {
                //Nếu bằng fullPage thì không thêm
                loop = (total / 5);
            }
        }
        String path = "";
        //Lap so pages
        for (int i = 1; i <= loop; i++) {
            if (pages == i) {
                path = "blog-tin-tuc.jsp?pages=" + i;
            }
        }

        request.getRequestDispatcher(path).forward(request, response);
    }
}
