package vn.com.dutmobile.controller.Client;

import vn.com.dutmobile.model.Cart;
import vn.com.dutmobile.utils.UtilsPath;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/DeleteProductCart")
public class DeleteProductCart extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            int id = Integer.parseInt(request.getParameter("id"));
            vn.com.dutmobile.model.Cart cart = (vn.com.dutmobile.model.Cart) session.getAttribute("Cart");
            if(cart == null) cart = new Cart();
            cart.remove(id);
            session.setAttribute("Cart", cart);
        } catch (NumberFormatException e) {

        }
        response.sendRedirect(UtilsPath.getPath("Cart"));

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}