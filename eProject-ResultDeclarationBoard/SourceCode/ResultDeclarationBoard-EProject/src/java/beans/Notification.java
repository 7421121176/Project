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
public class Notification {

    private String no_Id;
    private String no_Title;
    private String no_Info;
    private String no_Date;
    private String staff_Id;
    private String staff_FullName;

    public Notification(String no_Id, String no_Title, String no_Info, String no_Date, String staff_Id, String staff_FullName) {
        this.no_Id = no_Id;
        this.no_Title = no_Title;
        this.no_Info = no_Info;
        this.no_Date = no_Date;
        this.staff_Id = staff_Id;
        this.staff_FullName = staff_FullName;
    }

   
    public Notification() {};

    public String getNo_Id() {
        return no_Id;
    }

    public void setNo_Id(String no_Id) {
        this.no_Id = no_Id;
    }

    public String getNo_Title() {
        return no_Title;
    }

    public void setNo_Title(String no_Title) {
        this.no_Title = no_Title;
    }

    public String getNo_Info() {
        return no_Info;
    }

    public void setNo_Info(String no_Info) {
        this.no_Info = no_Info;
    }

    public String getNo_Date() {
        return no_Date;
    }

    public void setNo_Date(String no_Date) {
        this.no_Date = no_Date;
    }

    public String getStaff_Id() {
        return staff_Id;
    }

    public void setStaff_Id(String staff_Id) {
        this.staff_Id = staff_Id;
    }

    public String getStaff_FullName() {
        return staff_FullName;
    }

    public void setStaff_FullName(String staff_FullName) {
        this.staff_FullName = staff_FullName;
    }

    
     
}
