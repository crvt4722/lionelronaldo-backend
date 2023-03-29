/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.mysql.cj.xdevapi.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.UserDAO;
import java.io.BufferedReader;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import util.Validate;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.util.concurrent.TimeUnit;
import org.apache.tomcat.jni.Time;

/**
 *
 * @author DELL
 */

@WebServlet (urlPatterns = {"/get-old-messages"})
public class ProcessSendMessage extends HttpServlet {

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
        
        ArrayList<String> messages = UserDAO.getMessages("everyone");
        
        String messagesString = "";
        for (String x : messages) {
            messagesString += "<li>" + x + "</li>";
        }
        
        response.getWriter().write(messagesString);
        
 /*       String nameShown = request.getParameter("name-shown");
        String message = request.getParameter("message");
        
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        System.out.println(sb.toString());
        
        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(sb.toString(), JsonObject.class);
        if (jsonObject != null){
            nameShown = jsonObject.get("nameShown").getAsString();
            message = jsonObject.get("messageContent").getAsString();
        }
        
        System.out.println(nameShown);
//        System.out.println(reader);
        
//        System.out.println(request.getMethod());
        
        if (Validate.controlUserInput(message) && Validate.controlUserInput(nameShown)){
            UserDAO.insertMessage(nameShown, "everyone", message);
        }
        
        
        
//        PrintWriter out = response.getWriter();
//
//        try {
//            // Delay 5 giây trước khi gửi dữ liệu mới
//            
//            TimeUnit.MILLISECONDS.sleep(1000);
//
//            // Gửi dữ liệu mới cho client
//            out.write(messagesString);
//            out.flush();
//        } catch (InterruptedException e) {
//            // Xử lý lỗi
////            Time.sleep(1000);
//            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//            System.out.println("Error occurred while long polling");
//            out.flush();
//        } finally {
//            out.close();
//        }*/
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
