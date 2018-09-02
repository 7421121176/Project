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
import java.util.Date;

/**
 *
 * @author DELL
 */
public class BNotification {
    private Collection allnotificationlist;
    private Collection allnotificationjoinlist;

    public BNotification() {
    }
    
    public boolean insertNotification(String notiID, String notititle, String notiinfo, String staffID){
        try{
            GetConnect ojb=new GetConnect();
            Connection con=ojb.getconnection();
            String sql="Insert into tb_Notification(No_Id, No_Title, No_Info, No_Date, Staff_Id) Values(?,?,?,?,?)";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, notiID);
            stm.setString(2, notititle);
            stm.setString(3, notiinfo); 
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
            Date date = new Date();
            stm.setString(4, dateFormat.format(date));  
            stm.setString(5, staffID);  
            
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
    
    public boolean updateNotification(String notiID, String notititle, String notiinfo){
        try{
            GetConnect ojb=new GetConnect();
            Connection con=ojb.getconnection();
            String sql=" UPDATE tb_Notification SET No_Title = ?, No_Info= ? WHERE No_Id = ?;";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, notititle);
            stm.setString(2, notiinfo);  
            stm.setString(3, notiID);
            
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
    
    public boolean deleteNotification(String notiID) throws SQLException{
        GetConnect ojb=new GetConnect();
        Connection con=ojb.getconnection();
        String sql="Delete from [tb_Notification] where No_Id=?";
        
        try{
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, notiID);
            int result=stm.executeUpdate();
            if(result>0)
                return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    
    public Collection getAllnotificationlist() throws SQLException {
        allnotificationlist=new ArrayList();
        GetConnect ojb=new GetConnect();
        Connection con=ojb.getconnection();
        String sql="select * from [tb_Notification]";
        try{
            PreparedStatement stm=con.prepareStatement(sql);
            ResultSet rs=stm.executeQuery();
            
            while(rs.next()){
                Notification ls=new Notification();
                ls.setNo_Id(rs.getString("No_Id"));
                ls.setNo_Title(rs.getString("No_Title"));
                ls.setNo_Info(rs.getString("No_Info"));
                ls.setNo_Date(rs.getString("No_Date"));
                ls.setStaff_Id(rs.getString("Staff_Id"));
               
                allnotificationlist.add(ls);
            }
            rs.close();
            con.close();
            return allnotificationlist;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    
    public Collection getAllnotificationjoinlist() throws SQLException {
        allnotificationjoinlist=new ArrayList();
        GetConnect ojb=new GetConnect();
        Connection con=ojb.getconnection();
        String sql="select a.*,  b.* from [tb_Notification] as a INNER JOIN tb_Staff as b ON a.Staff_Id = b.Staff_Id";
        try{
            PreparedStatement stm=con.prepareStatement(sql);
            ResultSet rs=stm.executeQuery();
            
            while(rs.next()){
                Notification ls=new Notification();
                ls.setNo_Id(rs.getString("No_Id"));
                ls.setNo_Title(rs.getString("No_Title"));
                ls.setNo_Info(rs.getString("No_Info"));
                ls.setNo_Date(rs.getString("No_Date"));
                ls.setStaff_Id(rs.getString("Staff_Id"));
                ls.setStaff_FullName(rs.getString("Staff_FullName"));
               
                allnotificationjoinlist.add(ls);
            }
            rs.close();
            con.close();
            return allnotificationjoinlist;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
}
