/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.shop;

import com.google.gson.Gson;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author User
 */
public class ProcessSortAndFilterProducts extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    public static boolean containValue(String[] arr, String x) {
        for (String item : arr) {
            if (item.equalsIgnoreCase(x)) {
                return true;
            }
        }
        return false;
    }
    
    public static void checkContainSearchKey(ArrayList<Product> productsList, String key, boolean[] d){
        key = key.toLowerCase();
        for(int i = 0; i < productsList.size(); i++){
            Product product = productsList.get(i);
            if(!(product.getName().toLowerCase().contains(key) || product.getBrand().toLowerCase().contains(key) || product.getDescription().toLowerCase().contains(key))){
                d[i] = false;
            }
            
            
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int minPrice = Integer.parseInt(request.getParameter("minPrice"));
        int maxPrice = Integer.parseInt(request.getParameter("maxPrice"));
        int minRating = Integer.parseInt(request.getParameter("minRating"));
        String productGender = request.getParameter("productGender");

        String[] brands = {};
        if (!request.getParameter("brand").trim().equals("")) {
            brands = request.getParameter("brand").split(",");
        }
        System.out.println(">>Check APi");
        ArrayList<Product> productsList = ProductDAO.getAllProduct();
        ArrayList<Product> res = new ArrayList<>();
        boolean[] d = new boolean[productsList.size()];
        Arrays.fill(d, true);
        
        // handle search
        String searchProduct = request.getParameter("searchProduct");
        System.out.println(">>>searchProduct");
        System.out.println(searchProduct);
        checkContainSearchKey(productsList, searchProduct, d);
        // handle Sort 
        int sortData = Integer.parseInt(request.getParameter("sortData"));
        // sort by best seller
        if(sortData == 1){
            Collections.sort(productsList, new Comparator<Product>(){
                @Override
                public int compare(Product t, Product t1) {
                    return t1.getSoldQuantity() - t.getSoldQuantity();
                }
                
            });
        }
        else if(sortData == 2){
            // sort by big sale
            Collections.sort(productsList, new Comparator<Product>(){
                @Override
                public int compare(Product t, Product t1) {
                    return t1.getSale()- t.getSale();
                }
                
            });
        }
        else if(sortData == 3){
            // sort by price asc
            Collections.sort(productsList, new Comparator<Product>(){
                @Override
                public int compare(Product t, Product t1) {
                    return t.getPrice()- t1.getPrice();
                }
                
            });
        }
        else if(sortData == 4){
            // sort by price desc
            Collections.sort(productsList, new Comparator<Product>(){
                @Override
                public int compare(Product t, Product t1) {
                    return t1.getPrice()- t.getPrice();
                }
                
            });
        }
        
        // FILTER
//        Lọc theo giá
        for (int i = 0; i < productsList.size(); i++) {
            Product product = productsList.get(i);
            if (!(product.getPrice() >= minPrice && product.getPrice() <= maxPrice)) {
                d[i] = false;
            }
        }
//         Lọc theo đánh giá sao
        for (int i = 0; i < productsList.size(); i++) {
            Product product = productsList.get(i);
            if (!(product.getAvgRating() >= minRating)) {
                d[i] = false;
            }
        }
//        Lọc theo hãng
        if (brands.length > 0) {
            for (int i = 0; i < productsList.size(); i++) {
                Product product = productsList.get(i);
                if (!(containValue(brands, product.getBrand()))) {
                    d[i] = false;
                }
            }
        }
        // Lọc theo giới tính
        if(productGender.compareTo("0") > 0) {
            for (int i = 0; i < productsList.size(); i++) {
                Product product = productsList.get(i);
                if(productGender.equals("1")){
                    if(!product.getGender().equals("1") && !product.getGender().equals("4") && !product.getGender().equals("5")){
                        d[i] = false;
                    }
                }
                else if(productGender.equals("2")){
                    if(!product.getGender().equals("2") && !product.getGender().equals("4") && !product.getGender().equals("5")){
                        d[i] = false;
                    }
                }
                else if(productGender.equals("3")){
                    if(!product.getGender().equals("3") && !product.getGender().equals("5")){
                        d[i] = false;
                    }
                }
                else if(productGender.equals("4")){
                    if(product.getGender().compareTo("3") == 0){
                        d[i] = false;
                    }
                }
            }
        }

        
        
        for (int i = 0; i < productsList.size(); i++) {
            if (d[i]) {
                res.add(productsList.get(i));
            }
        }
        System.out.println(">>>check API2");

        String json = new Gson().toJson(res);
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
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
