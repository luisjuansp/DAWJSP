/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.Date;
import java.util.LinkedList;

/**
 *
 * @author lsanchez
 */
public class Empleado extends Candidate {

    private int nomina;
    private String puesto;
    private String departamento;
    private Date fechaEntrada;
    private int salario;
    private int diasVacaciones;
    private String supervisor;
    private LinkedList<Historial> historial = new LinkedList<>();

    public Empleado() {
        super();
        nomina = 0;
        puesto = "";
        departamento = "";
        fechaEntrada = new Date(1, 1, 1);
        salario = -1;
        diasVacaciones = -1;
        supervisor = "";
    }

    public Empleado(int idCand, String nombreCand, String telCand,
            String emailCand, int expectEconCand, String razonRechazo, int numero, String calle, String ciudad, String estado, int codigo, String feedback,
            int nomina, String puesto, String departamento, Date fechaEntrada,
            int salario, int diasVacaciones, String supervisor) {
        super(idCand, nombreCand, telCand, emailCand, expectEconCand, razonRechazo, numero,  calle, ciudad, estado,  codigo);
        
        this.nomina = nomina;
        this.puesto = puesto;
        this.departamento = departamento;
        this.fechaEntrada = fechaEntrada;
        this.salario = salario;
        this.diasVacaciones = diasVacaciones;
        this.supervisor = supervisor;
    }

    public int getNomina() {
        return nomina;
    }

    public void setNomina(int nomina) {
        this.nomina = nomina;
    }

    public String getPuesto() {
        return puesto;
    }

    public void setPuesto(String puesto) {
        this.puesto = puesto;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public Date getFechaEntrada() {
        return fechaEntrada;
    }

    public void setFechaEntrada(Date fechaEntrada) {
        this.fechaEntrada = fechaEntrada;
    }

    public int getSalario() {
        return salario;
    }

    public void setSalario(int salario) {
        this.salario = salario;
    }

    public int getDiasVacaciones() {
        return diasVacaciones;
    }

    public void setDiasVacaciones(int diasVacaciones) {
        this.diasVacaciones = diasVacaciones;
    }

    public String getSupervisor() {
        return supervisor;
    }
    
    public void setSupervisor(String supervisor) {
        this.supervisor = supervisor;
    }

    public LinkedList<Historial> getHistorial() {
        return historial;
    }

    public void setHistorial(LinkedList<Historial> historial) {
        this.historial = historial;
    }

    
}
