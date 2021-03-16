package vn.com.dutmobile.controller.Client;

import vn.com.dutmobile.DAO.Implement.AccountDAOImpl;
import vn.com.dutmobile.model.AccountModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/MyOrders")
public class InformationUserController extends HttpServlet {
    AccountDAOImpl accountDAO = new AccountDAOImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        AccountModel acc = (AccountModel) session.getAttribute("account");

        request.setAttribute("odersUser", AccountDAOImpl.InsertMyOders(acc.getId()));

        request.getRequestDispatcher("orders-user.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}