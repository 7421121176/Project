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
public class Staff {
    private String staff_Id;
    private String staff_Pass;
    private String staff_FullName;
    private String staff_Address;
    private String staff_Birth;
    private String staff_Phone;
    private String staff_Email;
    private String staff_Gender;
    private String ques_Id;
    private String staff_Answer;
    private String staff_StartDate;
    private String staff_Status;
    private String bra_Id;

    public Staff(String staff_Id, String staff_Pass, String staff_FullName, String staff_Address, String staff_Birth, String staff_Phone, String staff_Email, String staff_Gender, String ques_Id, String staff_Answer, String staff_StartDate, String staff_Status, String bra_Id) {
        this.staff_Id = staff_Id;
        this.staff_Pass = staff_Pass;
        this.staff_FullName = staff_FullName;
        this.staff_Address = staff_Address;
        this.staff_Birth = staff_Birth;
        this.staff_Phone = staff_Phone;
        this.staff_Email = staff_Email;
        this.staff_Gender = staff_Gender;
        this.ques_Id = ques_Id;
        this.staff_Answer = staff_Answer;
        this.staff_StartDate = staff_StartDate;
        this.staff_Status = staff_Status;
        this.bra_Id = bra_Id;
    }

    
    public Staff(){};

    public String getStaff_Id() {
        return staff_Id;
    }

    public void setStaff_Id(String staff_Id) {
        this.staff_Id = staff_Id;
    }

    public String getStaff_Pass() {
        return staff_Pass;
    }

    public void setStaff_Pass(String staff_Pass) {
        this.staff_Pass = staff_Pass;
    }

    public String getStaff_FullName() {
        return staff_FullName;
    }

    public void setStaff_FullName(String staff_FullName) {
        this.staff_FullName = staff_FullName;
    }

    public String getStaff_Address() {
        return staff_Address;
    }

    public void setStaff_Address(String staff_Address) {
        this.staff_Address = staff_Address;
    }

    public String getStaff_Birth() {
        return staff_Birth;
    }

    public void setStaff_Birth(String staff_Birth) {
        this.staff_Birth = staff_Birth;
    }

    public String getStaff_Phone() {
        return staff_Phone;
    }

    public void setStaff_Phone(String staff_Phone) {
        this.staff_Phone = staff_Phone;
    }

    public String getStaff_Email() {
        return staff_Email;
    }

    public void setStaff_Email(String staff_Email) {
        this.staff_Email = staff_Email;
    }

    public String getStaff_Gender() {
        return staff_Gender;
    }

    public void setStaff_Gender(String staff_Gender) {
        this.staff_Gender = staff_Gender;
    }

    public String getQues_Id() {
        return ques_Id;
    }

    public void setQues_Id(String ques_Id) {
        this.ques_Id = ques_Id;
    }

    public String getStaff_Answer() {
        return staff_Answer;
    }

    public void setStaff_Answer(String staff_Answer) {
        this.staff_Answer = staff_Answer;
    }

    public String getStaff_StartDate() {
        return staff_StartDate;
    }

    public void setStaff_StartDate(String staff_StartDate) {
        this.staff_StartDate = staff_StartDate;
    }

    public String getStaff_Status() {
        return staff_Status;
    }

    public void setStaff_Status(String staff_Status) {
        this.staff_Status = staff_Status;
    }

    public String getBra_Id() {
        return bra_Id;
    }

    public void setBra_Id(String bra_Id) {
        this.bra_Id = bra_Id;
    }
    
    
}
