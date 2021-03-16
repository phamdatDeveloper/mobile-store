package vn.com.dutmobile.controller.Client;

import vn.com.dutmobile.DAO.Implement.AccountDAOImpl;
import vn.com.dutmobile.model.AccountModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ResetPassFinalProcess")
public class ResetPassFinalProcess extends HttpServlet {
    AccountDAOImpl accountDAO = new AccountDAOImpl();
    AccountModel accountModel = new AccountModel();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String code = request.getParameter("code");
        String recode = request.getParameter("recode");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String message = "";

        if(!repassword.equals(password)) {
            message = "Mật khẩu xác nhận không trùng khớp";
        }
        if(password.equals("") || repassword.equals("")) {
            message = "Vui lòng nhập mật khẩu của bạn";
        }
        if(!recode.equals(code)) {
            message = "Mã code KHÔNG ĐÚNG !!! Vui lòng kiểm tra lại";
        }


        if(message.length() > 0) {
            request.setAttribute("message", message);
        }


        String path = "resetpassfinal.jsp";

        try {
            if(message.length() == 0) {
                accountModel.setPassword(password);
                accountModel.setEmail(email);
                accountDAO.resetPassword(accountModel);
                request.setAttribute("forgot_Pass", "success");
                request.getRequestDispatcher(path).forward(request, response);
            } else {
                request.getRequestDispatcher(path).forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
