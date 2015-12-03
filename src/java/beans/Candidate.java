/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Luis Juan Sanchez P
 */
public class Candidate {

    private int idCand;
    private String nombreCand; // VARCHAR(30) NOT NULL,
    private String telCand; // VARCHAR(30) NOT NULL,
    private String emailCand; // VARCHAR(30) NOT NULL,
    private int expectEconCand; // INT(11) NOT NULL,
    private String razonRechazo; // VARCHAR(400),
    //dirección
    private int numero; 
    private String calle; 
    private String ciudad; 
    private String estado;
    private int codigo; 
    //habilidades
    private List<String> habilidades = new ArrayList<>();
    //compañia
    private List<Compania> companias = new ArrayList<>();
    //certificado
    private List<Certificado> certificados = new ArrayList<>();
    //titulo
    private List<Titulo> titulos = new ArrayList<>();
    //trabajos anteriores
    private List<TrabajoAnterior> trabajos = new ArrayList<>();
    
            
    public Candidate() {
        idCand = 0;
        nombreCand = "";
        telCand = "";
        emailCand = "";
        expectEconCand = 0;
        razonRechazo = "";
        numero = 0;
        calle = "";
        ciudad = "";
        estado = "";
        codigo = 0;
    }

    public Candidate(int idCand, String nombreCand, String telCand, String emailCand, int expectEconCand, String razonRechazo, int numero, String calle, String ciudad, String estado, int codigo) {
        this.idCand = idCand;
        this.nombreCand = nombreCand;
        this.telCand = telCand;
        this.emailCand = emailCand;
        this.expectEconCand = expectEconCand;
        this.razonRechazo = razonRechazo;
        this.numero = numero;
        this.calle = calle;
        this.ciudad = ciudad;
        this.estado = estado;
        this.codigo = codigo;
    }
    
    

    public int getIdCand() {
        return idCand;
    }

    public void setIdCand(int idCand) {
        this.idCand = idCand;
    }

    public String getNombreCand() {
        return nombreCand;
    }

    public void setNombreCand(String nombreCand) {
        this.nombreCand = nombreCand;
    }

    public String getTelCand() {
        return telCand;
    }

    public void setTelCand(String telCand) {
        this.telCand = telCand;
    }

    public String getEmailCand() {
        return emailCand;
    }

    public void setEmailCand(String emailCand) {
        this.emailCand = emailCand;
    }

    public int getExpectEconCand() {
        return expectEconCand;
    }

    public void setExpectEconCand(int expectEconCand) {
        this.expectEconCand = expectEconCand;
    }

    public String getRazonRechazo() {
        return razonRechazo;
    }

    public void setRazonRechazo(String razonRechazo) {
        this.razonRechazo = razonRechazo;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public List<String> getHabilidades() {
        return habilidades;
    }

    public void setHabilidades(List<String> habilidades) {
        this.habilidades = habilidades;
    }

    public List<Compania> getCompanias() {
        return companias;
    }

    public void setCompanias(List<Compania> companias) {
        this.companias = companias;
    }

    public List<Certificado> getCertificados() {
        return certificados;
    }

    public void setCertificados(List<Certificado> certificados) {
        this.certificados = certificados;
    }

    public List<Titulo> getTitulos() {
        return titulos;
    }

    public void setTitulos(List<Titulo> titulos) {
        this.titulos = titulos;
    }

    public List<TrabajoAnterior> getTrabajos() {
        return trabajos;
    }

    public void setTrabajos(List<TrabajoAnterior> trabajos) {
        this.trabajos = trabajos;
    }


    
}
