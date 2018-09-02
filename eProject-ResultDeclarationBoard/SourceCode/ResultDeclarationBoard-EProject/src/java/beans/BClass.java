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
public class BClass {

    private Collection allclasslist;
    private Collection allclassjoinlist;

    public BClass() {
    }

    public boolean insertClass(String classID, String classname, String curID) {
        try {
            GetConnect ojb = new GetConnect();
            Connection con = ojb.getconnection();
            String sql = "insert into [tb_Class](Cla_Id, Cla_Name, Cur_Id) values(?,?,?)";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, classID);
            stm.setString(2, classname);
            stm.setString(3, curID);

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

    public boolean updateClass(String classID, String classname, String curID) {
        try {
            GetConnect ojb = new GetConnect();
            Connection con = ojb.getconnection();
            String sql = "UPDATE tb_Class SET Cla_Name = ?, Cur_Id = ? WHERE Cla_Id = ?; ";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, classname);
            stm.setString(2, curID);
            stm.setString(3, classID);

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

    public boolean deleteClass(String classID) throws SQLException {
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "Delete from [tb_Class] where Cla_Id=?";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, classID);
            int result = stm.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Collection getAllclasslist() throws SQLException {
        allclasslist = new ArrayList();
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "select * from [tb_Class]";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Classcla ls = new Classcla();
                ls.setCla_Id(rs.getString("Cla_Id"));
                ls.setCla_Name(rs.getString("Cla_Name"));
                ls.setCur_Id(rs.getString("Cur_Id"));

                allclasslist.add(ls);
            }
            rs.close();
            con.close();
            return allclasslist;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Collection getAllclassjoinlist() throws SQLException {
        allclassjoinlist = new ArrayList();
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "select a.*, b.* from tb_Class as a INNER JOIN tb_Curriculum as b ON a.Cur_Id=b.Cur_Id";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Classcla ls = new Classcla();
                ls.setCla_Id(rs.getString("Cla_Id"));
                ls.setCla_Name(rs.getString("Cla_Name"));
                ls.setCur_Id(rs.getString("Cur_Id"));
                ls.setCur_Name(rs.getString("Cur_Name"));

                allclassjoinlist.add(ls);
            }
            rs.close();
            con.close();
            return allclassjoinlist;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
