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
public class StudentSubject {
    private String stu_RollNo;
    private String stu_Name;
    private String stu_Gender;
    private String stu_Birth;
    private String stu_Email;
    private String cla_Id;

    public StudentSubject(String stu_RollNo, String stu_Name, String stu_Gender, String stu_Birth, String stu_Email, String cla_Id) {
        this.stu_RollNo = stu_RollNo;
        this.stu_Name = stu_Name;
        this.stu_Gender = stu_Gender;
        this.stu_Birth = stu_Birth;
        this.stu_Email = stu_Email;
        this.cla_Id = cla_Id;
    }

   
    
    public StudentSubject(){};

    public String getStu_RollNo() {
        return stu_RollNo;
    }

    public void setStu_RollNo(String stu_RollNo) {
        this.stu_RollNo = stu_RollNo;
    }

    public String getStu_Name() {
        return stu_Name;
    }

    public void setStu_Name(String stu_Name) {
        this.stu_Name = stu_Name;
    }

    public String getStu_Gender() {
        return stu_Gender;
    }

    public void setStu_Gender(String stu_Gender) {
        this.stu_Gender = stu_Gender;
    }

    public String getStu_Birth() {
        return stu_Birth;
    }

    public void setStu_Birth(String stu_Birth) {
        this.stu_Birth = stu_Birth;
    }

    public String getStu_Email() {
        return stu_Email;
    }

    public void setStu_Email(String stu_Email) {
        this.stu_Email = stu_Email;
    }

    public String getCla_Id() {
        return cla_Id;
    }

    public void setCla_Id(String cla_Id) {
        this.cla_Id = cla_Id;
    }
}
