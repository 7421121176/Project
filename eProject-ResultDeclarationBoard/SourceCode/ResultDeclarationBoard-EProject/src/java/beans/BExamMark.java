package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author DELL
 */
public class BExamMark {

    private Collection listfull;    
    private Collection listfullwithexam;
    private Collection allexammarklist;

    public BExamMark() {
    }

    /*public boolean insertBranch(String branchID, String branchname, String address, String email, String phoneno){
     try{
     GetConnect ojb=new GetConnect();
     Connection con=ojb.getconnection();
     String sql="insert into [tb_Branch](Bra_Id, Bra_Name, Bra_Address, Bra_Email, Bra_Phone) values(?,?,?,?,?)";//"insert into [Users](UserName) values('"+userName+"')"
     PreparedStatement stm=con.prepareStatement(sql);
     stm.setString(1, branchID);
     stm.setString(2, branchname);
     stm.setString(3, address);
     stm.setString(4, email);
     stm.setString(5, phoneno);     
            
     int result=stm.executeUpdate();
     stm.close();
     con.close();
     if(result>0)
     return true;
     } catch (Exception ex){
     ex.printStackTrace();
     }
     return false;
     }
    
     public boolean updateBranch(String branchID, String branchname, String address, String email, String phoneno){
     try{
     GetConnect ojb=new GetConnect();
     Connection con=ojb.getconnection();
     String sql="UPDATE [tb_Branch] SET Bra_Name = ?, Bra_Address= ?, Bra_Email= ?, Bra_Phone= ? WHERE Bra_Id = ?";//"insert into [Users](UserName) values('"+userName+"')"
     PreparedStatement stm=con.prepareStatement(sql);
     stm.setString(1, branchname);
     stm.setString(2, address);
     stm.setString(3, email);
     stm.setString(4, phoneno);                
     stm.setString(5, branchID);
            
     int result=stm.executeUpdate();
     stm.close();
     con.close();
     if(result>0)
     return true;
     } catch (Exception ex){
     ex.printStackTrace();
     }
     return false;
     }
    
     public boolean deleteBranch(String BranchId) throws SQLException{
     GetConnect ojb=new GetConnect();
     Connection con=ojb.getconnection();
     String sql="Delete from [tb_Branch] where Bra_Id=?";
        
     try{
     PreparedStatement stm=con.prepareStatement(sql);
     stm.setString(1, BranchId);
     int result=stm.executeUpdate();
     if(result>0)
     return true;
     }catch(Exception ex){
     ex.printStackTrace();
     }
     return false;
     }*/
    public boolean insertupdate(String mark, String studentRollno, String exam_Id, String staff_Id) throws SQLException {
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "select * from tb_ExamMark where Stu_RollNo = ? and Exam_Id = ?";
        String sql2 = "insert into [tb_ExamMark](Mark, Stu_RollNo, Exam_Id, Staff_Id) values(?,?,?,?)";
        String sql3 = "UPDATE [tb_ExamMark] SET Mark = ? WHERE Stu_RollNo = ? and Exam_Id = ?";
        int size = 0;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, studentRollno);
            stm.setString(2, exam_Id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                size = rs.getRow();
            }
            rs.close();
//            System.out.println(mark);
//            System.out.println(studentRollno);
//            System.out.println(exam_Id);
//            System.out.println(staff_Id);
//            System.out.println(size);
            if (size == 0) {
                PreparedStatement stm2 = con.prepareStatement(sql2);
                stm2.setString(1, mark);
                stm2.setString(2, studentRollno);
                stm2.setString(3, exam_Id);
                stm2.setString(4, staff_Id);
                int result2 = stm2.executeUpdate();
                stm2.close();
                con.close();
                if (result2 > 0) {
                    return true;
                }
            } else {
                PreparedStatement stm3 = con.prepareStatement(sql3);
                stm3.setString(1, mark);
                stm3.setString(2, studentRollno);
                stm3.setString(3, exam_Id);
                int result3 = stm3.executeUpdate();
                stm3.close();
                con.close();
                if (result3 > 0) {
                    return true;
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Collection getAllexammarklist(String ExamId) throws SQLException {
        allexammarklist = new ArrayList();
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "Select stdsub.Stu_RollNo from tb_StudentSubject stdsub ,tb_Subject sub, tb_Examination ex   where  stdsub.Sub_Id=sub.Sub_Id and ex.Sub_Id=sub.Sub_Id and ex.Exam_Id=?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, ExamId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ExamMark ls = new ExamMark();
                ls.setStu_RollNo(rs.getString("Stu_RollNo"));
                allexammarklist.add(ls);
            }

            rs.close();
            con.close();
            return allexammarklist;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Collection getListfull() throws SQLException {
        listfull = new ArrayList();
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        try {
            String sql = "select a.Mark, b.Stu_RollNo, b.Stu_Name, b.Stu_Birth, b.Stu_Gender, b.Cla_Id, c.Sub_Name, d.Exam_Date, d.Exam_StartDate, d.Exam_EndDate, d.Exam_Fee from tb_ExamMark as a INNER JOIN tb_Student as b on a.Stu_RollNo = b.Stu_RollNo INNER JOIN tb_Examination as d on a.Exam_Id = d.Exam_Id INNER JOIN tb_Subject as c on c.Sub_Id = d.Sub_Id";
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                BResult fullexam = new BResult();
                fullexam.setMark(rs.getFloat("Mark"));
                fullexam.setStu_RollNo(rs.getString("Stu_RollNo"));
                fullexam.setStu_Name(rs.getString("Stu_Name"));
                fullexam.setStu_Birth(rs.getString("Stu_Birth"));
                fullexam.setStu_Gender(rs.getString("Stu_Gender"));
                fullexam.setCla_Id(rs.getString("Cla_Id"));
                fullexam.setSub_Name(rs.getString("Sub_Name"));
                fullexam.setExam_Date(rs.getString("Exam_Date"));
                fullexam.setExam_StartDate(rs.getString("Exam_StartDate"));
                fullexam.setExam_EndDate(rs.getString("Exam_EndDate"));
                fullexam.setExam_Fee(rs.getFloat("Exam_Fee"));
//                System.out.println(rs.getFloat("Mark"));
//                System.out.println(rs.getString("Stu_RollNo"));
//                System.out.println(rs.getString("Stu_Name"));
//                System.out.println(rs.getString("Stu_Birth"));
//                System.out.println(rs.getString("Stu_Gender"));
//                System.out.println(rs.getString("Cla_Id"));
//                System.out.println(rs.getString("Sub_Name"));
//                System.out.println(rs.getString("Exam_Date"));
//                System.out.println(rs.getString("Exam_StartDate"));
//                System.out.println(rs.getString("Exam_EndDate"));
//                System.out.println(rs.getFloat("Exam_Fee"));
                listfull.add(fullexam);
            }
            rs.close();
            con.close();
            return listfull;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
     public Collection getListfullwithexam(String ExamId) throws SQLException {
        listfullwithexam = new ArrayList();
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        try {
            String sql = "select a.Mark, b.Stu_RollNo, b.Stu_Name, b.Stu_Birth, b.Stu_Gender, b.Cla_Id, c.Sub_Name, d.Exam_Date, d.Exam_StartDate, d.Exam_EndDate, d.Exam_Fee from tb_ExamMark as a INNER JOIN tb_Student as b on a.Stu_RollNo = b.Stu_RollNo INNER JOIN tb_Examination as d on a.Exam_Id = d.Exam_Id INNER JOIN tb_Subject as c on c.Sub_Id = d.Sub_Id where a.Exam_Id=?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, ExamId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                BResult fullexam = new BResult();
                fullexam.setMark(rs.getFloat("Mark"));
                fullexam.setStu_RollNo(rs.getString("Stu_RollNo"));
                fullexam.setStu_Name(rs.getString("Stu_Name"));
                fullexam.setStu_Birth(rs.getString("Stu_Birth"));
                fullexam.setStu_Gender(rs.getString("Stu_Gender"));
                fullexam.setCla_Id(rs.getString("Cla_Id"));
                fullexam.setSub_Name(rs.getString("Sub_Name"));
                fullexam.setExam_Date(rs.getString("Exam_Date"));
                fullexam.setExam_StartDate(rs.getString("Exam_StartDate"));
                fullexam.setExam_EndDate(rs.getString("Exam_EndDate"));
                fullexam.setExam_Fee(rs.getFloat("Exam_Fee"));
//                System.out.println(rs.getFloat("Mark"));
//                System.out.println(rs.getString("Stu_RollNo"));
//                System.out.println(rs.getString("Stu_Name"));
//                System.out.println(rs.getString("Stu_Birth"));
//                System.out.println(rs.getString("Stu_Gender"));
//                System.out.println(rs.getString("Cla_Id"));
//                System.out.println(rs.getString("Sub_Name"));
//                System.out.println(rs.getString("Exam_Date"));
//                System.out.println(rs.getString("Exam_StartDate"));
//                System.out.println(rs.getString("Exam_EndDate"));
//                System.out.println(rs.getFloat("Exam_Fee"));
                listfullwithexam.add(fullexam);
            }
            rs.close();
            con.close();
            return listfullwithexam;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
