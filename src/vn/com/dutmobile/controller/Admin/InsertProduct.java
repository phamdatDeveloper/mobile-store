package vn.com.dutmobile.controller.Admin;

import vn.com.dutmobile.DAO.Implement.ProductDAOimpl;
import vn.com.dutmobile.model.ProductModel;
import vn.com.dutmobile.utils.UtilsPath;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;

@WebServlet("/InsertProduct")
public class InsertProduct extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String nameProduct = request.getParameter("nameproduct");
        String priceProduct = request.getParameter("priceproduct");
        String typeProduct = request.getParameter("typeproduct");


        String image = request.getParameter("imageproduct");
        int numberimg = Integer.parseInt(request.getParameter("numberimg"));
        String decription = request.getParameter("decriptionproduct");
        StringBuilder detail = new StringBuilder();
        StringBuilder imagepath = new StringBuilder();
        int numberDetail = Integer.parseInt(request.getParameter("number-detail"));
        String promotion = request.getParameter("promotion");
        String show = request.getParameter("show");
        String pricePromotion = null;
        if ("yes".equals(promotion)) {
            pricePromotion = request.getParameter("pricepromotionproduct");
        } else if ("no".equals(promotion)) {
            pricePromotion = String.valueOf(0);
        }
        for (int i = 1; i <= numberDetail; i++) {
            String title = request.getParameter("input-title-" + i);
            String text = request.getParameter("input-" + i);
            detail.append(title);
            detail.append("-");
            detail.append(text);
            detail.append("-");
        }
        for (int j = 1; j <= numberimg; j++) {
            String ontImage = request.getParameter("input-image-" + j);
            imagepath.append(ontImage);
            imagepath.append("-");
        }
        ProductModel product = new ProductModel();
        product.setProductName(nameProduct);
        product.setPrice(Double.parseDouble(priceProduct));
        product.setPricePromotion(Double.parseDouble(pricePromotion));
        product.setType(typeProduct);
        product.setImage(image);
        product.setImageDetail(imagepath.toString());
        product.setDescription(decription);
        product.setDetail(detail.toString());
        product.setActive(Integer.parseInt(show));
        ProductDAOimpl p = new ProductDAOimpl();
        p.insertToDB(product);
        request.getRequestDispatcher("Admin/ListProductAdmin.jsp").forward(request,response);
//        response.sendRedirect(request.getContextPath() + "/Admin?page=product_manager_info");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }


}