/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.shop;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;
import model.ProductKeyword;

/**
 *
 * @author User
 */
public class ProcessGetAllProducts extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public int randomNumber(int max) {
        Random rand = new Random();

        // Obtain a number between [0 - 49].
        int n = rand.nextInt(max);

        // Add 1 to the result to get a number from the required range
        // (i.e., [1 - 50]).
        n += 1;
        return n;
    }

    public static double calculate(String s, String key) {
        key = key.toLowerCase();
        String[] arrS = s.split(" ");
        String[] arrKey = key.split(" ");
        int cnt = 0;
        for (String x : arrS) {
            for (String y : arrKey) {
                if (x.contains(y) || y.contains(x)) {
                    cnt++;
                    break;
                }
            }
        }
        return (double) cnt / arrKey.length;
    }

    public static double totalCalculate(ArrayList<String> keywordsList, String key) {
        double res = 0;
        for (String s : keywordsList) {
            res += calculate(s, key);
        }
        return res;
    }

    public static ArrayList<Product> getProductsMatchKey(ArrayList<Product> productsList, String key) {
        ArrayList<Product> productsMatchKey = new ArrayList<>();
        ArrayList<ProductKeyword> productKeywords = new ArrayList<>();
        for (Product product : productsList) {
            productKeywords.add(new ProductKeyword(product, totalCalculate(product.getKeywords(), key)));
        }
        Collections.sort(productKeywords, new Comparator<ProductKeyword>() {
            @Override
            public int compare(ProductKeyword t, ProductKeyword t1) {
                if (t.getFind() < t1.getFind()) {
                    return 1;
                }
                return -1;
            }
        });
        System.out.println("----------------------------");
        for (ProductKeyword pk : productKeywords) {
            if (pk.getFind() > 0) {
                System.out.println(pk.getProduct().getName() + " " + pk.getFind());
                productsMatchKey.add(pk.getProduct());
            }
        }
        System.out.println("-----------------------------------");
        return productsMatchKey;
    }

    public static ArrayList<Product> filterByGenderProduct(ArrayList<Product> productsList, String productGender){
        boolean[] d = new boolean[productsList.size()];
            Arrays.fill(d, true);
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
        ArrayList<Product> res = new ArrayList<Product>();
        for (int i = 0; i < productsList.size(); i++) {
            if (d[i]) {
                res.add(productsList.get(i));
            }
        }
        return res;
    }
    
    public static ArrayList<Product> filterByCategory (ArrayList<Product> productsList, int categoryId){
        ArrayList<Product> res = new ArrayList<>();
        for(Product product : productsList){
            if(product.getCategoryId() == categoryId){
                res.add(product);
            }
        }
        return res;
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        ArrayList<Product> productsList = ProductDAO.getAllProduct();

        String keyWord = request.getParameter("search");
        if (keyWord == null) {
            keyWord = "";
        }
        HttpSession session = request.getSession();
        session.setAttribute("search", keyWord);

        ArrayList<Product> res = getProductsMatchKey(productsList, keyWord);
        
                
//        Lọc theo giới tính đối tượng
        String productGender = request.getParameter("productGender");
        if(productGender != null){
            res = filterByGenderProduct(res, productGender);
        }
//        Lọc theo danh mục
        String categoryStr = request.getParameter("categoryId");
        if(categoryStr != null){
            int categoryId = Integer.parseInt(categoryStr);
            res = filterByCategory(res, categoryId);
        }

        request.setAttribute("productsList", res);
        RequestDispatcher dis = request.getRequestDispatcher("leocr-shop-detail.jsp");
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
