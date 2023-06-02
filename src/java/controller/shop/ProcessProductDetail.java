/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.shop;

import static controller.shop.ProcessGetAllProducts.getProductsMatchKey;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.HashSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CustomerResponse;
import model.Product;

/**
 *
 * @author User
 */
public class ProcessProductDetail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

//        String productId = request.getPathInfo().substring(1);
        int productId = Integer.parseInt(request.getParameter("id"));
        ArrayList<Product> productsList = ProductDAO.getAllProduct();
        Product productDetail = new Product();
        ArrayList<Product> relatedProducts = new ArrayList<>();
        for (Product product : productsList) {
            if (product.getProductId() == productId) {
                productDetail = product;
                break;
            }
        }
        HashSet<Integer> se = new HashSet<>();
        for (Product product : productsList) {
            if (product.getCategoryId() == productDetail.getCategoryId()) {
                relatedProducts.add(product);
                se.add(product.getProductId());
            }
        }
        for (Product product : productsList) {
            if (product.getBrand().equals(productDetail.getBrand()) && !se.contains(product.getProductId())) {
                relatedProducts.add(product);
                se.add(product.getProductId());
            }
        }

        ArrayList<CustomerResponse> productResponses = ProductDAO.getCustomerResponseByProductId(productDetail.getProductId());

//        HttpSession session = request.getSession();
        request.setAttribute("productDetail", productDetail);
        request.setAttribute("relatedProducts", relatedProducts);
        request.setAttribute("productResponses", productResponses);

//        response.sendRedirect("/WebApplication2/leocr-shop-product-detail.jsp");
        RequestDispatcher dis = request.getRequestDispatcher("leocr-shop-product-detail.jsp");
        dis.forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
