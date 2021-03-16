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

@WebServlet("/AdminUpdateAccount")
public class AdminUpdateAccount extends HttpServlet {
    private static AccountDAOImpl accountDAO = new AccountDAOImpl();
    DateConverter dateConverter = new DateConverter();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String path = "";
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        String type = request.getParameter("type");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String sdt = request.getParameter("sdt");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        Date dob = dateConverter.convertStringToDate(request.getParameter("dob"));
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String active = request.getParameter("active");

        String type_ping = "";
        String fullname_ping = "";
        String email_ping = "";
        String sdt_ping = "";
        String gender_ping = "";
        String dob_ping = "";
        String password_ping = "";
        String repassword_ping = "";
        String active_ping = "";

        //check loi
        //type
        if(type == "no") {
            type_ping = "Vui lòng chọn loại tài khoản";
        }
        if(type_ping.length() > 0) {
            request.setAttribute("type_ping", type_ping);
        }
        //fullname
        if(fullname.equals("")) {
            fullname_ping = "Vui lòng nhập tên hiển thị";
        }
        if(fullname_ping.length() > 0) {
            request.setAttribute("fullname_ping", fullname_ping);
        }
        //email
        if(email.equals("")) {
            email_ping = "Vui lòng nhập email";
        }
        if(email_ping.length() > 0) {
            request.setAttribute("email_ping", email_ping);
        }
        //sdt
        if(sdt.equals("")) {
            sdt_ping = "Vui lòng nhập số điện thoại";
        }
        if(sdt_ping.length() > 0) {
            request.setAttribute("sdt_ping", sdt_ping);
        }
        //gioi tinh
        if(gender == "no") {
            gender_ping = "Vui lòng chọn giới tính";
        }
        if(gender_ping.length() > 0) {
            request.setAttribute("gender_ping", gender_ping);
        }
        //dob
        if(dob == null) {
            dob_ping = "Vui lòng chọn ngày sinh của bạn";
        }
        if(dob_ping.length() > 0) {
            request.setAttribute("dob_ping", dob_ping);
        }
        //pass
        if(password.equals("")) {
            password_ping = "Vui lòng nhập mật khẩu";
        } else {
            if(password.length() < 8) {
                password_ping = "Mật khẩu không thể ít hơn 8 kí tự";
            }
        }
        if(password_ping.length() > 0) {
            request.setAttribute("password_ping", password_ping);
        }
        //repass
        if(!repassword.equals(password)) {
            repassword_ping = "Xác nhận mật khẩu không khớp";
        }
        if(repassword_ping.length() > 0) {
            request.setAttribute("repassword_ping", repassword_ping);
        }
        //active
        if(active == null) {
            active_ping = "Vui lòng chọn xem tài khoản có hiển thị không";
        }
        if(active_ping.length() > 0) {
            request.setAttribute("active_ping", active_ping);
        }

        request.setAttribute("type", type);
        request.setAttribute("fullname", fullname);
        request.setAttribute("email", email);
        request.setAttribute("sdt", sdt);
        request.setAttribute("gender", gender);
        request.setAttribute("address", address);
        request.setAttribute("dob", dob);
        request.setAttribute("password", password);
        request.setAttribute("repassword", repassword);
        request.setAttribute("active", active);

        try {
            switch (action) {
                case "Update":
                    if(type_ping.length() == 0 && fullname_ping.length() == 0 &&
                            email_ping.length() == 0 && sdt_ping.length() == 0 && gender_ping.length() == 0 &&
                    dob_ping.length() == 0 && password_ping.length() == 0 &&
                            repassword_ping.length() == 0 && active_ping.length() == 0) {
                        AccountModel accountModel = new AccountModel(id, null, password, type, active, fullname, sdt, email, address, gender, dob);
                        accountDAO.updateAccount(accountModel);
                        request.getRequestDispatcher("Admin/ListAccount.jsp").forward(request, response);
//                        response.sendRedirect(request.getContextPath() + "/Admin/ListAccount.jsp");
                        break;
                    }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
