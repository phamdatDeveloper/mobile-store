package vn.com.dutmobile.controller.Client;

import vn.com.dutmobile.model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/CheckNullCart")
public class CheckNullCart extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        vn.com.dutmobile.model.Cart c = (vn.com.dutmobile.model.Cart) session.getAttribute("Cart");
        if (c == null)
            c = new Cart();
        if (c.list().size() == 0) {
            session.removeAttribute("cart");
            request.setAttribute("mes_fail", "gui that bai");
            request.getRequestDispatcher("Cart.jsp").forward(request, response);

        } else {
            response.sendRedirect("Payment");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}