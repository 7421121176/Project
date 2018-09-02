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
public class Classcla {

    

    public Classcla() {
    }

    private String cla_Id;
    private String cla_Name;
    private String cur_Id;
    private String cur_Name;

    public Classcla(String cla_Id, String cla_Name, String cur_Id, String cur_Name) {
        this.cla_Id = cla_Id;
        this.cla_Name = cla_Name;
        this.cur_Id = cur_Id;
        this.cur_Name = cur_Name;
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

    

}
