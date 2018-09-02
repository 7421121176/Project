/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controls;

import beans.BExamination;
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
@WebServlet(name = "CExamination", urlPatterns = {"/CExamination"})
public class CExamination extends HttpServlet {

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
        String examId = request.getParameter("examId");
        String subject = request.getParameter("subject");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String fee = request.getParameter("fee");
        String regadingDate = request.getParameter("regadingDate");
        String regardingDeadline = request.getParameter("regardingDeadline");

        HttpSession session = request.getSession(true);
        BExamination ojb = new BExamination();

        if (request.getParameter("btn").equals("Add")) {
            boolean rs = ojb.insertExamination(examId, subject, date, time, fee, regadingDate, regardingDeadline);
            if (rs == true) {
                response.sendRedirect("Admin/examinationA.jsp");
            } else {
                out.println("<a href='Admin/examinationA.jsp'>Insert fail back...!</a>");
            }
        }
        
        if (request.getParameter("btn").equals("CheckMark")) {              
            String search = request.getParameter("mexamid");
            boolean rs = ojb.updateExamCheck(search);
            if (rs == true) {                
                response.sendRedirect("Admin/examination.jsp?pageNum=" + request.getParameter("p"));
            } else {
                out.println("<a href='Admin/examinationE.jsp'>Edit fail back...!</a>");
            }
        }
        
        if (request.getParameter("btn").equals("Save")) {
            boolean rs = ojb.updateExamination(examId, subject, date, time, fee, regadingDate, regardingDeadline);
            if (rs == true) {
                response.sendRedirect("Admin/examination.jsp?pageNum=" + request.getParameter("p"));
            } else {
                out.println("<a href='Admin/examinationE.jsp'>Edit fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Delete")) {
            boolean rs = ojb.deleteExamination(request.getParameter("examId"));
            if (rs == true) {
                response.sendRedirect("Admin/examination.jsp?pageNum=" + request.getParameter("p"));
            } else {
                out.println("<a href='Admin/examination.jsp'>Delete fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Edit")) {
            String sexamId = request.getParameter("eexamId");
            String ssubId = request.getParameter("esubId");
            String sexamDate = request.getParameter("eexamDate");
            String sexamTime = request.getParameter("eexamTime");
            String sexamFee = request.getParameter("eexamFee");
            String sexamStartDate = request.getParameter("eexamStartDate");
            String sexamEndDate = request.getParameter("eexamEndDate");

            /////////session
            session.setAttribute("sexamId", sexamId);
            session.setAttribute("ssubId", ssubId);
            session.setAttribute("sexamDate", sexamDate);
            session.setAttribute("sexamTime", sexamTime);
            session.setAttribute("sexamFee", sexamFee);
            session.setAttribute("sexamStartDate", sexamStartDate);
            session.setAttribute("sexamEndDate", sexamEndDate);
            session.setAttribute("p", request.getParameter("p"));
            response.sendRedirect("Admin/examinationE.jsp");
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
            Logger.getLogger(CExamination.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CExamination.class.getName()).log(Level.SEVERE, null, ex);
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
