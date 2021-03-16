package vn.com.dutmobile.controller.Admin;

import vn.com.dutmobile.DAO.Implement.ProductDAOimpl;
import vn.com.dutmobile.DAO.Implement.TypeProductDAOImpl;
import vn.com.dutmobile.model.TypeProductModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/UpdateType")
public class UpdateType extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String newNameType = request.getParameter("newnametype");
        String oldNameType = request.getParameter("oldnametype");
        String active = request.getParameter("active");
        TypeProductDAOImpl typeProductImpl = new TypeProductDAOImpl();
        int activeType;
        ProductDAOimpl productDAOimpl = new ProductDAOimpl();
        if (!newNameType.equals(oldNameType)) {
            productDAOimpl.updateTypeActive(newNameType, oldNameType);
            if (active.equalsIgnoreCase("yes")) {
                activeType = 1;
                productDAOimpl.updateTypeActive(newNameType, 1);
            } else {
                activeType = 0;
                productDAOimpl.updateTypeActive(newNameType, 0);
            }
            typeProductImpl.updateType(id, newNameType, activeType);
        } else {
            if (active.equalsIgnoreCase("yes")) {
                activeType = 1;
                productDAOimpl.updateTypeActive(oldNameType, 1);
            } else {
                activeType = 0;
                productDAOimpl.updateTypeActive(oldNameType, 0);
            }
            typeProductImpl.updateType(id, oldNameType, activeType);
        }

            response.sendRedirect(request.getContextPath() + "/Admin/ListProductType.jsp");

        }

        protected void doPost (HttpServletRequest request, HttpServletResponse response) throws
        ServletException, IOException {
            doGet(request, response);
        }

    }