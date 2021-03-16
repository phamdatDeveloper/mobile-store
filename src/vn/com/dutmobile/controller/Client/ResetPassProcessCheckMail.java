package vn.com.dutmobile.controller.Client;


import vn.com.dutmobile.DAO.Implement.AccountDAOImpl;
import vn.com.dutmobile.model.AccountModel;
import vn.com.dutmobile.utils.UtilsSendMail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ResetPassProcessCheckMail")
public class ResetPassProcessCheckMail extends HttpServlet {
    AccountDAOImpl accountDAO = new AccountDAOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = "";
        String email = request.getParameter("email");
        if(accountDAO.checkEmailExist(email) == false || email.equals("")) {
            message = "Email bạn nhập không đúng hoặc Email này chưa được dùng để đăng kí ở website";
        }
        if(message.length() > 0) {
            request.setAttribute("message", message);
        }

        String code = accountDAO.codeKeyResetPass();
        request.setAttribute("code", code);

        request.setAttribute("email", email);

        String path = "resetpass.jsp";
        try {
            if(accountDAO.checkEmailExist(email) == true) {
                AccountModel accountModel = new AccountModel();
                accountModel.setEmail(email);
                UtilsSendMail.sendMail(accountModel.getEmail(), "DUT MOBILE STORE", "Xin chao " + accountModel.getEmail() +
                        " Vui long nhap ma sau: " + code + " de xac nhan lay lai mat khau");
                path = "resetpassfinal.jsp";
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
