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
public class BStaff {
    private Collection allstafflist;
    private Collection staffrole;
    public BStaff() {
    }
    
    public boolean insertStaff(String staffID, String staffPass, String staffName, String staffAddress, String staffBirth, String staffPhone, String staffMail, String staffGen, String staffQues, String staffAnsw, String staffStart, String staffStatus, String braId){
        try{
            GetConnect ojb=new GetConnect();
            Connection con=ojb.getconnection();
            String sql="Insert into [tb_Staff](Staff_Id,Staff_Pass,Staff_FullName,Staff_Address,Staff_Birth,Staff_Phone,Staff_Email,Staff_Gender, Ques_Id, Staff_Answer, Staff_StartDate,Staff_Status, Bra_Id) Values(?,?,?,?,?,?,?,?,?,?,?,?,?)";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, staffID);
            stm.setString(2, staffPass);
            stm.setString(3, staffName);  
            stm.setString(4, staffAddress);  
            stm.setString(5, staffBirth);  
            stm.setString(6, staffPhone);  
            stm.setString(7, staffMail);
            if(staffGen.equals("Male"))
            {
               stm.setString(8, "true"); 
            } else {
                stm.setString(8, "false"); 
            }             
            stm.setString(9, staffQues);  
            stm.setString(10, staffAnsw);  
            stm.setString(11, staffStart);
            if(staffStatus.equals("a"))
            {
                stm.setString(12, "false"); 
            } else
            {
                stm.setString(12, "true");
            }
            stm.setString(13, braId);  
            
            int result=stm.executeUpdate();            
            stm.close();
            String sql2="Insert into [tb_StaffRole](Staff_Id,Role_Id) Values(?,?)";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm2=con.prepareStatement(sql2);
            stm2.setString(1, staffID);
            stm2.setString(2, "r00");
            int result2=stm2.executeUpdate();
            stm2.close();
            con.close();
            if(result>0 && result2>0)
                return true;
        } catch (Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    
    public boolean updateStaff(String staffID, String staffName, String staffAddress, String staffBirth, String staffPhone, String staffMail, String staffGen, String staffStatus, String braId){
        try{
            GetConnect ojb=new GetConnect();
            Connection con=ojb.getconnection();
            String sql=" UPDATE [tb_Staff] SET Staff_FullName = ?, Staff_Address= ?, Staff_Birth= ?, Staff_Phone= ?, Staff_Email= ?, Staff_Gender= ?, Staff_Status=?, Bra_Id=? WHERE Staff_Id = ?; ";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, staffName);  
            stm.setString(2, staffAddress);  
            stm.setString(3, staffBirth);  
            stm.setString(4, staffPhone);  
            stm.setString(5, staffMail);  
             if(staffGen.equals("Male"))
            {
               stm.setString(6, "true"); 
            } else {
                stm.setString(6, "false"); 
            }     
             if(staffStatus.equals("a"))
            {
                stm.setString(7, "false"); 
            } else
            {
                stm.setString(7, "true");
            }
            stm.setString(8, braId);              
            stm.setString(9, staffID);
            
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
    
     public boolean updateRole(String staffID, String roleId){
        try{
            GetConnect ojb=new GetConnect();
            Connection con=ojb.getconnection();
            String sql=" UPDATE [tb_StaffRole] SET Role_Id = ? WHERE Staff_Id = ?";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, roleId);  
            stm.setString(2, staffID);  
            
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
    
    public boolean deleteStaff(String staffID) throws SQLException{
        GetConnect ojb=new GetConnect();
        Connection con=ojb.getconnection();
        String sql="Delete from [tb_Staff] where Staff_Id=?";
        
        try{
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, staffID);
            int result=stm.executeUpdate();
            if(result>0)
                return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    
    public Collection getAllstafflist() throws SQLException {
        allstafflist=new ArrayList();
        GetConnect ojb=new GetConnect();
        Connection con=ojb.getconnection();
        String sql="select * from [tb_Staff]";
        try{
            PreparedStatement stm=con.prepareStatement(sql);
            ResultSet rs=stm.executeQuery();
            
            while(rs.next()){
                Staff ls=new Staff();
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
               
                allstafflist.add(ls);
            }
            rs.close();
            con.close();
            return allstafflist;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    
     public Collection getStaffRole(String staffId) throws SQLException {
        staffrole=new ArrayList();
        GetConnect ojb=new GetConnect();
        Connection con=ojb.getconnection();
        String sql="select a.*, b.Role_Name from tb_StaffRole as a INNER JOIN tb_Roles as b ON a.Role_Id=b.Role_Id and a.Staff_Id=?";
        try{
            PreparedStatement stm=con.prepareStatement(sql);            
            stm.setString(1, staffId);  
            ResultSet rs=stm.executeQuery();
            
            while(rs.next()){
                StaffRole ls=new StaffRole();
                ls.setStaff_Id(rs.getString("Staff_Id"));
                ls.setRole_Id(rs.getString("Role_Id"));
                ls.setRole_Name(rs.getString("Role_Name"));
               
                staffrole.add(ls);
            }
            rs.close();
            con.close();
            return staffrole;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
}
