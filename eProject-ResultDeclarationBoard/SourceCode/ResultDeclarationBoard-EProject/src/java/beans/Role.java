/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package beans;

/**
 *
 * @author DELL
 */
public class Role {
    private String role_Id;
    private String role_Name;

    public Role(String role_Id, String role_Name) {
        this.role_Id = role_Id;
        this.role_Name = role_Name;
    }
    
    public Role() {};

    public String getRole_Id() {
        return role_Id;
    }

    public void setRole_Id(String role_Id) {
        this.role_Id = role_Id;
    }

    public String getRole_Name() {
        return role_Name;
    }

    public void setRole_Name(String role_Name) {
        this.role_Name = role_Name;
    }
}
