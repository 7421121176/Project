/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controls;

import beans.BExamMark;
import beans.GetConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
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
@WebServlet(name = "CExamMark", urlPatterns = {"/CExamMark"})
public class CExamMark extends HttpServlet {

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

        HttpSession session = request.getSession(true);
        BExamMark ojb = new BExamMark();

        if (request.getParameter("btn").equals("Mark")) {
            String search = request.getParameter("mexamid");
            session.setAttribute("kaka", search);
//            out.print(session.getAttribute("kaka"));
            Collection co = ojb.getAllexammarklist(search);
            session.setAttribute("search", co);
            response.sendRedirect("Admin/mark.jsp");
        }

        if (request.getParameter("btn").equals("MarkMem")) {
            String search = request.getParameter("mexamid");
            session.setAttribute("kaka", search);
            Collection co = ojb.getListfullwithexam(search);
            session.setAttribute("search", co);
            response.sendRedirect("mark.jsp");
        }
        
        if (request.getParameter("btn").equals("AddSave")) {
            String mamsturollno = request.getParameter("sturollnum");
            String marka = request.getParameter("markmark");
            session.setAttribute("mamsturollno", mamsturollno);
            session.setAttribute("marka", marka);
            response.sendRedirect("Admin/markA.jsp");
        }

        if (request.getParameter("btn").equals("Save")) {
            String luusturoll = request.getParameter("studrolno");
            String luumark = request.getParameter("makra");
            String luustaffid = session.getAttribute("login").toString();
            String luuexamid = session.getAttribute("kaka").toString();
            boolean rs = ojb.insertupdate(luumark, luusturoll, luuexamid, luustaffid);
            if (rs == true) {
                session.setAttribute("login", luustaffid);
                Collection co = ojb.getAllexammarklist(luuexamid);
                session.setAttribute("search", co);
                response.sendRedirect("Admin/mark.jsp");
            } else {
                out.println("<a href='Admin/mark.jsp'>Fail back...!</a>");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CExamMark.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CExamMark.class.getName()).log(Level.SEVERE, null, ex);
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
