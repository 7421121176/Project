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
public class BRegarding {
     private Collection allregardinglist;
      public BRegarding() {
    }
    
    public boolean insertRegarding(String regardingID, String studentrollno, String regarstatus, String date, String examid){
        try{
            GetConnect ojb=new GetConnect();
            Connection con=ojb.getconnection();
            String sql="insert into [tb_Regarding](Re_Id, Stu_RollNo, Re_Status, Re_Date, Exam_Id) values(?,?,?,?,?)";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, regardingID);
            stm.setString(2, studentrollno);
            stm.setString(3, regarstatus);
            stm.setString(4, date);
            stm.setString(5, examid);     
            
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
    
    public boolean updateRegarding(String regardingID, String studentrollno, String regarstatus, String date, String examid){
        try{
            GetConnect ojb=new GetConnect();
            Connection con=ojb.getconnection();
            String sql="UPDATE [tb_Regarding] SET Stu_RollNo = ?, Re_Status= ?, Re_Date= ?, Exam_Id= ? WHERE Re_Id = ?";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, studentrollno);
            stm.setString(2, regarstatus);
            stm.setString(3, date);
            stm.setString(4, examid);              
            stm.setString(5, regardingID);
            
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
    
    public boolean deleteRegarding(String RegardingId) throws SQLException{
        GetConnect ojb=new GetConnect();
        Connection con=ojb.getconnection();
        String sql="Delete from [tb_Regarding] where Re_Id=?";
        
        try{
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, RegardingId);
            int result=stm.executeUpdate();
            if(result>0)
                return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    
    public Collection getAllregardinglist() throws SQLException {
        allregardinglist=new ArrayList();
        GetConnect ojb=new GetConnect();
        Connection con=ojb.getconnection();
        String sql="select * from [tb_Regarding]";
        try{
            PreparedStatement stm=con.prepareStatement(sql);
            ResultSet rs=stm.executeQuery();
            
            while(rs.next()){
                Regarding ls=new Regarding();
                ls.setRe_Id(rs.getString("Re_Id"));
                ls.setStu_RollNo(rs.getString("Stu_RollNo"));
                ls.setRe_Status(rs.getString("Re_Status"));
                ls.setRe_Date(rs.getString("Re_Date"));
                ls.setExam_Id(rs.getString("Exam_Id"));

                allregardinglist.add(ls);
            }
            
            rs.close();
            con.close();
            return allregardinglist;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
}
