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
public class Curriculum {

    public Curriculum(String cur_Id, String cur_Name, String cur_Period, String cur_Fee) {
        this.cur_Id = cur_Id;
        this.cur_Name = cur_Name;
        this.cur_Period = cur_Period;
        this.cur_Fee = cur_Fee;
    }
    private String cur_Id;
    private String cur_Name;
    private String cur_Period;
    private String cur_Fee;

    
    public Curriculum() {};

    public String getCur_Id() {
        return cur_Id;
    }

    public void setCur_Id(String cur_Id) {
        this.cur_Id = cur_Id;
    }

    public String getCur_Name() {
        return cur_Name;
    }

    public void setCur_Name(String cur_Name) {
        this.cur_Name = cur_Name;
    }

    public String getCur_Period() {
        return cur_Period;
    }

    public void setCur_Period(String cur_Period) {
        this.cur_Period = cur_Period;
    }

    public String getCur_Fee() {
        return cur_Fee;
    }

    public void setCur_Fee(String cur_Fee) {
        this.cur_Fee = cur_Fee;
    }

    
}
