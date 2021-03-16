package vn.com.dutmobile.controller.Client;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Cart")
public class Cart extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        vn.com.dutmobile.model.Cart cart = (vn.com.dutmobile.model.Cart) request.getSession().getAttribute("Cart");
        request.setAttribute("Cart" , cart);
        request.getRequestDispatcher("Cart.jsp").forward(request,response);


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}