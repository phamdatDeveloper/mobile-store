package vn.com.dutmobile.controller.Client;

import vn.com.dutmobile.DAO.Implement.AccountDAOImpl;
import vn.com.dutmobile.converter.DateConverter;
import vn.com.dutmobile.model.AccountModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
    AccountDAOImpl accountDAO = new AccountDAOImpl();
    DateConverter dateConverter = new DateConverter();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
//
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
//
        String fullname = request.getParameter("hoten");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        Date dob = dateConverter.convertStringToDate(request.getParameter("dob"));
////        String password = request.getParameter("password");
////        String repassword = request.getParameter("repassword");
////        String active = request.getParameter("active");
//
        request.setAttribute("fullname", fullname);
        request.setAttribute("email", email);
        request.setAttribute("sdt", sdt);
        request.setAttribute("gender", gender);
        request.setAttribute("address", address);
        request.setAttribute("dob", dob);
////        request.setAttribute("password", password);
////        request.setAttribute("repassword", repassword);
////        request.setAttribute("active", active);
//
        AccountModel acc = (AccountModel) session.getAttribute("account");
        AccountModel accountModel = new AccountModel(fullname, sdt, email, address, gender,dob);
        accountDAO.updateUser(accountModel, acc.getId());
////      request.setAttribute("UpdatUser",accountDAO.updateUser(accountModel,acc.getId()));
        request.setAttribute("user_success", "gui thanh cong");
        request.getRequestDispatcher("user.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}