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
    
    public Entrevista(){
        idCand = 0;
        idEmp = 0;
        plataforma = "";
        fecha = new Date(1, 1, 1);
    }
}
