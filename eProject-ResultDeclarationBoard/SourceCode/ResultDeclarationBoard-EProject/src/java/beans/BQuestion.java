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
public class BQuestion {

    private Collection allquestionlist;

    public BQuestion() {
    }

    public Collection getAllquestionlist() throws SQLException {
        allquestionlist = new ArrayList();
        GetConnect ojb = new GetConnect();
        Connection con = ojb.getconnection();
        String sql = "select * from [tb_Question]";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Question ls = new Question();
                ls.setQues_Id(rs.getString("Ques_Id"));
                ls.setQues_question(rs.getString("Ques_question"));
                allquestionlist.add(ls);
            }

            rs.close();
            con.close();
            return allquestionlist;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
