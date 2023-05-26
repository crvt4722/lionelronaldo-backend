/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserProfile;
import util.PasswordEncoder;
import util.Validate;

/**
 *
 * @author DELL
 */
public class ProcessSignupCTV extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("repassword");
        
        System.out.println(email);
        String errorMessage = "";
        if (!Validate.checkName(fullname)){
            errorMessage = "Tên không hợp lệ. Hãy thử lại!";
        }
        else if(!Validate.checkEmail(email)){
            errorMessage = "Email không hợp lệ. Hãy thử lại!";
        }
        else if (UserDAO.isDuplicateEmail(email)){
            errorMessage = "Email đã bị trùng. Hãy thử lại!";
        }
        else if (!Validate.checkPassword(password) || !Validate.checkPassword(rePassword)){
            errorMessage = "Mật khẩu không hợp lệ. Hãy thử lại!";
        }
        else if(password.equals(rePassword)==false){
            errorMessage = "Mật khẩu không khớp. Hãy thử lại!";
        }
        else{
            password = PasswordEncoder.encode(password);
            
            UserDAO.insertUserProfile(fullname, email, password, "ctv");
            errorMessage = "Đăng ký thành công!";
        }
        request.setAttribute("error2", errorMessage);
        
        RequestDispatcher dis = request.getRequestDispatcher("authorization.jsp");
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
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ProcessSignup.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ProcessSignup.class.getName()).log(Level.SEVERE, null, ex);
        }
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
