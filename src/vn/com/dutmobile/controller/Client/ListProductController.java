package vn.com.dutmobile.controller.Client;

import vn.com.dutmobile.DAO.Implement.ProductDAOimpl;
import vn.com.dutmobile.model.ProductModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ListProduct")
public class ListProductController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAOimpl productDAOimpl = new ProductDAOimpl();
        String number = request.getParameter("page");
        ArrayList<String> typeProduct = productDAOimpl.getTypeProduct();
        request.setAttribute("typeProduct", typeProduct);

        ArrayList<ProductModel> listProduct = new ArrayList<ProductModel>();
        ArrayList<String> numberList = new ArrayList<String>();

        ArrayList<ProductModel> list = productDAOimpl.getAllProductActive();
        for (int i = 0; i < Math.round((list.size()) / 12) + 1; i++) {
            numberList.add(String.valueOf(i + 1));
        }
        if (number == null) {
            listProduct = productDAOimpl.numberPageProduct(0);
        } else {
            int page = Integer.parseInt(number);
            listProduct = productDAOimpl.numberPageProduct((page - 1) * 12);
        }
        request.setAttribute("pagenumber", numberList);
        request.setAttribute("product", listProduct);
        request.getRequestDispatcher("product.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }


}