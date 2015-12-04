/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.Date;

/**
 *
 * @author fofo
 */
public class Entrevista {
    private int idCand;
    private int idEmp;
    private String plataforma;
    private Date fecha;
    private int candId;
    private int empId;
    
    public Entrevista(){
        idCand = 0;
        idEmp = 0;
        plataforma = "";
        fecha = new Date(1, 1, 1);
        candId = 0;
        empId = 0;
    }

    public int getIdCand() {
        return idCand;
    }

    public void setIdCand(int idCand) {
        this.idCand = idCand;
    }

    public int getIdEmp() {
        return idEmp;
    }

    public void setIdEmp(int idEmp) {
        this.idEmp = idEmp;
    }

    public String getPlataforma() {
        return plataforma;
    }

    public void setPlataforma(String plataforma) {
        this.plataforma = plataforma;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getCandId() {
        return candId;
    }

    public void setCandId(int candId) {
        this.candId = candId;
    }

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }
    
    
}
