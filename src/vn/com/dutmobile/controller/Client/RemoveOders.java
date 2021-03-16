package vn.com.dutmobile.controller.Client;

import vn.com.dutmobile.DAO.Implement.ProductDAOimpl;
import vn.com.dutmobile.model.AccountModel;
import vn.com.dutmobile.model.Cart;
import vn.com.dutmobile.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/RemoveOders")
public class RemoveOders extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String pay = request.getParameter("pay");
        String address = request.getParameter("address");

        vn.com.dutmobile.model.Cart c = (Cart) session.getAttribute("Cart");
        AccountModel acc = (AccountModel) session.getAttribute("account");

        for (ProductModel p : c.list()) {
            ProductModel product = new ProductModel();
            product.setImage(p.getImage());
            product.setProductName(p.getProductName());
            product.setPrice(p.getPrice());
            product.setQuantity(p.getQuantity());
            product.setId(p.getId());

            ProductDAOimpl proDAO = new ProductDAOimpl();
            proDAO.insertToCart(product, acc.getId(), pay);
            proDAO.insertToMyOders(product, acc.getId(), address);
//                    response.getWriter().println(p.getProductName());
        }

        session.removeAttribute("Cart");
        session.setAttribute("mes_success", "gui thanh cong");
        response.sendRedirect("Cart");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}