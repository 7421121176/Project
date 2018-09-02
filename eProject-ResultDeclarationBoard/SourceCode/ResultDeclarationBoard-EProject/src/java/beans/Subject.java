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
public class Subject {
    private String Sub_Id;
    private String Sub_Name;

    public String getSub_Id() {
        return Sub_Id;
    }

    public void setSub_Id(String Sub_Id) {
        this.Sub_Id = Sub_Id;
    }

    public String getSub_Name() {
        return Sub_Name;
    }

    public void setSub_Name(String Sub_Name) {
        this.Sub_Name = Sub_Name;
    }
    
     public Subject() {};
    
     public Subject(String Sub_Id, String Sub_Name) {
        this.Sub_Id = Sub_Id;
        this.Sub_Name = Sub_Name;
    }
}
