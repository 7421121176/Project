/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package beans;

import java.io.Serializable;

/**
 *
 * @author DELL
 */
public class Branch  implements Serializable{

    public Branch(String bra_Id, String bra_Name, String bra_Address, String bra_Email, String bra_Phone) {
        this.bra_Id = bra_Id;
        this.bra_Name = bra_Name;
        this.bra_Address = bra_Address;
        this.bra_Email = bra_Email;
        this.bra_Phone = bra_Phone;
    }
    private String bra_Id;
    private String bra_Name;
    private String bra_Address;
    private String bra_Email;
    private String bra_Phone;

    public Branch() {
    }

    public String getBra_Id() {
        return bra_Id;
    }

    public void setBra_Id(String bra_Id) {
        this.bra_Id = bra_Id;
    }

    public String getBra_Name() {
        return bra_Name;
    }

    public void setBra_Name(String bra_Name) {
        this.bra_Name = bra_Name;
    }

    public String getBra_Address() {
        return bra_Address;
    }

    public void setBra_Address(String bra_Address) {
        this.bra_Address = bra_Address;
    }

    public String getBra_Email() {
        return bra_Email;
    }

    public void setBra_Email(String bra_Email) {
        this.bra_Email = bra_Email;
    }

    public String getBra_Phone() {
        return bra_Phone;
    }

    public void setBra_Phone(String bra_Phone) {
        this.bra_Phone = bra_Phone;
    }

    
    
}
