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
public class BProfile {

    private Collection stafflist;

    public BProfile() {
    }

    public boolean updateProfile(String staffID, String staffName, String staffAddress, String staffEmail, String staffPhone, String staffBirth, String gender) {
        try {
            GetConnect ojb = new GetConnect();
            Connection con = ojb.getconnection();
            String sql = " UPDATE tb_Staff SET Staff_FullName = ?, Staff_Address= ?, Staff_Birth= ?, Staff_Phone= ?, Staff_Email= ?, Staff_Gender= ? WHERE Staff_Id = ? ";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, staffName);
            stm.setString(2, staffAddress);            
            stm.setString(3, staffBirth);
            stm.setString(4, staffPhone);
            stm.setString(5, staffEmail);
            if(gender.equals("Male"))
            {
               stm.setString(6, "true"); 
            } else {
                stm.setString(6, "false"); 
            } 
            stm.setString(7, staffID);

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
    
     public boolean updatepass(String staffID, String staffPass, String staffNewPass) {
        try {
            GetConnect ojb = new GetConnect();
            Connection con = ojb.getconnection();
            String sql = "UPDATE tb_Staff SET Staff_Pass = ? WHERE Staff_Id = ? and Staff_Pass = ?";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, staffNewPass);
            stm.setString(2, staffID);
            stm.setString(3, staffPass);

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
     
      public boolean updateQuestion(String staffID, String staffPass, String quesID, String staffAnswer) {
        try {
            GetConnect ojb = new GetConnect();
            Connection con = ojb.getconnection();
            String sql = " UPDATE tb_Staff SET Ques_Id= ?, Staff_Answer= ? WHERE Staff_Id = ? and Staff_Pass = ?";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, quesID);
            stm.setString(2, staffAnswer);
            stm.setString(3, staffID);
            stm.setString(4, staffPass);

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

    public Collection getAllstafflist(String staffId) throws SQLException {
        stafflist = new ArrayList();
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "select * from [tb_Staff] where Staff_Id=?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);            
            stm.setString(1, staffId);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Staff ls = new Staff();
                ls.setStaff_Id(rs.getString("Staff_Id"));
                ls.setStaff_Pass(rs.getString("Staff_Pass"));
                ls.setStaff_FullName(rs.getString("Staff_FullName"));
                ls.setStaff_Address(rs.getString("Staff_Address"));
                ls.setStaff_Birth(rs.getString("Staff_Birth"));
                ls.setStaff_Phone(rs.getString("Staff_Phone"));
                ls.setStaff_Email(rs.getString("Staff_Email"));
                ls.setStaff_Gender(rs.getString("Staff_Gender"));
                ls.setQues_Id(rs.getString("Ques_Id"));
                ls.setStaff_Answer(rs.getString("Staff_Answer"));
                ls.setStaff_StartDate(rs.getString("Staff_StartDate"));
                ls.setStaff_Status(rs.getString("Staff_Status"));
                ls.setBra_Id(rs.getString("Bra_Id"));

                stafflist.add(ls);
            }
            rs.close();
            con.close();
            return stafflist;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
