/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controls;

import beans.BClass;
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
@WebServlet(name = "CClass", urlPatterns = {"/CClass"})
public class CClass extends HttpServlet {

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
        String classID = request.getParameter("claid");
        String classname = request.getParameter("claname");
        String clacurid = request.getParameter("clacurid");

        HttpSession session = request.getSession(true);
        BClass ojb = new BClass();

        if (request.getParameter("btn").equals("Add")) {
            boolean rs = ojb.insertClass(classID, classname, clacurid);
            if (rs == true) {
                response.sendRedirect("Admin/classA.jsp");
            } else {
                out.println("<a href='Admin/classA.jsp'>Insert fail back...!</a>");
            }
        }
        
        if (request.getParameter("btn").equals("Save")) {
            boolean rs = ojb.updateClass(classID, classname, clacurid);
            if (rs == true) {
                response.sendRedirect("Admin/class.jsp?pageNum=" + request.getParameter("p"));
            } else {
                out.println("<a href='Admin/classE.jsp'>Edit fail back...!</a>");
            }
        }
        
        if (request.getParameter("btn").equals("Delete")) {
            boolean rs = ojb.deleteClass(request.getParameter("claid"));
            if (rs == true) {
                response.sendRedirect("Admin/class.jsp?pageNum=" + request.getParameter("p"));
            } else {
                out.println("<a href='Admin/class.jsp'>Delete fail back...!</a>");
            }
        }
        
        if (request.getParameter("btn").equals("Edit")) {
            String sclassID = request.getParameter("eclassID");
            String sclassname = request.getParameter("eclassname");
            String sclacurid = request.getParameter("eclacurid");

            /////////session
            session.setAttribute("sclassID", sclassID);
            session.setAttribute("sclassname", sclassname);
            session.setAttribute("sclacurid", sclacurid);            
            session.setAttribute("p", request.getParameter("p"));
            response.sendRedirect("Admin/classE.jsp");
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
            Logger.getLogger(CClass.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CClass.class.getName()).log(Level.SEVERE, null, ex);
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
