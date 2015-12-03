/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import beans.*;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.ResultSetMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.*;

/**
 *
 * @author Luis Juan Sanchez P
 */
public class MySQL {

    private Connection connection;
    private boolean connected;
    private String status;
    private String database = "jdbc:mysql://localhost/proyectodaw";
    private String username = "root";
    private String password = "";

    public MySQL() {
        // Load the driver to allow connection to the database
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection(
                    database, username, password);
            connected = true;
            status = "Connected";
        } catch (ClassNotFoundException cnfex) {
            status = "Failed to load JDBC/ODBC driver. <br>" + Arrays.toString(cnfex.getStackTrace());
            connected = false;
        } catch (SQLException sqlex) {
            status = "Unable to connect. <br>" + Arrays.toString(sqlex.getStackTrace());
            connected = false;
        }
    }

    public String getCandidate(String idCand) {
        String result = "", nombre = "", tel = "", email = "", econ = "",
                rechazo, numero = "", calle = "", ciudad = "", estado = "", zip = "";
        int realId = Integer.parseInt(idCand);
        List<String> habilidades = new ArrayList<>();
        PreparedStatement statement;
        ResultSet resultSet;
        if (connected) {
            try {
                String query = "SELECT candidato.*, habilidades.habilidad, direccion.numero, "
                        + "direccion.calle, direccion.ciudad, direccion.estado,"
                        + "direccion.codigoPostal FROM candidato "
                        + "LEFT JOIN habilidades ON candidato.idCand = habilidades.candId "
                        + "LEFT JOIN direccion ON candidato.idCand = direccion.idDir "
                        + "WHERE candidato.idCand = " + realId + ";";
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();
                // If there are no records, display a message
                if (resultSet.next()) {
                    ResultSetMetaData rsmd = (ResultSetMetaData) resultSet.getMetaData();

                    // get row data
                    do {
                        for (int i = 1; i <= rsmd.getColumnCount(); ++i) {
                            switch (i) {
                                case 2:
                                    nombre = resultSet.getString(i);
                                    break;
                                case 3:
                                    tel = resultSet.getString(i);
                                    break;
                                case 4:
                                    email = resultSet.getString(i);
                                    break;
                                case 5:
                                    econ = resultSet.getString(i);
                                    break;
                                case 6:
                                    rechazo = resultSet.getString(i);
                                    break;
                                case 8:
                                    if (resultSet.getString(i) != null) {
                                        habilidades.add(resultSet.getString(i));
                                    }
                                    break;
                                case 9:
                                    numero = resultSet.getString(i);
                                    break;
                                case 10:
                                    calle = resultSet.getString(i);
                                    break;
                                case 11:
                                    ciudad = resultSet.getString(i);
                                    break;
                                case 12:
                                    estado = resultSet.getString(i);
                                    break;
                                case 13:
                                    zip = resultSet.getString(i);
                                    break;
                            }
                        }
                    } while (resultSet.next());
                    result += "<div class='container-fluid'>\n"
                            + "        <div class='jumbotron'>\n"
                            + "            <center>\n"
                            + "            <h1>" + nombre + "</h1> <br> <br>"
                            + "                <div class=\"panel panel-info\">\n";

                    result += "                    <div class=\"panel-heading\">";
                    result += "                    <h2> Datos </h2> </div> ";

                    result += "                    <div class=\"panel-body\">";
                    result += "<h3>";

                    result += "Telefono: " + tel + "</br> <br>";
                    result += "E-mail: " + email + "</br> <br>";
                    result += "Paga esperada: $" + econ + "</br> <br>";
                    result += "Estado: " + estado + "</br> <br>";
                    result += "Ciudad: " + ciudad + "</br> <br>";
                    result += "Calle: " + calle + "</br> <br>";
                    result += "Codigo Postal: " + zip + "</br> ";

                    result += "</h3> </div> </div>";

                    if (!habilidades.isEmpty()) {
                        result += "<div class=\"panel panel-info\">\n";
                        result += "                    <div class=\"panel-heading\">";
                        if (habilidades.size() == 1) {
                            result += "                    <h2> Habilidad </h2> </div> ";
                        } else {
                            result += "                    <h2> Habilidades </h2> </div> ";
                        }

                        result += "                    <div class=\"panel-body\">";
                        result += "<h3>";

                        for (int i = 0; i < habilidades.size(); i++) {
                            result += habilidades.get(i) + "<br> <br>";
                        }
                        result += "</h3> </div> </div>";
                    } else {
                        result += "                    <h2> Sin habilidades registradas </h2>";
                    }

                    result += "                </div>\n"
                            + "            </center>\n"
                            + "        </div>\n"
                            + "    </div>";
                }
                statement.close();
            } catch (SQLException sqlex) {
                this.status = "Unable to getCandidates. <br>" + sqlex.getMessage() + Arrays.toString(sqlex.getStackTrace());
                this.status = this.status.replace(",", "<br>");
                result = this.status;
            }
        } else {
            result = this.status;
        }
        return result;
    }

     public boolean login(String username, String password) {
        boolean result = false;

        PreparedStatement statement;
        ResultSet resultSet;
        if (connected) {
            try {
                String query = "SELECT * FROM `user` WHERE `username` = ? AND `password` = ?";
                statement = connection.prepareStatement(query);
                statement.setString(1, username);
                statement.setString(2, password);
                resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    result = true;
                }
            } catch (SQLException sqlex) {
                this.status = "Unable to Login. <br>" + sqlex.getMessage() + Arrays.toString(sqlex.getStackTrace());
                this.status = this.status.replace(",", "<br>");
            }
        }

        return result;
    }
    
          
    public LinkedList<Candidate> getCandidates(){
        LinkedList<Candidate> candidatos = new LinkedList();
        PreparedStatement statement;
        ResultSet resultSet;
        if (connected) {
            try {
                String query = "SELECT candidato.* , direccion.numero, direccion.calle, direccion.ciudad, direccion.estado, direccion.codigoPostal FROM candidato "
                        + "LEFT JOIN direccion ON candidato.idCand = direccion.idDir "
                        + "WHERE NOT EXISTS (SELECT * FROM empleado WHERE candidato.idCand = empleado.candId)" ;
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    Candidate candidato = new Candidate();
                    candidato.setIdCand(resultSet.getInt(1));
                    candidato.setNombreCand(resultSet.getString(2));
                    candidato.setTelCand(resultSet.getString(3));
                    candidato.setEmailCand(resultSet.getString(4));
                    candidato.setExpectEconCand(resultSet.getInt(5));
                    candidato.setRazonRechazo(resultSet.getString(6));
                    candidato.setNumero(resultSet.getInt(8));
                    candidato.setCalle(resultSet.getString(9));
                    candidato.setCiudad(resultSet.getString(10));
                    candidato.setEstado(resultSet.getString(11));
                    candidato.setCodigo(resultSet.getInt(12));
                    
                    candidatos.add(candidato);
                }
            } catch (SQLException sqlex) {
                this.status = "Unable to get Candidates. <br>" + sqlex.getMessage() + Arrays.toString(sqlex.getStackTrace());
                this.status = this.status.replace(",", "<br>");
            }
        }
        return candidatos;
    }
    
    public List<String> getHabilidades(String idCand){
        List<String> habilidades = new ArrayList<>();
        PreparedStatement statement;
        int realId = Integer.parseInt(idCand);
        ResultSet resultSet;
        if(connected){
            try {
                String query = "SELECT habilidad FROM habilidades WHERE candId = " + realId; 
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    if (resultSet.getString(1) != null)
                    habilidades.add(resultSet.getString(1));
                }
            } catch (SQLException sqlex) {
                this.status = "Unable to get Candidates. <br>" + sqlex.getMessage() + Arrays.toString(sqlex.getStackTrace());
                this.status = this.status.replace(",", "<br>");
            }
        }
        return habilidades;
    }
    
    public List<Titulo> getTitulos(String idCand){
        List<Titulo> titulos = new ArrayList<>();
        PreparedStatement statement;
        int realId = Integer.parseInt(idCand);
        ResultSet resultSet;
        if(connected){
            try {
                String query = "SELECT instituto, titulacion, fecha FROM titulo WHERE candID = " + realId;
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    Titulo titulo = new Titulo();
                    titulo.setInstituto(resultSet.getString(1));
                    titulo.setTitulacion(resultSet.getString(2));
                    titulo.setFecha(resultSet.getDate(3));
                    titulos.add(titulo);
                }
            } catch (SQLException sqlex) {
                this.status = "Unable to get Candidates. <br>" + sqlex.getMessage() + Arrays.toString(sqlex.getStackTrace());
                this.status = this.status.replace(",", "<br>");
            }
        }
        return titulos;
    }
    
    public List<TrabajoAnterior> getAnteriores(String idCand){
        List<TrabajoAnterior> anteriores = new ArrayList<>();
        PreparedStatement statement;
        int realId = Integer.parseInt(idCand);
        ResultSet resultSet;
        if(connected){
            try {
                String query = "SELECT empresaAnt, puestoAnt, fechaEntrada, fechaSalida, salarioAnt FROM trabajo_Anterior WHERE candId = " + realId;
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    TrabajoAnterior anterior = new TrabajoAnterior();
                    anterior.setEmpresa(resultSet.getString(1));
                    anterior.setPuesto(resultSet.getString(2));
                    anterior.setEntrada(resultSet.getDate(3));
                    anterior.setSalida(resultSet.getDate(4));
                    anterior.setSalario(resultSet.getInt(5));
                    anteriores.add(anterior);
                }
            } catch (SQLException sqlex) {
                this.status = "Unable to get Candidates. <br>" + sqlex.getMessage() + Arrays.toString(sqlex.getStackTrace());
                this.status = this.status.replace(",", "<br>");
            }
        }
        return anteriores;
    }
    
    public List<Compania> getCompanias(String idCand){
        List<Compania> companias = new ArrayList<>();
        PreparedStatement statement;
        int realId = Integer.parseInt(idCand);
        ResultSet resultSet;
        if(connected){
            try {
                String query = "SELECT nombreComp, status, razonInteres FROM compania WHERE candId = " + realId;
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    Compania compania = new Compania();
                    compania.setCompa(resultSet.getString(1));
                    compania.setStatus(resultSet.getString(2));
                    compania.setInteres(resultSet.getString(3));
                    companias.add(compania);
                }
            } catch (SQLException sqlex) {
                this.status = "Unable to get Candidates. <br>" + sqlex.getMessage() + Arrays.toString(sqlex.getStackTrace());
                this.status = this.status.replace(",", "<br>");
            }
        }
        return companias;
    }

    public LinkedList<Empleado> getBasicEmpleados() {
        String result = "";
        LinkedList<Empleado> empleados = new LinkedList();
        PreparedStatement statement;
        ResultSet resultSet;
        if (connected) {
            try {
                String query = "SELECT candidato.nombreCand, empleado.*, supervisor.nombreCand "
                        + "FROM empleado "
                        + "JOIN candidato ON candidato.idCand = empleado.candId "
                        + "LEFT JOIN empleado AS super ON super.nomina = empleado.supervisor "
                        + "LEFT JOIN candidato AS supervisor ON supervisor.idCand = super.candId;";
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    Empleado empleado = new Empleado();
                    empleado.setNombreCand(resultSet.getString(1));
                    empleado.setNomina(resultSet.getInt(2));
                    empleado.setPuesto(resultSet.getString(3));
                    empleado.setDepartamento(resultSet.getString(4));
                    empleado.setFechaEntrada(resultSet.getDate(5));
                    empleado.setSalario(resultSet.getInt(6));
                    empleado.setDiasVacaciones(resultSet.getInt(7));
                    empleado.setSupervisor(resultSet.getString(10));
                    empleados.add(empleado);
                }
            } catch (SQLException sqlex) {
                this.status = "Unable to get Employees. <br>" + sqlex.getMessage() + Arrays.toString(sqlex.getStackTrace());
                this.status = this.status.replace(",", "<br>");
            }
        }

        return empleados;
    }

}
