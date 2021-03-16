package vn.com.dutmobile.controller.Client;

import vn.com.dutmobile.model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Payment")
public class Payment extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("account") == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            vn.com.dutmobile.model.Cart cart = (Cart) request.getSession().getAttribute("Cart");
            if(cart==null) cart = new Cart();
            request.setAttribute("Cart", cart);
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}