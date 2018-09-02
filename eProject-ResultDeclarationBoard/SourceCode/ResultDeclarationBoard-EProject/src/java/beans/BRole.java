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
public class BRole {

    private Collection allrolelist;

    public BRole() {
    }
    public Collection getAllrolelist() throws SQLException {
        allrolelist = new ArrayList();
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "select * from [tb_Roles]";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Role ls = new Role();
                ls.setRole_Id(rs.getString("Role_Id"));
                ls.setRole_Name(rs.getString("Role_Name"));

                allrolelist.add(ls);
            }
            rs.close();
            con.close();
            return allrolelist;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
