package vn.com.dutmobile.controller;

import vn.com.dutmobile.DAO.Implement.AccountDAOImpl;
import vn.com.dutmobile.converter.DateConverter;
import vn.com.dutmobile.model.AccountModel;
import vn.com.dutmobile.utils.UtilsSendMail;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;


@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
    private AccountDAOImpl accountDAO = new AccountDAOImpl();
    private DateConverter dateConverter = new DateConverter();

    protected void requestProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        //get field
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String sdt = request.getParameter("SDT");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String gender = request.getParameter("gender");
        Date dob = dateConverter.convertStringToDate(request.getParameter("dob"));

        //cac bien dai dien cho cac truong hop chua nhap, nhap sai hoac nhap thieu
        String username_ping = "";
        String name_ping = "";
        String sdt_ping = "";
        String email_ping = "";
        String address_ping = "";
        String password_ping = "";
        String repassword_ping  = "";
        String gender_ping = "";
        String dob_ping = "";

        //check cac truong hop loi khi dang ki
        //username
        if (username == "") {
            username_ping = "Vui lòng nhập tên tài khoản của bạn";
        } else {
            if (accountDAO.checkAccountExist(username) == true) {
                username_ping = "Tên tài khoản đã tồn tại";
            }
        }
        if (username_ping.length() > 0) {
            request.setAttribute("username_ping", username_ping);
        }

        //name
        if (name == "") {
            name_ping = "Vui lòng nhập họ tên của bạn";
        }
        if (name_ping.length() > 0) {
            request.setAttribute("name_ping", name_ping);
        }

        //sdt
        if (sdt == "") {
            sdt_ping = "Vui lòng nhập số điện thoại của bạn";
        }
        if (sdt_ping.length() > 0) {
            request.setAttribute("sdt_ping", sdt_ping);
        }

        //email
        if (email == "") {
            email_ping = "Vui lòng nhập email của bạn";
        } else {
            if (accountDAO.checkEmailExist(email) == true) {
                email_ping = "Email này đã được sử dụng";
            } else {
                String regexMail = "^[\\w!#$%&’*+/=?`{|}~^-]+(?:\\.[\\w!#$%&’*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
                if(!email.matches(regexMail)) {
                    email_ping = "Định dạng email sai, Vui lòng kiểm tra lại";
                }
            }
        }
        if (email_ping.length() > 0) {
            request.setAttribute("email_ping", email_ping);
        }

        //address
        if(address == "") {
            address_ping = "Vui lòng nhập địa chỉ của bạn";
        }
        if(address_ping.length() > 0) {
            request.setAttribute("address_ping", address_ping);
        }

        //password
        if (password == "") {
            password_ping = "Vui lòng nhập mật khẩu của bạn";
        } else {
            if (password.length() < 6) {
                password_ping = "Password không được ít hơn 6 kí tự";
            }
        }
        if (password_ping.length() > 0) {
            request.setAttribute("password_ping", password_ping);
        }

        //repassword
        if(!password.equals(repassword)) {
            repassword_ping = "Mật khẩu xác nhận không khớp";
        }
        if(repassword_ping.length() > 0) {
            request.setAttribute("repassword_ping", repassword_ping);
        }

        //gender
        if (gender == null) {
            gender_ping = "Vui lòng chọn giới tính của bạn";
        }
        if (gender_ping.length() > 0) {
            request.setAttribute("gender_ping", gender_ping);
        }

        //dob
        if(dob == null) {
            dob_ping = "Vui lòng chọn ngày sinh của bạn";
        }
        if(dob_ping.length() > 0) {
            request.setAttribute("dob_ping", dob_ping);
        }

        request.setAttribute("username", username);
        request.setAttribute("name", name);
        request.setAttribute("sdt", sdt);
        request.setAttribute("email", email);
        request.setAttribute("address", address);
        request.setAttribute("password", password);
        request.setAttribute("repassword", repassword);
        request.setAttribute("gender", gender);
        request.setAttribute("dob", dob);

        String path = "/login.jsp";
        try {
            if (username_ping.length() == 0 && name_ping.length() == 0 && sdt_ping.length() == 0 && email_ping.length() == 0 && address_ping.length() == 0 && password_ping.length() == 0 && gender_ping.length() == 0) {
                AccountModel acc = new AccountModel();
                acc.setUsername(username);
                acc.setFullname(name);
                acc.setPhoneNumber(sdt);
                acc.setEmail(email);
                acc.setAddress(address);
                acc.setPassword(password);
                acc.setGender(gender);
                acc.setDateOfBirth(dob);
                accountDAO.register(acc);
                path = "/trang-chu.jsp";
                UtilsSendMail.sendMail(acc.getEmail(), "Caa hang DUT MOBILE", "Xin chao " + acc.getEmail() +
                        ". Da dang ki thanh cong tai khoan tai trang web DUTMOBILE");
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                request.setAttribute("message", "Đăng kí thành công");
            } else {
                path = "/login.jsp";
            }
            RequestDispatcher rd = getServletContext().getRequestDispatcher(path);
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        requestProcess(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        requestProcess(request, response);
    }


}
