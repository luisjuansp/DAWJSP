/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author fofo
 */
public class Compania {
    
    private String compa; 
    private String status; 
    private String interes; 
    
    public Compania(){
        compa = "";
        status = "";
        interes = "";
    }

    public String getCompa() {
        return compa;
    }

    public void setCompa(String compa) {
        this.compa = compa;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getInteres() {
        return interes;
    }

    public void setInteres(String interes) {
        this.interes = interes;
    }
    
    
    
}
