/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controls;

import beans.BNotification;
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
@WebServlet(name = "CNotification", urlPatterns = {"/CNotification"})
public class CNotification extends HttpServlet {

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
        String notificationID = request.getParameter("notiid");
        String notificationtitle = request.getParameter("notiti");
        String notiinformation = request.getParameter("notiinfo");
        String notidate = request.getParameter("notidate");
        String notistaffID = request.getParameter("notistaffid");

        HttpSession session = request.getSession(true);
        BNotification ojb = new BNotification();

        if (request.getParameter("btn").equals("Add")) {
            boolean rs = ojb.insertNotification(notificationID, notificationtitle, notiinformation, notistaffID);
            if (rs == true) {
                response.sendRedirect("Admin/notificationA.jsp");
            } else {
                out.println("<a href='Admin/notificationA.jsp'>Insert fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Save")) {
            boolean rs = ojb.updateNotification(notificationID, notificationtitle, notiinformation);
            if (rs == true) {
                response.sendRedirect("Admin/notification.jsp?pageNum=" + request.getParameter("p"));
            } else {
                out.println("<a href='Admin/notificationE.jsp'>Edit fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Delete")) {
            boolean rs = ojb.deleteNotification(request.getParameter("notiid"));
            if (rs == true) {
                response.sendRedirect("Admin/notification.jsp?pageNum=" + request.getParameter("p"));
            } else {
                out.println("<a href='Admin/notification.jsp'>Delete fail back...!</a>");
            }
        }
        if (request.getParameter("btn").equals("Edit")) {
            String snotifiID = request.getParameter("enotifiID");
            String snotifiTitle = request.getParameter("enotifiTitle");
            String snotifiInfo = request.getParameter("enotifiInfo");
            String snotifiDate = request.getParameter("enotifiDate");
            String snotifistaffid = request.getParameter("enotifistaffid");

            /////////session
            session.setAttribute("snotifiID", snotifiID);
            session.setAttribute("snotifiTitle", snotifiTitle);
            session.setAttribute("snotifiInfo", snotifiInfo);
            session.setAttribute("snotifiDate", snotifiDate);
            session.setAttribute("snotifistaffid", snotifistaffid);
            session.setAttribute("p", request.getParameter("p"));
            response.sendRedirect("Admin/notificationE.jsp");
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
            Logger.getLogger(CNotification.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CNotification.class.getName()).log(Level.SEVERE, null, ex);
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
