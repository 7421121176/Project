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
public class Contact {
    private String cont_Id;
    private String cont_Name;
    private String cont_Info;
    private String cont_Email;
    private String cont_Time;
    private String cont_Status;

    public Contact(String cont_Id, String cont_Name, String cont_Info, String cont_Email, String cont_Time, String cont_Status) {
        this.cont_Id = cont_Id;
        this.cont_Name = cont_Name;
        this.cont_Info = cont_Info;
        this.cont_Email = cont_Email;
        this.cont_Time = cont_Time;
        this.cont_Status = cont_Status;
    }

    
    public Contact(){};

    public String getCont_Id() {
        return cont_Id;
    }

    public void setCont_Id(String cont_Id) {
        this.cont_Id = cont_Id;
    }

    public String getCont_Name() {
        return cont_Name;
    }

    public void setCont_Name(String cont_Name) {
        this.cont_Name = cont_Name;
    }

    public String getCont_Info() {
        return cont_Info;
    }

    public void setCont_Info(String cont_Info) {
        this.cont_Info = cont_Info;
    }

    public String getCont_Email() {
        return cont_Email;
    }

    public void setCont_Email(String cont_Email) {
        this.cont_Email = cont_Email;
    }

    public String getCont_Time() {
        return cont_Time;
    }

    public void setCont_Time(String cont_Time) {
        this.cont_Time = cont_Time;
    }

    public String getCont_Status() {
        return cont_Status;
    }

    public void setCont_Status(String cont_Status) {
        this.cont_Status = cont_Status;
    }
}
