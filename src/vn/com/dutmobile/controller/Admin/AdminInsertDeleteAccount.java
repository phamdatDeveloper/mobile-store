package vn.com.dutmobile.controller.Admin;

import vn.com.dutmobile.DAO.Implement.AccountDAOImpl;
import vn.com.dutmobile.converter.DateConverter;
import vn.com.dutmobile.model.AccountModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/AdminInsertDeleteAccount")
public class AdminInsertDeleteAccount extends HttpServlet {
    AccountDAOImpl accountDAO = new AccountDAOImpl();
    DateConverter dateConverter = new DateConverter();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        String id = request.getParameter("id");

        try {
            switch (action) {
                case "Delete":
                    accountDAO.deleteAccount(id);
                    request.getRequestDispatcher("Admin/ListAccount.jsp").forward(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        String username1 = request.getParameter("username1");
        String password1 = request.getParameter("password1");
        String repassword1 = request.getParameter("repassword1");
        String type1 = request.getParameter("type1");
        String fullname1 = request.getParameter("fullname1");
        String email1 = request.getParameter("email1");
        String sdt1 = request.getParameter("sdt1");
        String gender1 = request.getParameter("gender1");
        String address1 = request.getParameter("address1");
        Date dob1 = dateConverter.convertStringToDate(request.getParameter("dob1"));
        String active1 = request.getParameter("active1");

        try {
            switch (action) {
                case "Insert":
                    AccountModel acc = new AccountModel();
                    acc.setUsername(username1);
                    acc.setPassword(password1);
                    acc.setType(type1);
                    acc.setFullname(fullname1);
                    acc.setEmail(email1);
                    acc.setPhoneNumber(sdt1);
                    acc.setGender(gender1);
                    acc.setAddress(address1);
                    acc.setDateOfBirth(dob1);
                    acc.setActive(active1);
                    accountDAO.insertAccount(acc);
                    request.getRequestDispatcher("Admin/ListAccount.jsp").forward(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
