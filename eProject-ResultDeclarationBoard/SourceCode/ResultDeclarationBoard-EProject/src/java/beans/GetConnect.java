/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package beans;

import java.net.HttpCookie;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Cookie;

/**
 *
 * @author DELL
 */
public class GetConnect {
    public GetConnect(){
        
    }
    public static Connection getconnection() throws SQLException{        
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;Database=ResultDeclarationBoardDB;user=sa;password=sa123456;");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GetConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return conn;
    }
}
