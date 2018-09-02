/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;

/**
 *
 * @author DELL
 */
public class BExamination {

    private Collection allexaminationlist;
    private Collection allexaminationjoinlist;
    private Collection allexaminationjoinlist2;
    /*DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");    
     DateFormat timeFormat = new SimpleDateFormat("hh:mm:ss a");*/

    public BExamination() {
    }

    public boolean insertExamination(String examinationID, String subjectID, String examinationdate, String examinationtime, String examFee, String examStartdate, String examEnddate) {
        try {
            GetConnect ojb = new GetConnect();
            Connection con = ojb.getconnection();
            String sql = "insert into [tb_Examination](Exam_Id, Sub_Id, Exam_Date, Exam_Time, Exam_Fee, Exam_StartDate, Exam_EndDate) values(?,?,?,?,?,?,?)";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, examinationID);
            stm.setString(2, subjectID);
            stm.setString(3, examinationdate);
            stm.setString(4, examinationtime);
            stm.setString(5, examFee);
            stm.setString(6, examStartdate);
            stm.setString(7, examEnddate);

            int result = stm.executeUpdate();
            stm.close();
            con.close();
            if (result > 0) {
                return true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean updateExamination(String examinationID, String subjectID, String examinationdate, String examinationtime, String examFee, String examStartdate, String examEnddate) {
        try {
            GetConnect ojb = new GetConnect();
            Connection con = ojb.getconnection();
            String sql = " update [tb_Examination] SET Sub_Id=?,Exam_Date=?,Exam_Time=?,Exam_Fee=?,Exam_StartDate=?,Exam_EndDate =? WHERE Exam_Id = ?";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, subjectID);
            stm.setString(2, examinationdate);
            stm.setString(3, examinationtime);
            stm.setString(4, examFee);
            stm.setString(5, examStartdate);
            stm.setString(6, examEnddate);
            stm.setString(7, examinationID);

            int result = stm.executeUpdate();
            stm.close();
            con.close();
            if (result > 0) {
                return true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean updateExamCheck(String examinationID) {
        try {
            GetConnect ojb = new GetConnect();
            Connection con = ojb.getconnection();
            String sql = " update [tb_Examination] SET Exam_Status= ? WHERE Exam_Id = ?";//"insert into [Users](UserName) values('"+userName+"')"
            String sql2 = "select Exam_Status from [tb_Examination] WHERE Exam_Id = ?";
            PreparedStatement stm2 = con.prepareStatement(sql2);
            stm2.setString(1, examinationID);
            ResultSet rs2 = stm2.executeQuery();
            PreparedStatement stm = con.prepareStatement(sql);
            while (rs2.next()) {
                System.out.println(rs2.getString("Exam_Status"));
                if (rs2.getString("Exam_Status").equals("0")) {
                    stm.setString(1, "True");
                } else {
                    stm.setString(1, "False");
                }
            }
            stm.setString(2, examinationID);
            int result = stm.executeUpdate();
            stm.close();
            stm2.close();
            con.close();
            if (result > 0) {
                return true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean deleteExamination(String examinationID) throws SQLException {
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "Delete from [tb_Examination] where Exam_Id=?";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, examinationID);
            int result = stm.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Collection getAllexaminationlist() throws SQLException {
        allexaminationlist = new ArrayList();
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "select * from [tb_Examination]";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Examination ls = new Examination();
                ls.setExam_Id(rs.getString("Exam_Id"));
                ls.setSub_Id(rs.getString("Sub_Id"));
                ls.setExam_Date(rs.getString("Exam_Date"));
                ls.setExam_Time(rs.getString("Exam_Time"));
                ls.setExam_Fee(rs.getString("Exam_Fee"));
                ls.setExam_StartDate(rs.getString("Exam_StartDate"));
                ls.setExam_EndDate(rs.getString("Exam_EndDate"));
                ls.setExam_Status(rs.getString("Exam_Status"));

                allexaminationlist.add(ls);
            }

            rs.close();
            con.close();
            return allexaminationlist;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Collection getAllexaminationjoinlist() throws SQLException {
        allexaminationjoinlist = new ArrayList();
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "select a.*,  b.* from [tb_Examination] as a INNER JOIN tb_Subject as b ON a.Sub_Id = b.Sub_Id and a.Exam_Status='True'";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Examination ls = new Examination();
                ls.setExam_Id(rs.getString("Exam_Id"));
                ls.setSub_Id(rs.getString("Sub_Id"));
                String Exam_Date = (rs.getDate("Exam_Date")).toString();
                ls.setExam_Date(Exam_Date);
                String Exam_Time = (rs.getTime("Exam_Time")).toString();
                ls.setExam_Time(Exam_Time);
                ls.setExam_Fee(rs.getString("Exam_Fee"));
                String Exam_StartDate = (rs.getDate("Exam_StartDate")).toString();
                ls.setExam_StartDate(Exam_StartDate);
                String Exam_EndDate = (rs.getDate("Exam_EndDate")).toString();
                ls.setExam_EndDate(Exam_EndDate);
                ls.setExam_Status(rs.getString("Exam_Status"));
                ls.setSub_Name(rs.getString("Sub_Name"));

                allexaminationjoinlist.add(ls);
            }
            rs.close();
            con.close();
            return allexaminationjoinlist;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
     public Collection getAllexaminationjoinlist2() throws SQLException {
        allexaminationjoinlist2 = new ArrayList();
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "select a.*,  b.* from [tb_Examination] as a INNER JOIN tb_Subject as b ON a.Sub_Id = b.Sub_Id";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Examination ls = new Examination();
                ls.setExam_Id(rs.getString("Exam_Id"));
                ls.setSub_Id(rs.getString("Sub_Id"));
                String Exam_Date = (rs.getDate("Exam_Date")).toString();
                ls.setExam_Date(Exam_Date);
                String Exam_Time = (rs.getTime("Exam_Time")).toString();
                ls.setExam_Time(Exam_Time);
                ls.setExam_Fee(rs.getString("Exam_Fee"));
                String Exam_StartDate = (rs.getDate("Exam_StartDate")).toString();
                ls.setExam_StartDate(Exam_StartDate);
                String Exam_EndDate = (rs.getDate("Exam_EndDate")).toString();
                ls.setExam_EndDate(Exam_EndDate);
                ls.setExam_Status(rs.getString("Exam_Status"));
                ls.setSub_Name(rs.getString("Sub_Name"));

                allexaminationjoinlist2.add(ls);
            }
            rs.close();
            con.close();
            return allexaminationjoinlist2;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
