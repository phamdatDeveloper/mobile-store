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

@WebServlet("/UpdatePasswordUser")
public class UpdatePasswordUser extends HttpServlet {
    AccountDAOImpl accountDAO = new AccountDAOImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String passOld = request.getParameter("passwordOld");
        String passNew = request.getParameter("passwordNew");
        String password = request.getParameter("password");

        String pass = "";
        String password_ping = "Password không được ít hơn 6 kí tự";
        String text_false = "Mật khẩu nhập không đúng";
        String text_pass = "Mật khẩu của bạn không đúng";

        AccountModel acc = (AccountModel) session.getAttribute("account");
        AccountModel accountModel = new AccountModel(password);
        pass = acc.getPassword();


        if (!pass.equals(passOld)) {
            request.setAttribute("text_pass", text_pass);
        } else if (pass.equals(passOld)) {
            if (!passNew.equals(password)) {
                request.setAttribute("text_false", text_false);
            } else if (passNew.length() < 6) {
                request.setAttribute("password_ping", password_ping);
            } else if (passNew.equals(password)) {
                accountDAO.updatePassword(accountModel, acc.getId());
                request.setAttribute("pass_success", "gui thanh cong");
            }

        }


        request.getRequestDispatcher("change-pw-user.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }



}