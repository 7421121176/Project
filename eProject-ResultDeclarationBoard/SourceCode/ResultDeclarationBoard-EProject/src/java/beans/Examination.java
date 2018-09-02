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
public class Examination {
    private String exam_Id;
    private String sub_Id;
    private String exam_Date;
    private String exam_Time;
    private String exam_Fee;
    private String exam_StartDate;
    private String exam_EndDate;
    private String exam_Status;
    private String sub_Name;

    public Examination(String exam_Id, String sub_Id, String exam_Date, String exam_Time, String exam_Fee, String exam_StartDate, String exam_EndDate, String exam_Status, String sub_Name) {
        this.exam_Id = exam_Id;
        this.sub_Id = sub_Id;
        this.exam_Date = exam_Date;
        this.exam_Time = exam_Time;
        this.exam_Fee = exam_Fee;
        this.exam_StartDate = exam_StartDate;
        this.exam_EndDate = exam_EndDate;
        this.exam_Status = exam_Status;
        this.sub_Name = sub_Name;
    }
    
    
    public Examination(){};

    public String getExam_Id() {
        return exam_Id;
    }

    public void setExam_Id(String exam_Id) {
        this.exam_Id = exam_Id;
    }

    public String getSub_Id() {
        return sub_Id;
    }

    public void setSub_Id(String sub_Id) {
        this.sub_Id = sub_Id;
    }

    public String getExam_Date() {
        return exam_Date;
    }

    public void setExam_Date(String exam_Date) {
        this.exam_Date = exam_Date;
    }

    public String getExam_Time() {
        return exam_Time;
    }

    public void setExam_Time(String exam_Time) {
        this.exam_Time = exam_Time;
    }

    public String getExam_Fee() {
        return exam_Fee;
    }

    public void setExam_Fee(String exam_Fee) {
        this.exam_Fee = exam_Fee;
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

    public String getExam_Status() {
        return exam_Status;
    }

    public void setExam_Status(String exam_Status) {
        this.exam_Status = exam_Status;
    }

    public String getSub_Name() {
        return sub_Name;
    }

    public void setSub_Name(String sub_Name) {
        this.sub_Name = sub_Name;
    }

}
