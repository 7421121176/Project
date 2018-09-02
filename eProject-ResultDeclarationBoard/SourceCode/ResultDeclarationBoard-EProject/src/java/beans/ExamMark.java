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
public class ExamMark {

    private String mark;
    private String stu_RollNo;
    private String exam_Id;
    private String staff_Id;

    public ExamMark(String mark, String stu_RollNo, String exam_Id, String staff_Id) {
        this.mark = mark;
        this.stu_RollNo = stu_RollNo;
        this.exam_Id = exam_Id;
        this.staff_Id = staff_Id;
    }

    public ExamMark() {}

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public String getStu_RollNo() {
        return stu_RollNo;
    }

    public void setStu_RollNo(String stu_RollNo) {
        this.stu_RollNo = stu_RollNo;
    }

    public String getExam_Id() {
        return exam_Id;
    }

    public void setExam_Id(String exam_Id) {
        this.exam_Id = exam_Id;
    }

    public String getStaff_Id() {
        return staff_Id;
    }

    public void setStaff_Id(String staff_Id) {
        this.staff_Id = staff_Id;
    }

}
