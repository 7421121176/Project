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
public class BSubject {

    private Collection allsubjectlist;
    private Collection allstusublist;

    public BSubject() {
    }

    public boolean insertSubject(String subID, String subname) {
        try {
            GetConnect ojb = new GetConnect();
            Connection con = ojb.getconnection();
            String sql = "insert into [tb_Subject](Sub_Id, Sub_Name) values(?,?)";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, subID);
            stm.setString(2, subname);

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

    public boolean insertSubjectone(String stuRollNo, String subId) {
        try {
            GetConnect ojb = new GetConnect();
            Connection con = ojb.getconnection();
            String sql = "insert into [tb_StudentSubject](Stu_RollNo, Sub_Id) values(?,?)";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, stuRollNo);
            stm.setString(2, subId);

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

    public boolean insertSubjectclass(String claId, String subId) {
        try {
            GetConnect ojb = new GetConnect();
            Connection con = ojb.getconnection();
            String sql = "select * from tb_Student where Cla_Id=?";//"insert into [Users](UserName) values('"+userName+"')"
            String sql2 = "insert into [tb_StudentSubject](Stu_RollNo, Sub_Id) values(?,?)";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, claId);
            ResultSet rs = stm.executeQuery();
            int result = 0;
            PreparedStatement stm2;
            while (rs.next()) {
                stm2 = con.prepareStatement(sql2);
                stm2.setString(1, rs.getString("Stu_RollNo"));
                stm2.setString(2, subId);        
                stm2.executeUpdate();
                stm2.close();
                result++;
            }
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

    public boolean updateSubject(String subID, String subname) {
        try {
            GetConnect ojb = new GetConnect();
            Connection con = ojb.getconnection();
            String sql = "UPDATE tb_Subject SET Sub_Name = ? WHERE Sub_Id = ?;  ";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, subname);
            stm.setString(2, subID);

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

    public boolean deleteSubject(String subID) throws SQLException {
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "Delete from [tb_Subject] where Sub_Id=?";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, subID);
            int result = stm.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Collection getAllsubjectlist() throws SQLException {
        allsubjectlist = new ArrayList();
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "select * from [tb_Subject]";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Subject ls = new Subject();
                ls.setSub_Id(rs.getString("Sub_Id"));
                ls.setSub_Name(rs.getString("Sub_Name"));

                allsubjectlist.add(ls);
            }
            rs.close();
            con.close();
            return allsubjectlist;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Collection getAllstusublist(String subID) throws SQLException {
        allstusublist = new ArrayList();
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "select a.* from tb_Student as a INNER JOIN tb_StudentSubject as b ON a.Stu_RollNo=b.Stu_RollNo and b.Sub_Id=?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, subID);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                StudentSubject ls = new StudentSubject();
                ls.setStu_RollNo(rs.getString("Stu_RollNo"));
                ls.setStu_Name(rs.getString("Stu_Name"));
                ls.setStu_Gender(rs.getString("Stu_Gender"));
                ls.setStu_Birth(rs.getString("Stu_Birth"));
                ls.setStu_Email(rs.getString("Stu_Email"));
                ls.setCla_Id(rs.getString("Cla_Id"));

                allstusublist.add(ls);
            }
            rs.close();
            con.close();
            return allstusublist;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
