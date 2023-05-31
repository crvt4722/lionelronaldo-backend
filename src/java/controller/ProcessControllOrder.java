package controller;

import com.google.gson.Gson;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author DELL
 */
@WebServlet (urlPatterns = {"/api/orders/controll/*"})
public class ProcessControllOrder extends HttpServlet {

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
        
        String email = (String) request.getSession().getAttribute("email");
        if (email != null && email.equals("")==false){
            String role = UserDAO.getRole(email);
            if (role.equals("admin") || role.equals("ctv")){
                try{
                    System.out.println(request.getPathInfo().substring(1));
                    
                    String [] requestInfos = request.getPathInfo().substring(1).split("/");
                    
                    int id = Integer.parseInt(requestInfos[0]);
                    int option  = Integer.parseInt(requestInfos[1]);
                    
                    UserDAO.controllOrder(id, option);
                    Gson gson = new Gson();
                    response.addHeader("Access-Control-Allow-Origin", "*");
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    String json = "{\"productId\": " + id +"}";
                    response.getWriter().write(json);
                    response.sendRedirect("http://localhost:8080/LeoCris/order-web.jsp");
                }
                catch(Exception e){
                    e.printStackTrace();
                    response.sendRedirect("http://localhost:8080/LeoCris/order-web.jsp");
                }
            }
        }
        else {
            response.getWriter().write("{\"Message\": \"Permission denied.\"");
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
