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
public class BResult {
    private  Float mark;
    private  String stu_RollNo;
    private  String stu_Name;
    private  String stu_Birth;
    private  String stu_Gender;
    private  String cla_Id;
    private  String sub_Name;
    private  String exam_Date;
    private  String exam_StartDate;
    private  String exam_EndDate;
    private  Float exam_Fee;

    public BResult(Float mark, String stu_RollNo, String stu_Name, String stu_Birth, String stu_Gender, String cla_Id, String sub_Name, String exam_Date, String exam_StartDate, String exam_EndDate, Float exam_Fee) {
        this.mark = mark;
        this.stu_RollNo = stu_RollNo;
        this.stu_Name = stu_Name;
        this.stu_Birth = stu_Birth;
        this.stu_Gender = stu_Gender;
        this.cla_Id = cla_Id;
        this.sub_Name = sub_Name;
        this.exam_Date = exam_Date;
        this.exam_StartDate = exam_StartDate;
        this.exam_EndDate = exam_EndDate;
        this.exam_Fee = exam_Fee;
    }
    
    public BResult() {}

    public Float getMark() {
        return mark;
    }

    public void setMark(Float mark) {
        this.mark = mark;
    }

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

    public String getStu_Birth() {
        return stu_Birth;
    }

    public void setStu_Birth(String stu_Birth) {
        this.stu_Birth = stu_Birth;
    }

    public String getStu_Gender() {
        return stu_Gender;
    }

    public void setStu_Gender(String stu_Gender) {
        this.stu_Gender = stu_Gender;
    }

    public String getCla_Id() {
        return cla_Id;
    }

    public void setCla_Id(String cla_Id) {
        this.cla_Id = cla_Id;
    }

    public String getSub_Name() {
        return sub_Name;
    }

    public void setSub_Name(String sub_Name) {
        this.sub_Name = sub_Name;
    }

    public String getExam_Date() {
        return exam_Date;
    }

    public void setExam_Date(String exam_Date) {
        this.exam_Date = exam_Date;
    }

    public String getExam_StartDate() {
        return exam_StartDate;
    }

    public void setExam_StartDate(String exam_StartDate) {
        this.exam_StartDate = exam_StartDate;
    }

    public String getExam_EndDate() {
        return exam_EndDate;
    }

    public void setExam_EndDate(String exam_EndDate) {
        this.exam_EndDate = exam_EndDate;
    }

    public Float getExam_Fee() {
        return exam_Fee;
    }

    public void setExam_Fee(Float exam_Fee) {
        this.exam_Fee = exam_Fee;
    }
}
