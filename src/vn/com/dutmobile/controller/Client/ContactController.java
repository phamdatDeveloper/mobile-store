package vn.com.dutmobile.controller.Client;

import vn.com.dutmobile.DAO.Implement.ContactDAOImpl;
import vn.com.dutmobile.model.ContactModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ContactController")
public class ContactController extends HttpServlet {
    ContactDAOImpl contactDAO = new ContactDAOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        //get field
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String topic = request.getParameter("topic");
        String question = request.getParameter("question");

        //check loi~
        String name_ping = "";
        String email_ping = "";
        String topic_ping = "";
        String question_ping = "";

        //name
        if (name == "") {
            name_ping = "Vui lòng điền tên của bạn";
        }
        if (name_ping.length() > 0) {
            request.setAttribute("name_ping", name_ping);
        }

        //email
        String regex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
        if (email == "" || !email.matches(regex)) {
            email_ping = "Nhập sai định dạng email";
        }
        if (email_ping.length() > 0) {
            request.setAttribute("email_ping", email_ping);
        }

        //topic
        if (topic == "") {
            topic_ping = "Vui lòng nhập điều bạn muốn hỏi";
        }
        if (topic_ping.length() > 0) {
            request.setAttribute("topic_ping", topic_ping);
        }

        //question
        if (question == "") {
            question_ping = "Hãy nhập câu hỏi của bạn";
        }
        if (question_ping.length() > 0) {
            request.setAttribute("question_ping", question_ping);
        }

        request.setAttribute("name", name);
        request.setAttribute("email", email);
        request.setAttribute("topic", topic);
        request.setAttribute("question", question);

        String message = "";

        try {
            if (name_ping.length() == 0 && email_ping.length() == 0 && topic_ping.length() == 0 && question_ping.length() == 0) {
                ContactModel contactModel = new ContactModel();
                contactModel.setName(name);
                contactModel.setEmail(email);
                contactModel.setTopic(topic);
                contactModel.setQuestion(question);
                contactDAO.contact(contactModel);
                message = "Gửi câu hỏi thành công";
            } else {
                message = "Gửi câu hỏi thất bại";
            }
            request.setAttribute("message", message);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/ContactUs.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("abc");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
