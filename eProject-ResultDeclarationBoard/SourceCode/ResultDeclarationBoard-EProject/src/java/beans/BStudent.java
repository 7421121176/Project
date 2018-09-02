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
import java.util.ArrayList;
import java.util.Collection;

/**
 *
 * @author DELL
 */
public class BStudent {

    private Collection allstudentlist;
    private Collection allstudentjoinlist;
    private Collection searchstudentlist;

    public BStudent() {
    }

    public boolean insertStudent(String studentRollNo, String studentname, String studentgender, String studentaddre, String studentbirth, String studentphoneno, String studentEmail, String branchid, String classid) {
        try {
            GetConnect ojb = new GetConnect();
            Connection con = ojb.getconnection();
            String sql = "Insert INTO [tb_Student](Stu_RollNo, Stu_Name,Stu_Gender,Stu_Address,Stu_Birth,Stu_Phone,Stu_Email,Bra_Id,Cla_Id) Values(?,?,?,?,?,?,?,?,?)";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, studentRollNo);
            stm.setString(2, studentname);
            stm.setString(3, studentgender);
            stm.setString(4, studentaddre);
            stm.setString(5, studentbirth);
            stm.setString(6, studentphoneno);
            stm.setString(7, studentEmail);
            stm.setString(8, branchid);
            stm.setString(9, classid);

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

    public boolean updateStudent(String studentRollNo, String studentname, String studentgender, String studentaddre, String studentbirth, String studentphoneno, String studentEmail, String branchid, String classid) {
        try {
            GetConnect ojb = new GetConnect();
            Connection con = ojb.getconnection();
            String sql = "UPDATE [tb_Student] SET Stu_Name=?,Stu_Gender=?,Stu_Address=?,Stu_Birth=?,Stu_Phone=?,Stu_Email=?,Bra_Id=?,Cla_Id=? WHERE Stu_RollNo= ?";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, studentname);
            if (studentgender.equals("Male")) {
                stm.setString(2, "true");
            } else {
                stm.setString(2, "false");
            }
            stm.setString(3, studentaddre);
            stm.setString(4, studentbirth);
            stm.setString(5, studentphoneno);
            stm.setString(6, studentEmail);
            stm.setString(7, branchid);
            stm.setString(8, classid);
            stm.setString(9, studentRollNo);

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

    public boolean deleteStudent(String studentRollNo) throws SQLException {
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "Delete from [tb_Student] where Stu_RollNo=?";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, studentRollNo);
            int result = stm.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Collection getAllstudentlist() throws SQLException {
        allstudentlist = new ArrayList();
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "select * from [tb_Student]";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Student ls = new Student();
                ls.setStu_RollNo(rs.getString("Stu_RollNo"));
                ls.setStu_Name(rs.getString("Stu_Name"));
                ls.setStu_Gender(rs.getString("Stu_Gender"));
                ls.setStu_Address(rs.getString("Stu_Address"));
                ls.setStu_Birth(rs.getString("Stu_Birth"));
                ls.setStu_Phone(rs.getString("Stu_Phone"));
                ls.setStu_Email(rs.getString("Stu_Email"));
                ls.setBra_Id(rs.getString("Bra_Id"));
                ls.setCla_Id(rs.getString("Cla_Id"));

                allstudentlist.add(ls);
            }

            rs.close();
            con.close();
            return allstudentlist;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Collection getAllstudentjoinlist() throws SQLException {
        allstudentjoinlist = new ArrayList();
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "select a.*,  b.*, c.* from [tb_Student] as a INNER JOIN tb_Branch as b ON a.Bra_Id = b.Bra_Id  INNER JOIN tb_Class as c ON a.Cla_Id = c.Cla_Id ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Student ls = new Student();
                ls.setStu_RollNo(rs.getString("Stu_RollNo"));
                ls.setStu_Name(rs.getString("Stu_Name"));
                ls.setStu_Gender(rs.getString("Stu_Gender"));
                ls.setStu_Address(rs.getString("Stu_Address"));
                ls.setStu_Birth(rs.getString("Stu_Birth"));
                ls.setStu_Phone(rs.getString("Stu_Phone"));
                ls.setStu_Email(rs.getString("Stu_Email"));
                ls.setBra_Id(rs.getString("Bra_Id"));
                ls.setCla_Id(rs.getString("Cla_Id"));
                ls.setBra_Name(rs.getString("Bra_Name"));
                ls.setCla_Name(rs.getString("Cla_Name"));
                allstudentjoinlist.add(ls);
            }
            rs.close();
            con.close();
            return allstudentjoinlist;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public Collection getSearchstudentlist(String studentRollNo) throws SQLException {
        searchstudentlist = new ArrayList();
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "select a.*,  b.*, c.* from [tb_Student] as a INNER JOIN tb_Branch as b ON a.Bra_Id = b.Bra_Id  INNER JOIN tb_Class as c ON a.Cla_Id = c.Cla_Id and a.Stu_RollNo like ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);            
            stm.setString(1, "%" + studentRollNo + "%");
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Student ls = new Student();
                ls.setStu_RollNo(rs.getString("Stu_RollNo"));
                ls.setStu_Name(rs.getString("Stu_Name"));
                ls.setStu_Gender(rs.getString("Stu_Gender"));
                ls.setStu_Address(rs.getString("Stu_Address"));
                ls.setStu_Birth(rs.getString("Stu_Birth"));
                ls.setStu_Phone(rs.getString("Stu_Phone"));
                ls.setStu_Email(rs.getString("Stu_Email"));
                ls.setBra_Name(rs.getString("Bra_Name"));
                ls.setCla_Name(rs.getString("Cla_Name"));

                searchstudentlist.add(ls);
            }

            rs.close();
            con.close();
            return searchstudentlist;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
