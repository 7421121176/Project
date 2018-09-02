/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controls;

import beans.GetConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author An
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            GetConnect obj = new GetConnect();
            Connection conn = obj.getconnection();
            String name = request.getParameter("txtUser").toString();
            String pass = request.getParameter("txtPass").toString();
            String sql = "select a.*, b.* from tb_Staff as a INNER JOIN tb_StaffRole as b ON a.Staff_Id=b.Staff_Id where a.Staff_Id='"
                    + name
                    + "' AND a.Staff_Pass='"
                    + pass
                    + "' AND a.Staff_Status = 'true'";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                HttpSession session = request.getSession(true);                
                session.setMaxInactiveInterval(60*60*24*30);  
                String a = rs.getString("Staff_FullName");
                session.setAttribute("login", name);
                session.setAttribute("loginname", a);
                session.setAttribute("namelogin", "ch");
                session.setAttribute("lockscreen", "UN");                
                String b = rs.getString("Role_Id");
                session.setAttribute("rolesne", b);
                response.sendRedirect("Admin/index.jsp");
            } else {
                response.sendRedirect("Admin/login.jsp");
            }

        } catch (Exception ex) {

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
