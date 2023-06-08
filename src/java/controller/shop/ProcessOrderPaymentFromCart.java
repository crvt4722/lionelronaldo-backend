/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.shop;

import dao.OrderDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author User
 */
@WebServlet (urlPatterns = {"/ProcessOrderPaymentFromCart"})
public class ProcessOrderPaymentFromCart extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String orderIdsString = request.getParameter("orderIds");
        
        String productIdsString = request.getParameter("productIds");
        String[] productIds = orderIdsString.split(",");
        
        String sizesString = request.getParameter("sizes");
        String[] sizes = sizesString.split(",");
        ArrayList<String> sizesList = new ArrayList<>();
        for(String x : sizes) sizesList.add(x);
        
        String quantitiesString = request.getParameter("quantities");
        String[] quantities = quantitiesString.split(",");
        ArrayList<String> quantitiesList = new ArrayList<>();
        for(String x : quantities) quantitiesList.add(x);
        System.out.println(productIdsString + " " + sizesString + " " + quantitiesString);
        
        String phone, address;
        
        int userId = 1;
        ArrayList<String> phoneAndAddress = OrderDAO.getPhoneAndAddressOfLastOrder(userId);
        if(phoneAndAddress.get(0) != null){
            phone = phoneAndAddress.get(0);
            address = phoneAndAddress.get(1);
        }
        else{
            phone = "";
            address = "";
        }
        
        ArrayList<Product> productsList = new ArrayList<>();
        
        int totalPriceOfOrders = 0;
        for(int i = 0; i < productIds.length; i++){
            String productId = productIds[i];
            Product product = ProductDAO.getProductById(Integer.parseInt(productId));
            totalPriceOfOrders += product.getPrice() * Integer.parseInt(quantities[i]);
            productsList.add(product);
        }
        
        
        request.setAttribute("productsList", productsList);
        request.setAttribute("sizesList", sizesList);
        request.setAttribute("quantitiesList", quantitiesList);
        request.setAttribute("orderIdsString", orderIdsString);
        String totalPrice = "" + totalPriceOfOrders;
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
//        
        RequestDispatcher dis = request.getRequestDispatcher("leocr-shop-order-payment-from-cart.jsp");
        dis.forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
