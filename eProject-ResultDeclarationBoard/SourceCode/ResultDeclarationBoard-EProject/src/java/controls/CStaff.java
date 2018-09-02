/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controls;

import beans.BStaff;
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
@WebServlet(name = "CStaff", urlPatterns = {"/CStaff"})
public class CStaff extends HttpServlet {

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
        String staffID = request.getParameter("staffId");
        String staffName = request.getParameter("staffName");
        String staffAddress = request.getParameter("staffAddress");
        String staffEMail = request.getParameter("staffEmail");
        String staffPhoneNo = request.getParameter("staffPhone");
        String staffBirthday = request.getParameter("staffBirth");
        String staffGender = request.getParameter("gender");
        String staffSDate = request.getParameter("staffDate");
        String staffbraID = request.getParameter("stabraid");
        String staffsStatus = request.getParameter("staffStatus");
        if (staffsStatus == null) {
            staffsStatus = "a";
        }

        HttpSession session = request.getSession(true);
        BStaff ojb = new BStaff();

        if (request.getParameter("btn").equals("Add")) {
            boolean rs = ojb.insertStaff(staffID, staffID, staffName, staffAddress, staffBirthday, staffPhoneNo, staffEMail, staffGender, "que00", "KINGSTONE ACADEMIC", staffSDate, staffsStatus, staffbraID);
            if (rs == true) {
                response.sendRedirect("Admin/staffA.jsp");
            } else {
                out.println("<a href='Admin/staffA.jsp'>Insert fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Confirm")) {
            String staffroleID = request.getParameter("staffroleid");
            boolean rs = ojb.updateRole(staffID, staffroleID);
            if (rs == true) {
                String search = session.getAttribute("haha").toString();
                Collection co = ojb.getStaffRole(search);
                session.setAttribute("staffRole", co);
                response.sendRedirect("Admin/staffR.jsp");
            } else {
                out.println("<a href='Admin/staffR.jsp'>Update fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Save")) {
            boolean rs = ojb.updateStaff(staffID, staffName, staffAddress, staffBirthday, staffPhoneNo, staffEMail, staffGender, staffsStatus, staffbraID);
            if (rs == true) {
                response.sendRedirect("Admin/staff.jsp?pageNum=" + request.getParameter("p"));
            } else {
                out.println("<a href='Admin/staffE.jsp'>Edit fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Delete")) {
            boolean rs = ojb.deleteStaff(request.getParameter("staffId"));
            if (rs == true) {
                response.sendRedirect("Admin/staff.jsp?pageNum=" + request.getParameter("p"));
            } else {
                out.println("<a href='Admin/staff.jsp'>Delete fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("EditRole")) {
            String search = request.getParameter("eestaffID");
            session.setAttribute("haha", search);
//            out.print(session.getAttribute("kaka"));
            Collection co = ojb.getStaffRole(search);
            session.setAttribute("staffRole", co);
            response.sendRedirect("Admin/staffR.jsp");
        }

        if (request.getParameter("btn").equals("Edit")) {
            String sstaffID = request.getParameter("estaffID");
            String sstaffname = request.getParameter("estaffname");
            String sstaffaddr = request.getParameter("estaffaddr");
            String sstaffmail = request.getParameter("estaffmail");
            String sstaffphone = request.getParameter("estaffphone");
            String sstaffbirth = request.getParameter("estaffbirth");
            String sstaffgen = request.getParameter("estaffgen");
            String sstaffstartd = request.getParameter("estaffstartd");
            String sstaffbraid = request.getParameter("estaffbraid");
            String sstaffstatus = request.getParameter("estaffstatus");

            /////////session
            session.setAttribute("sstaffID", sstaffID);
            session.setAttribute("sstaffname", sstaffname);
            session.setAttribute("sstaffaddr", sstaffaddr);
            session.setAttribute("sstaffmail", sstaffmail);
            session.setAttribute("sstaffphone", sstaffphone);
            session.setAttribute("sstaffbirth", sstaffbirth);
            session.setAttribute("sstaffgen", sstaffgen);
            session.setAttribute("sstaffstartd", sstaffstartd);
            session.setAttribute("sstaffbraid", sstaffbraid);
            session.setAttribute("sstaffstatus", sstaffstatus);
            session.setAttribute("p", request.getParameter("p"));
            response.sendRedirect("Admin/staffE.jsp");
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
            Logger.getLogger(CStaff.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CStaff.class.getName()).log(Level.SEVERE, null, ex);
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
