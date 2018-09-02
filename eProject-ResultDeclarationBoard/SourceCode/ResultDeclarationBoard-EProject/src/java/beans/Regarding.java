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
public class Regarding {

    public Regarding(String re_Id, String stu_RollNo, String re_Status, String re_Date, String exam_Id) {
        this.re_Id = re_Id;
        this.stu_RollNo = stu_RollNo;
        this.re_Status = re_Status;
        this.re_Date = re_Date;
        this.exam_Id = exam_Id;
    }
    private String re_Id;
    private String stu_RollNo;
    private String re_Status;
    private String re_Date;
    private String exam_Id;

    public Regarding() {
    }

    public String getRe_Id() {
        return re_Id;
    }

    public void setRe_Id(String re_Id) {
        this.re_Id = re_Id;
    }

    public String getStu_RollNo() {
        return stu_RollNo;
    }

    public void setStu_RollNo(String stu_RollNo) {
        this.stu_RollNo = stu_RollNo;
    }

    public String getRe_Status() {
        return re_Status;
    }

    public void setRe_Status(String re_Status) {
        this.re_Status = re_Status;
    }

    public String getRe_Date() {
        return re_Date;
    }

    public void setRe_Date(String re_Date) {
        this.re_Date = re_Date;
    }

    public String getExam_Id() {
        return exam_Id;
    }

    public void setExam_Id(String exam_Id) {
        this.exam_Id = exam_Id;
    }
}
