package vn.com.dutmobile.controller;

import vn.com.dutmobile.DAO.Implement.AccountDAOImpl;
import vn.com.dutmobile.model.AccountModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
    AccountDAOImpl accountDAO = new AccountDAOImpl();

    protected void requestProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String uname = request.getParameter("uname");
        String pass = request.getParameter("pass");

        String err = "";
        if (uname == "" || pass == "") {
            err = "Chưa nhập tài khoản hoặc mật khẩu";
        } else {
            if(accountDAO.checkAccount(uname, pass) == false) {
                err = "Sai tên tài khoản hoặc mật khẩu";
            }
        }
        if (err.length() > 0) {
            request.setAttribute("err", err);
        }

        request.setAttribute("uname", uname);
        request.setAttribute("pass", pass);

        String path = "/login.jsp";
        AccountModel account = new AccountModel();
        account = accountDAO.checkLogin(uname, pass);
        AccountModel accountAdmin = new AccountModel();
        accountAdmin = accountDAO.checkLogin(uname, pass);
        try {
            if(account == null && err.length() > 0) {
                request.getRequestDispatcher("login.jsp").forward(request,response);
//                RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
//                rd.forward(request, response);
//                response.sendRedirect(request.getContextPath() + "/login.jsp");
            }
            if (account != null && account.getType().equals("user")) {
                HttpSession session = request.getSession();
                session.setAttribute("account", account);
                session.setAttribute("nodisplay","display:none;");
                response.sendRedirect(request.getContextPath() +"/HomeController");
            } else if (accountAdmin != null && accountAdmin.getType().equals("admin")) {
                HttpSession session = request.getSession();
                session.setAttribute("accountAdmin", accountAdmin);
                session.setAttribute("nodisplay","display:none;");
                response.sendRedirect(request.getContextPath()+"/Admin");
//                response.sendRedirect(request.getContextPath() +"/Admin?id=0&page=page1");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("account");
            session.removeAttribute("accountAdmin");
            session.removeAttribute("Cart");
            session.setAttribute("nodisplay","display:block;");
            response.sendRedirect(request.getContextPath() +"/HomeController");
//            RequestDispatcher rd = request.getRequestDispatcher("trang-chu.jsp");
//            rd.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        requestProcess(request, response);
    }
}
