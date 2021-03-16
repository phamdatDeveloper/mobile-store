package vn.com.dutmobile.controller.Client;

import vn.com.dutmobile.DAO.Implement.ProductDAOimpl;
import vn.com.dutmobile.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/productSeachByCategory")
public class ProductSeachByCategory extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAOimpl productDAOimpl = new ProductDAOimpl();
        String number = request.getParameter("page");
        String type = request.getParameter("type");
        ArrayList<String> typeProduct = productDAOimpl.getTypeProduct();
        request.setAttribute("typeProduct", typeProduct);

        ArrayList<ProductModel> listProduct = new ArrayList<ProductModel>();
        ArrayList<String> numberList = new ArrayList<String>();

        int list = productDAOimpl.countProductByType(type);
        if (list / 12 != 0) {
            for (int i = 0; i <= list / 12; i++) {
                numberList.add(String.valueOf(i + 1));
            }
            if (number == null) {
                listProduct = productDAOimpl.getProductByType(type, 0);
            } else {
                int page = Integer.parseInt(number);
                listProduct = productDAOimpl.getProductByType(type, (page - 1) * 12);
            }
        } else {
            numberList.add(String.valueOf(1));
            if (number == null) {
                listProduct = productDAOimpl.getProductByType(type, 0);
            } else {
                int page = Integer.parseInt(number);
                listProduct = productDAOimpl.getProductByType(type, (page - 1) * 12);
            }
        }
        request.setAttribute("pageNumber", numberList);
        request.setAttribute("searchByCategory", listProduct);
        request.getRequestDispatcher("ProductSearchByCategory.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}