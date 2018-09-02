/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controls;

import beans.BBranch;
import beans.BRegarding;
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
@WebServlet(name = "CRegarding", urlPatterns = {"/CRegarding"})
public class CRegarding extends HttpServlet {

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
        String branchID = request.getParameter("reid");
        String branchname = request.getParameter("sturoll");
        String add = request.getParameter("stat");
        String email = request.getParameter("date");
        String phoneno = request.getParameter("examiid");

        HttpSession session = request.getSession(true);
        BRegarding ojb = new BRegarding();

        if (request.getParameter("btn").equals("Add")) {
            boolean rs = ojb.insertRegarding(branchID, branchname, add, email, phoneno);
            if (rs == true) {
                response.sendRedirect("Admin/regardingA.jsp");
            } else {
                out.println("<a href='Admin/regardingA.jsp'>Insert fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Save")) {
            boolean rs = ojb.updateRegarding(branchID, branchname, add, email, phoneno);
            if (rs == true) {
                response.sendRedirect("Admin/regarding.jsp?pageNum=" + request.getParameter("p"));
            } else {
                out.println("<a href='Admin/regardingA.jsp'>Edit fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Delete")) {
            boolean rs = ojb.deleteRegarding(request.getParameter("reid"));
            if (rs == true) {
                response.sendRedirect("Admin/regarding.jsp?pageNum=" + request.getParameter("p"));
            } else {
                out.println("<a href='Admin/regarding.jsp'>Delete fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Edit")) {
            String sregardingID = request.getParameter("eregardingID");
            String sstudentroll = request.getParameter("estudentroll");
            String sstatus = request.getParameter("estatus");
            String sdate = request.getParameter("edate");
            String sexamiid = request.getParameter("eexamiid");

            /////////session
            session.setAttribute("sregardingID", sregardingID);
            session.setAttribute("sstudentroll", sstudentroll);
            session.setAttribute("sstatus", sstatus);
            session.setAttribute("sdate", sdate);
            session.setAttribute("sexamiid", sexamiid);
            session.setAttribute("p", request.getParameter("p"));
            response.sendRedirect("Admin/regardingE.jsp");
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
            Logger.getLogger(CRegarding.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CRegarding.class.getName()).log(Level.SEVERE, null, ex);
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
