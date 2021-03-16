package vn.com.dutmobile.controller;

import vn.com.dutmobile.DAO.Implement.ProductDAOimpl;
import vn.com.dutmobile.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/HomeController")
public class HomeController extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAOimpl productDAO = new ProductDAOimpl();
        ArrayList<ProductModel> productPromotion = productDAO.productPromotion();
        request.setAttribute("productPromotion",productPromotion);

        ArrayList<String> typeProduct = productDAO.getTypeProduct();
        request.setAttribute("type",typeProduct);
        for (int i =0; i< typeProduct.size();i++) {
            ArrayList<ProductModel> productByType = productDAO.getProduct(typeProduct.get(i),0,3);
            request.setAttribute("typenumber"+i,productByType);
        }
        request.getRequestDispatcher("trang-chu.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}