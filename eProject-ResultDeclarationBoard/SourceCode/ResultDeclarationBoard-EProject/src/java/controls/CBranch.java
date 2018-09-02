/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controls;

import beans.BBranch;
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
@WebServlet(name = "CBranch", urlPatterns = {"/CBranch"})
public class CBranch extends HttpServlet {

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
        String branchID = request.getParameter("braid");
        String branchname = request.getParameter("braname");
        String add = request.getParameter("braaddress");
        String email = request.getParameter("braemail");
        String phoneno = request.getParameter("braphone");

        HttpSession session = request.getSession(true);
        BBranch ojb = new BBranch();

        if (request.getParameter("btn").equals("Add")) {
            boolean rs = ojb.insertBranch(branchID, branchname, add, email, phoneno);
            if (rs == true) {
                response.sendRedirect("Admin/branchA.jsp");
            } else {
                out.println("<a href='Admin/branchA.jsp'>Insert fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Save")) {
            boolean rs = ojb.updateBranch(branchID, branchname, add, email, phoneno);
            if (rs == true) {
                response.sendRedirect("Admin/branch.jsp?pageNum=" + request.getParameter("p"));
            } else {
                out.println("<a href='Admin/branchE.jsp'>Edit fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Delete")) {
            boolean rs = ojb.deleteBranch(request.getParameter("braid"));
            if (rs == true) {
                response.sendRedirect("Admin/branch.jsp?pageNum=" + request.getParameter("p"));
            } else {
                out.println("<a href='Admin/branch.jsp'>Delete fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Edit")) {
            String sbranchID = request.getParameter("ebranchID");
            String sbranchname = request.getParameter("ebranchname");
            String saddress = request.getParameter("eaddress");
            String semail = request.getParameter("eemail");
            String sphoneno = request.getParameter("ephoneno");

            /////////session
            session.setAttribute("sbranchID", sbranchID);
            session.setAttribute("sbranchname", sbranchname);
            session.setAttribute("saddress", saddress);
            session.setAttribute("semail", semail);
            session.setAttribute("sphoneno", sphoneno);
            session.setAttribute("p", request.getParameter("p"));
            response.sendRedirect("Admin/branchE.jsp");
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
            Logger.getLogger(CBranch.class
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
            Logger.getLogger(CBranch.class
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
