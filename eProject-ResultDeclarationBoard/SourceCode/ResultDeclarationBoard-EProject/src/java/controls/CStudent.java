/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controls;

import beans.BStudent;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "CStudent", urlPatterns = {"/CStudent"})
public class CStudent extends HttpServlet {

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
        String studentRollNo = request.getParameter("stuRollNo");
        String studentName = request.getParameter("stuName");
        String studentAddress = request.getParameter("stuAddress");
        String studentEmail = request.getParameter("stuEmail");
        String studentPhoneNo = request.getParameter("stuPhone");
        String studentBirthda = request.getParameter("stuBirth");
        String studentGen = request.getParameter("gender");
        String studentbraId = request.getParameter("stubraid");
        String studentclaId = request.getParameter("stuclaid");

        HttpSession session = request.getSession(true);
        BStudent ojb = new BStudent();

        if (request.getParameter("btn").equals("Add")) {
            boolean rs = ojb.insertStudent(studentRollNo, studentName, studentGen, studentAddress, studentBirthda, studentPhoneNo, studentEmail, studentbraId, studentclaId);
            if (rs == true) {
                response.sendRedirect("Admin/studentA.jsp");
            } else {
                out.println("<a href='Admin/studentA.jsp'>Insert fail back...!</a>");
            }
        }
        
        if (request.getParameter("btn").equals("Search")) {
            String search=request.getParameter("txtsearch");
            Collection co=ojb.getSearchstudentlist(search);            
            session.setAttribute("search", co);          
            response.sendRedirect("Admin/studentS.jsp");
            System.out.println(session.getAttribute("search"));
        }

        if (request.getParameter("btn").equals("Save")) {
            boolean rs = ojb.updateStudent(studentRollNo, studentName, studentGen, studentAddress, studentBirthda, studentPhoneNo, studentEmail, studentbraId, studentclaId);
            if (rs == true) {
                response.sendRedirect("Admin/student.jsp?pageNum=" + request.getParameter("p"));
            } else {
                out.println("<a href='Admin/studentE.jsp'>Edit fail back...!</a>");
            }
            out.println(studentRollNo);
            out.println(studentName);
            out.println(studentAddress);
            out.println(studentEmail);
            out.println(studentPhoneNo);
            out.println(studentBirthda);
            out.println(studentGen);
            out.println(studentbraId);
            out.println(studentclaId);
        }

        if (request.getParameter("btn").equals("Delete")) {
            boolean rs = ojb.deleteStudent(request.getParameter("sturollno"));
            if (rs == true) {
                response.sendRedirect("Admin/student.jsp?pageNum=" + request.getParameter("p"));
            } else {
                out.println("<a href='Admin/student.jsp'>Delete fail back...!</a>");
            }
        }

        if (request.getParameter("btn").equals("Edit")) {
            String sstudentRoll = request.getParameter("estudentRoll");
            String sstudentname = request.getParameter("estudentname");
            String sstudentaddress = request.getParameter("estudentaddress");
            String sstudentemail = request.getParameter("estudentemail");
            String sstudentphoneno = request.getParameter("estudentphoneno");
            String sstudentbirth = request.getParameter("estudentbirth");
            String sstudentgend = request.getParameter("estudentgend");
            String sstubranchid = request.getParameter("estubranchid");
            String sstuclassid = request.getParameter("estuclassid");

            /////////session
            session.setAttribute("sstudentRoll", sstudentRoll);
            session.setAttribute("sstudentname", sstudentname);
            session.setAttribute("sstudentaddress", sstudentaddress);
            session.setAttribute("sstudentemail", sstudentemail);
            session.setAttribute("sstudentbirth", sstudentbirth);
            session.setAttribute("sstudentphoneno", sstudentphoneno);
            session.setAttribute("sstudentgend", sstudentgend);
            session.setAttribute("sstubranchid", sstubranchid);
            session.setAttribute("sstuclassid", sstuclassid);
            session.setAttribute("p", request.getParameter("p"));
            response.sendRedirect("Admin/studentE.jsp");
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
            Logger.getLogger(CStudent.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CStudent.class.getName()).log(Level.SEVERE, null, ex);
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
