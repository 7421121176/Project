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
public class Question {
    private String ques_Id;
    private String ques_question;

    public Question(String ques_Id, String ques_question) {
        this.ques_Id = ques_Id;
        this.ques_question = ques_question;
    }
    
    public Question (){};

    public String getQues_Id() {
        return ques_Id;
    }

    public void setQues_Id(String ques_Id) {
        this.ques_Id = ques_Id;
    }

    public String getQues_question() {
        return ques_question;
    }

    public void setQues_question(String ques_question) {
        this.ques_question = ques_question;
    }
}
