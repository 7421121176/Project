/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controls;

import beans.BCurriculum;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "CCurriculum", urlPatterns = {"/CCurriculum"})
public class CCurriculum extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String curriculumID = request.getParameter("curId");
        String curriculumName = request.getParameter("curName");
        String curriPeriod = request.getParameter("curPeriod");
        String curriFee = request.getParameter("curFee");

        HttpSession session = request.getSession(true);
        BCurriculum ojb = new BCurriculum();

        if (request.getParameter("btn").equals("Add")) {
            boolean rs = ojb.insertCurriculum(curriculumID, curriculumName, curriPeriod, curriFee);
            if (rs == true) {
                response.sendRedirect("Admin/curriculumA.jsp");
            } else {
                out.println("<a href='Admin/curriculumA.jsp'>Insert fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Save")) {
            boolean rs = ojb.updateCurriculum(curriculumID, curriculumName, curriPeriod, curriFee);
            if (rs == true) {
                response.sendRedirect("Admin/curriculum.jsp?pageNum=" + request.getParameter("p"));
            } else {
                out.println("<a href='Admin/curriculumE.jsp'>Edit fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Delete")) {
            boolean rs = ojb.deleteCurriculum(request.getParameter("curId"));
            if (rs == true) {
                response.sendRedirect("Admin/curriculum.jsp?pageNum=" + request.getParameter("p"));
            } else {
                out.println("<a href='Admin/curriculum.jsp'>Delete fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Edit")) {
            String scurriculumID = request.getParameter("ecurriculumID");
            String scurriculumname = request.getParameter("ecurriculumname");
            String scurriculumperiod = request.getParameter("ecurriculumperiod");
            String scurriculumfee = request.getParameter("ecurriculumfee");

            /////////session
            session.setAttribute("scurriculumID", scurriculumID);
            session.setAttribute("scurriculumname", scurriculumname);
            session.setAttribute("scurriculumperiod", scurriculumperiod);
            session.setAttribute("scurriculumfee", scurriculumfee);
            session.setAttribute("p", request.getParameter("p"));
            response.sendRedirect("Admin/curriculumE.jsp");
        }
        out.close();
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

        } catch (SQLException ex) {
            Logger.getLogger(CCurriculum.class
                    .getName()).log(Level.SEVERE, null, ex);
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

        } catch (SQLException ex) {
            Logger.getLogger(CCurriculum.class
                    .getName()).log(Level.SEVERE, null, ex);
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
