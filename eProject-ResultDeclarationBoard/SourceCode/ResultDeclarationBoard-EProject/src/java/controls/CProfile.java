/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controls;

import beans.BProfile;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "CProfile", urlPatterns = {"/CProfile"})
public class CProfile extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String staffId = request.getParameter("staffId");
        String staffName = request.getParameter("staffName");
        String staffAddress = request.getParameter("staffAddress");
        String staffEmail = request.getParameter("staffEmail");
        String staffPhone = request.getParameter("staffPhone");
        String staffBirth = request.getParameter("staffBirth");
        String gender = request.getParameter("gender");

        HttpSession session = request.getSession(true);
        BProfile ojb = new BProfile();

        if (request.getParameter("btn").equals("Save")) {
            boolean rs = ojb.updateProfile(staffId, staffName, staffAddress, staffEmail, staffPhone, staffBirth, gender);
            if (rs == true) {
                response.sendRedirect("Admin/profile.jsp");
            } else {
                out.println("<a href='Admin/profile.jsp'>Update fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Change password")) {
            String stapass = request.getParameter("stapass");
            String staconpass = request.getParameter("staconpass");
            boolean rs = ojb.updatepass(staffId, stapass, staconpass);
            if (rs == true) {
                response.sendRedirect("Admin/profileP.jsp");
            } else {
                out.println("<a href='Admin/profileP.jsp'>Update fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Change secret password")) {            
            String stapass = request.getParameter("stapass");
            String staques = request.getParameter("staques");
            String staans = request.getParameter("staans");
            boolean rs = ojb.updateQuestion(staffId, stapass, staques, staans);
            if (rs == true) {
                response.sendRedirect("Admin/profileQ.jsp");
            } else {
                out.println("<a href='Admin/profileQ.jsp'>Update fail back...!</a>");
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
