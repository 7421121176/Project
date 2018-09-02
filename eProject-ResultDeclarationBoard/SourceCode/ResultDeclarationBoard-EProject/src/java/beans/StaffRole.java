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
public class StaffRole {
    private String staff_Id;
    private String role_Id;   
    private String role_Name;   

    public StaffRole(String staff_Id, String role_Id, String role_Name) {
        this.staff_Id = staff_Id;
        this.role_Id = role_Id;
        this.role_Name = role_Name;
    }
    
    public StaffRole() {}

    public String getStaff_Id() {
        return staff_Id;
    }

    public void setStaff_Id(String staff_Id) {
        this.staff_Id = staff_Id;
    }

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
