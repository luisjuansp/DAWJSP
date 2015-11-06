/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Luis Juan Sanchez P
 */
public class Candidate {

    private String nombreCand; // VARCHAR(30) NOT NULL,
    private String telCand; // VARCHAR(30) NOT NULL,
    private String emailCand; // VARCHAR(30) NOT NULL,
    private int expectEconCand; // INT(11) NOT NULL,
    private String razonRechazo; // VARCHAR(400),

    public Candidate() {
        nombreCand = "";
        telCand = "";
        emailCand = "";
        expectEconCand = 0;
        razonRechazo = "";
    }

    public Candidate(String nombreCand, String telCand, String emailCand, int expectEconCand, String razonRechazo) {
        this.nombreCand = nombreCand;
        this.telCand = telCand;
        this.emailCand = emailCand;
        this.expectEconCand = expectEconCand;
        this.razonRechazo = razonRechazo;
    }

    public String getNombreCand() {
        return this.nombreCand;
    }

    public void setNombreCand(String nombreCand) {
        this.nombreCand = nombreCand;
    }

    public String getTelCand() {
        return this.telCand;
    }

    public void setTelCand(String telCand) {
        this.telCand = telCand;
    }

    public String getEmailCand() {
        return this.emailCand;
    }

    public void setEmailCand(String emailCand) {
        this.emailCand = emailCand;
    }

    public int getExpectEconCand() {
        return this.expectEconCand;
    }

    public void setExpectEconCand(int expectEconCand) {
        this.expectEconCand = expectEconCand;
    }

    public String getRazonRechazo() {
        return this.razonRechazo;
    }

    public void setRazonRechazo(String razonRechazo) {
        this.razonRechazo = razonRechazo;
    }
}
