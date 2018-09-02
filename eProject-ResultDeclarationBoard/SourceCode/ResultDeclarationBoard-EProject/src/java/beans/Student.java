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
public class Student {
    private String stu_RollNo;
    private String stu_Name;
    private String stu_Gender;
    private String stu_Address;
    private String stu_Birth;
    private String stu_Phone;
    private String stu_Email;
    private String bra_Id;
    private String cla_Id;
    private String cla_Name;
    private String bra_Name;

    public Student(String stu_RollNo, String stu_Name, String stu_Gender, String stu_Address, String stu_Birth, String stu_Phone, String stu_Email, String bra_Id, String cla_Id, String cla_Name, String bra_Name) {
        this.stu_RollNo = stu_RollNo;
        this.stu_Name = stu_Name;
        this.stu_Gender = stu_Gender;
        this.stu_Address = stu_Address;
        this.stu_Birth = stu_Birth;
        this.stu_Phone = stu_Phone;
        this.stu_Email = stu_Email;
        this.bra_Id = bra_Id;
        this.cla_Id = cla_Id;
        this.cla_Name = cla_Name;
        this.bra_Name = bra_Name;
    }

    
    
    public Student(){};

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

    public String getStu_Address() {
        return stu_Address;
    }

    public void setStu_Address(String stu_Address) {
        this.stu_Address = stu_Address;
    }

    public String getStu_Birth() {
        return stu_Birth;
    }

    public void setStu_Birth(String stu_Birth) {
        this.stu_Birth = stu_Birth;
    }

    public String getStu_Phone() {
        return stu_Phone;
    }

    public void setStu_Phone(String stu_Phone) {
        this.stu_Phone = stu_Phone;
    }

    public String getStu_Email() {
        return stu_Email;
    }

    public void setStu_Email(String stu_Email) {
        this.stu_Email = stu_Email;
    }

    public String getBra_Id() {
        return bra_Id;
    }

    public void setBra_Id(String bra_Id) {
        this.bra_Id = bra_Id;
    }

    public String getCla_Id() {
        return cla_Id;
    }

    public void setCla_Id(String cla_Id) {
        this.cla_Id = cla_Id;
    }

    public String getCla_Name() {
        return cla_Name;
    }

    public void setCla_Name(String cla_Name) {
        this.cla_Name = cla_Name;
    }

    public String getBra_Name() {
        return bra_Name;
    }

    public void setBra_Name(String bra_Name) {
        this.bra_Name = bra_Name;
    }

}
