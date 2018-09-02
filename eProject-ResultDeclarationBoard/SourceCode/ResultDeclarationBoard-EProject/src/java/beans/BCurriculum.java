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
public class BCurriculum {

    private Collection allcurriculumlist;

    public BCurriculum() {
    }

    public boolean insertCurriculum(String curID, String curname, String curperiod, String curefree) {
        try {
            GetConnect ojb = new GetConnect();
            Connection con = ojb.getconnection();
            String sql = "Insert into tb_Curriculum(Cur_Id, Cur_Name,Cur_Period,Cur_Fee) Values (?,?,?,?)";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, curID);
            stm.setString(2, curname);
            stm.setString(3, curperiod);
            stm.setString(4, curefree);

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

    public boolean updateCurriculum(String curID, String curname, String curperiod, String curefree) {
        try {
            GetConnect ojb = new GetConnect();
            Connection con = ojb.getconnection();
            String sql = "UPDATE tb_Curriculum SET Cur_Name = ?, Cur_Period= ?, Cur_Fee= ? WHERE Cur_Id = ?; ";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, curname);
            stm.setString(2, curperiod);
            stm.setString(3, curefree);
            stm.setString(4, curID);

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

    public boolean deleteCurriculum(String curID) throws SQLException {
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "Delete from [tb_Curriculum] where Cur_Id=?";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, curID);
            int result = stm.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Collection getAllcurriculumlist() throws SQLException {
        allcurriculumlist = new ArrayList();
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "select * from [tb_Curriculum]";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Curriculum ls = new Curriculum();
                ls.setCur_Id(rs.getString("Cur_Id"));
                ls.setCur_Name(rs.getString("Cur_Name"));
                ls.setCur_Period(rs.getString("Cur_Period"));
                ls.setCur_Fee(rs.getString("Cur_Fee"));

                allcurriculumlist.add(ls);
            }
            rs.close();
            con.close();
            return allcurriculumlist;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
