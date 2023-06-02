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
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Keyword;
import model.Product;

/**
 *
 * @author User
 */
public class ProcessGetKeyWordSearch extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static double calculate(String s, String key){
        key = key.toLowerCase();
        String[] arrS = s.split(" ");
        String[] arrKey = key.split(" ");
        int cnt = 0;
        for(String x : arrS){
            for(String y : arrKey){
                if (x.contains(y) || y.contains(x)) {
                    cnt++;
                    break;
                }
            }
        }
        return (double) cnt / arrKey.length;
    }
    public static String boldKeyword(String s, String key){
        if(s.startsWith(key)){
            s = "<b>" + key + "</b>" + s.substring(key.length());
            return s;
        }
        String[] arr = s.split(" ");
        String res = "";
        for(String x : arr){
            if(key.contains(x)){
                res += "<b>" + x + "</b> ";
            }
            else res += x + " ";
        }
        return res;
    }
    public static ArrayList<String> getMatchKeys(ArrayList<String> allProductKeywords, String key){
        ArrayList<String> matchKey = new ArrayList<>();
        ArrayList<Keyword> keywordsList = new ArrayList<>();
        key = key.toLowerCase();
        for(String x : allProductKeywords){
            double findResult = calculate(x, key);
            if(findResult > 0){
                keywordsList.add(new Keyword(boldKeyword(x, key), findResult));
            }
        }
        Collections.sort(keywordsList, new Comparator<Keyword>(){
            @Override
            public int compare(Keyword t, Keyword t1) {
                if(t.getFind() < t1.getFind()) return 1;
                return -1;
            }
        });
        int MAX_NUMBER_OF_SUGGEST = 6;
        for(Keyword k : keywordsList){
            if(matchKey.size() > MAX_NUMBER_OF_SUGGEST) break;
            matchKey.add(k.getName());
        }
        return matchKey;
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String keyWord = request.getParameter("search");
        ArrayList<String> allProductKeywords = ProductDAO.getAllKeywords();
        ArrayList<String> matchKeys = getMatchKeys(allProductKeywords, keyWord);
        
        String json = new Gson().toJson(matchKeys);
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
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

