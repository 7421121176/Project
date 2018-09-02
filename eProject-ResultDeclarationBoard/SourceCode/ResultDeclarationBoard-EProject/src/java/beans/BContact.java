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
public class BContact {
     private Collection allcontactlist;

    public BContact() {
    }
    
    public boolean insertContact(String contactname, String infor, String email){
        try{
            GetConnect ojb=new GetConnect();
            Connection con=ojb.getconnection();
            String sql="insert into [tb_Contact](Cont_Name, Cont_Info, Cont_Email, Cont_Time) values(?,?,?,?)";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, contactname);
            stm.setString(2, infor);
            stm.setString(3, email);
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	    Date date = new Date();
            stm.setString(4, dateFormat.format(date));     
            
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
    
    public boolean deleteContact(String ContactId) throws SQLException{
        GetConnect ojb=new GetConnect();
        Connection con=ojb.getconnection();
        String sql="Delete from [tb_Contact] where Cont_Id=?";
        
        try{
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, ContactId);
            int result=stm.executeUpdate();
            if(result>0)
                return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    
    public Collection getAllcontactlist() throws SQLException {
        allcontactlist=new ArrayList();
        GetConnect ojb=new GetConnect();
        Connection con=ojb.getconnection();
        String sql="select * from [tb_Contact]";
        try{
            PreparedStatement stm=con.prepareStatement(sql);
            ResultSet rs=stm.executeQuery();
            
            while(rs.next()){
                Contact ls=new Contact();
                ls.setCont_Id(rs.getString("Cont_Id"));
                ls.setCont_Name(rs.getString("Cont_Name"));
                ls.setCont_Info(rs.getString("Cont_Info"));
                ls.setCont_Email(rs.getString("Cont_Email"));
                ls.setCont_Time(rs.getString("Cont_Time"));
                ls.setCont_Status(rs.getString("Cont_Status"));
                allcontactlist.add(ls);
            }
            
            rs.close();
            con.close();
            return allcontactlist;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
}
