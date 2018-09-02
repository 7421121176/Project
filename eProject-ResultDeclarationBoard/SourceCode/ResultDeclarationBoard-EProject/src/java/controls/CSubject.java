/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controls;

import beans.BSubject;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "CSubject", urlPatterns = {"/CSubject"})
public class CSubject extends HttpServlet {

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
        String subjectID = request.getParameter("subId");
        String subjectName = request.getParameter("subName");

        HttpSession session = request.getSession(true);
        BSubject ojb = new BSubject();

        if (request.getParameter("btn").equals("Add")) {
            boolean rs = ojb.insertSubject(subjectID, subjectName);
            if (rs == true) {
                response.sendRedirect("Admin/subjectA.jsp");
            } else {
                out.println("<a href='Admin/subjectA.jsp'>Insert fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Register")) {
            String studentRollno = request.getParameter("student");
            String subid = session.getAttribute("jaja").toString();
            boolean rs = ojb.insertSubjectone(studentRollno, subid);
            if (rs == true) {
                Collection co = ojb.getAllstusublist(subid);
                session.setAttribute("search", co);
                response.sendRedirect("Admin/substu.jsp");
            } else {
                out.println("<a href='Admin/course_registration.jsp'>Insert fail back...!</a>");
            }
        }
        if (request.getParameter("btn").equals("Registers")) {
            String clasid = request.getParameter("class");
            String subid = session.getAttribute("jaja").toString();
            boolean rs = ojb.insertSubjectclass(clasid, subid);
            if (rs == true) {
                Collection co = ojb.getAllstusublist(subid);
                session.setAttribute("search", co);
                response.sendRedirect("Admin/substu.jsp");
            } else {
                out.println("<a href='Admin/course_registration.jsp'>Insert fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Delete")) {
            boolean rs = ojb.deleteSubject(request.getParameter("subId"));
            if (rs == true) {
                response.sendRedirect("Admin/subject.jsp?pageNum=" + request.getParameter("p"));
            } else {
                out.println("<a href='Admin/subject.jsp'>Delete fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Edit")) {
            String ssubId = request.getParameter("esubId");
            String ssubName = request.getParameter("esubName");

            /////////session
            session.setAttribute("ssubId", ssubId);
            session.setAttribute("ssubName", ssubName);
            session.setAttribute("p", request.getParameter("p"));
            response.sendRedirect("Admin/subjectE.jsp");
        }

        if (request.getParameter("btn").equals("Substu")) {
            String search = request.getParameter("subId");
            session.setAttribute("jaja", search);
//            out.print(session.getAttribute("kaka"));
            Collection co = ojb.getAllstusublist(search);
            session.setAttribute("search", co);
            response.sendRedirect("Admin/substu.jsp");
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
            Logger.getLogger(CSubject.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CSubject.class.getName()).log(Level.SEVERE, null, ex);
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
