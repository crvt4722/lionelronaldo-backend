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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author User
 */
public class ProcessOrderPayment extends HttpServlet {
   
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
        int productId = Integer.parseInt(request.getParameter("productId"));
        String size = request.getParameter("size");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String phone, address;
        
        int userId = Integer.parseInt((String)request.getSession().getAttribute("user_id"));
        ArrayList<String> phoneAndAddress = OrderDAO.getPhoneAndAddressOfLastOrder(userId);
        if(phoneAndAddress != null){
            phone = phoneAndAddress.get(0);
            address = phoneAndAddress.get(1);
        }
        else{
            phone = "";
            address = "";
        }
        
        Product product = ProductDAO.getProductById(productId);
        
        request.setAttribute("product", product);
        request.setAttribute("size", size);
        request.setAttribute("quantity", quantity);
        String totalPrice = "" + product.getPrice() * quantity;
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
        
        RequestDispatcher dis = request.getRequestDispatcher("leocr-shop-order-payment.jsp");
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
