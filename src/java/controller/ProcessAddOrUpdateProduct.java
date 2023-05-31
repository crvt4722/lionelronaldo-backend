/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author DELL
 */
public class ProcessAddOrUpdateProduct extends HttpServlet {

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
        
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String gender = request.getParameter("gender");
        String brand = request.getParameter("brand");
        String originPrice = request.getParameter("origin-price");
        String sale = request.getParameter("sale");
        String quantity = request.getParameter("quantity");
        String size = request.getParameter("size");
        String description = request.getParameter("description");
        String []files = request.getParameterValues("files");
        
        String keywords = request.getParameter("keywords");
        String id = request.getParameter("product-id");
        
        
        String errorMessage = "";
        
        RequestDispatcher dis = request.getRequestDispatcher("product.jsp");
        System.out.println(id);
        
        if (id != null  && id.equals("")==false ){
            int ID = Integer.parseInt(id);
            if (keywords.equals("")==false) UserDAO.updateKeyWords(ID, keywords.split("!"));
            if(files.length > 0) UserDAO.updateProductImage(ID, files);
            if(quantity.equals("")==false){
                int quantityX = Integer.parseInt(quantity);
                UserDAO.updateWarehouse(ID, quantityX);
            }
            
            int originPriceX = originPrice.equals("")? -1 : Integer.parseInt(originPrice);
            int saleX = sale.equals("")? -1 : Integer.parseInt(sale);
            
            UserDAO.updateProduct(ID, name, description, gender, brand, originPriceX, saleX);
            errorMessage = "Cập nhật thành công";
            request.setAttribute("error", errorMessage);
            dis.forward(request, response);
        }
        else if (id == null || id.equals("")==true) {
            
            if (name == null ||name.equals("")){
                errorMessage = "Vui lòng nhập tên sản phẩm";
                request.setAttribute("error", errorMessage);
                dis.forward(request, response);
            }
            else if (category == null || category.equals("category")){
                errorMessage = "Vui lòng chọn loại mặt hàng";
                request.setAttribute("error", errorMessage);
                dis.forward(request, response);
                
            }
            else if (gender == null ||gender.equals("gender")){
                errorMessage = "Vui lòng chọn đối tượng hướng đến";
                request.setAttribute("error", errorMessage);
                dis.forward(request, response);
            }
            else if (brand == null ||brand.equals("brand")){
                errorMessage = "Vui lòng chọn nhãn hiệu";
                request.setAttribute("error", errorMessage);
                dis.forward(request, response);
            }
            else if (size == null ||size.equals("size")){
                errorMessage = "Vui lòng chọn kích thước";
                request.setAttribute("error", errorMessage);
                dis.forward(request, response);
            }
            else if (originPrice== null ||originPrice.equals("")){
                errorMessage = "Vui lòng nhập giá sản phẩm";
                request.setAttribute("error", errorMessage);
                dis.forward(request, response);
            }
            
            else if (quantity== null ||quantity.equals("")){
                errorMessage = "Vui lòng nhập số lượng sản phẩm trong kho";
                request.setAttribute("error", errorMessage);
                dis.forward(request, response);
            }
            else {
                
                int orginPriceX = Integer.parseInt(originPrice);
                int quantityX = Integer.parseInt(quantity);
                int saleX = sale.equals("")? 0 : Integer.parseInt(originPrice);
                int categoryId = UserDAO.getCategoryID(category);
                
                UserDAO.addProduct(name, categoryId, description, gender, brand, orginPriceX, saleX);
                int productId = UserDAO.getProductIdToAdd();
                System.out.println(categoryId + " " + productId);
                
                UserDAO.addKeyWords(productId, keywords.split("!"));
                UserDAO.addProductImage(productId, files);
                UserDAO.addWareHouse(productId, size, quantityX);
                
                errorMessage = "Thêm thành công mặt hàng";
//                dis.forward(request, response);
                request.setAttribute("error", errorMessage);
                dis.forward(request, response);
            }
            
        }
        
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

