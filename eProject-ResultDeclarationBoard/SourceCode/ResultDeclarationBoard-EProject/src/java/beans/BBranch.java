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
public class BBranch {
 
    private Collection allbranchlist;

    public BBranch() {
    }
    
    public boolean insertBranch(String branchID, String branchname, String address, String email, String phoneno){
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
    }
    
    public Collection getAllbranchlist() throws SQLException {
        allbranchlist=new ArrayList();
        GetConnect ojb=new GetConnect();
        Connection con=ojb.getconnection();
        String sql="select * from [tb_Branch]";
        try{
            PreparedStatement stm=con.prepareStatement(sql);
            ResultSet rs=stm.executeQuery();
            
            while(rs.next()){
                Branch ls=new Branch();
                ls.setBra_Id(rs.getString("Bra_Id"));
                ls.setBra_Name(rs.getString("Bra_Name"));
                ls.setBra_Address(rs.getString("Bra_Address"));
                ls.setBra_Email(rs.getString("Bra_Email"));
                ls.setBra_Phone(rs.getString("Bra_Phone"));

                allbranchlist.add(ls);
            }
            
            rs.close();
            con.close();
            return allbranchlist;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
}
