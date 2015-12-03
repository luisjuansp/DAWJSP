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
    private String dbusername = "root";
    private String dbpassword = "";

    public MySQL() {
        // Load the driver to allow connection to the database
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection(
                    database, dbusername, dbpassword);
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

    public Candidate getCandidate(int idCand) {
        Candidate candidato = new Candidate();
        PreparedStatement statement;
        ResultSet resultSet;
        if (connected) {
            try {
                String query = "SELECT c.nombreCand, c.telCand, c.emailCand, c.expectEconCand, "
                        + "c.razonRechazo, d.numero, d.calle, d.ciudad, d.estado, d.codigoPostal "
                        + "FROM candidato c "
                        + "JOIN direccion d ON d.idDir = c.direccion "
                        + "WHERE c.idCand = " + idCand + ";";
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();
                // If there are no records, display a message
                if (resultSet.next()) {
                    candidato.setNombreCand(resultSet.getString(1));
                    candidato.setTelCand(resultSet.getString(2));
                    candidato.setEmailCand(resultSet.getString(3));
                    candidato.setExpectEconCand(resultSet.getInt(4));
                    candidato.setRazonRechazo(resultSet.getString(5));
                    candidato.setNumero(resultSet.getInt(6));
                    candidato.setCalle(resultSet.getString(7));
                    candidato.setCiudad(resultSet.getString(8));
                    candidato.setEstado(resultSet.getString(9));
                    candidato.setCodigo(resultSet.getInt(10));
                }
                statement.close();
            } catch (SQLException sqlex) {
                this.status = "Unable to getCandidates. <br>" + sqlex.getMessage() + Arrays.toString(sqlex.getStackTrace());
                this.status = this.status.replace(",", "<br>");
            }
        }
        return candidato;
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

    public LinkedList<Candidate> getCandidates() {
        LinkedList<Candidate> candidatos = new LinkedList();
        PreparedStatement statement;
        ResultSet resultSet;
        if (connected) {
            try {
                String query = "SELECT candidato.* , direccion.numero, direccion.calle, direccion.ciudad, direccion.estado, direccion.codigoPostal FROM candidato "
                        + "LEFT JOIN direccion ON candidato.idCand = direccion.idDir "
                        + "WHERE NOT EXISTS (SELECT * FROM empleado WHERE candidato.idCand = empleado.candId)";
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

    public List<String> getHabilidades(int idCand) {
        List<String> habilidades = new ArrayList<>();
        PreparedStatement statement;
        ResultSet resultSet;
        if (connected) {
            try {
                String query = "SELECT habilidad FROM habilidades WHERE candId = " + idCand;
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    if (resultSet.getString(1) != null) {
                        habilidades.add(resultSet.getString(1));
                    }
                }
            } catch (SQLException sqlex) {
                this.status = "Unable to get Candidates. <br>" + sqlex.getMessage() + Arrays.toString(sqlex.getStackTrace());
                this.status = this.status.replace(",", "<br>");
            }
        }
        return habilidades;
    }

    public List<Titulo> getTitulos(int idCand) {
        List<Titulo> titulos = new ArrayList<>();
        PreparedStatement statement;
        ResultSet resultSet;
        if (connected) {
            try {
                String query = "SELECT instituto, titulacion, fecha FROM titulo WHERE candID = " + idCand;
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

    public List<TrabajoAnterior> getAnteriores(int idCand) {
        List<TrabajoAnterior> anteriores = new ArrayList<>();
        PreparedStatement statement;
        ResultSet resultSet;
        if (connected) {
            try {
                String query = "SELECT empresaAnt, puestoAnt, fechaEntrada, fechaSalida, salarioAnt FROM trabajo_Anterior WHERE candId = " + idCand;
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

    public List<Compania> getCompanias(int idCand) {
        List<Compania> companias = new ArrayList<>();
        PreparedStatement statement;
        ResultSet resultSet;
        if (connected) {
            try {
                String query = "SELECT nombreComp, status, razonInteres FROM compania WHERE candId = " + idCand;
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

    public LinkedList<Certificado> getCertificados(int idCand) {
        LinkedList<Certificado> certificados = new LinkedList<>();
        PreparedStatement statement;
        ResultSet resultSet;
        if (connected) {
            try {
                String query = "SELECT organizacion, certificacion, fecha "
                        + "FROM certificado "
                        + "WHERE candId = " + idCand;
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    Certificado certificado = new Certificado();
                    certificado.setOrganizacion(resultSet.getString(1));
                    certificado.setCertificacion(resultSet.getString(2));
                    certificado.setFecha(resultSet.getDate(3));
                    certificados.add(certificado);
                }
            } catch (SQLException sqlex) {
                this.status = "Unable to get Candidates. <br>" + sqlex.getMessage() + Arrays.toString(sqlex.getStackTrace());
                this.status = this.status.replace(",", "<br>");
            }
        }
        return certificados;
    }

    public LinkedList<Historial> getHistorial(int idEmp) {
        LinkedList<Historial> historiales = new LinkedList<>();
        PreparedStatement statement;
        ResultSet resultSet;
        if (connected) {
            try {
                String query = "SELECT puestoHist, fechaHist, salarioHist "
                        + "FROM historial "
                        + "WHERE empId = " + idEmp;
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    Historial historial = new Historial();
                    historial.setPuesto(resultSet.getString(1));
                    historial.setFecha(resultSet.getDate(2));
                    historial.setSalario(resultSet.getInt(3));
                    historiales.add(historial);
                }
            } catch (SQLException sqlex) {
                this.status = "Unable to get Candidates. <br>" + sqlex.getMessage() + Arrays.toString(sqlex.getStackTrace());
                this.status = this.status.replace(",", "<br>");
            }
        }
        return historiales;
    }

    public LinkedList<Empleado> getBasicEmpleados() {
        LinkedList<Empleado> empleados = new LinkedList();
        PreparedStatement statement;
        ResultSet resultSet;
        if (connected) {
            try {
                String query = "SELECT candidato.nombreCand, empleado.departamento, candidato.telCand, candidato.emailCand, empleado.nomina "
                        + "FROM empleado "
                        + "JOIN candidato ON candidato.idCand = empleado.candId "
                        + "LEFT JOIN empleado AS super ON super.nomina = empleado.supervisor "
                        + "LEFT JOIN candidato AS supervisor ON supervisor.idCand = super.candId;";
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    Empleado empleado = new Empleado();
                    empleado.setNombreCand(resultSet.getString(1));
                    empleado.setDepartamento(resultSet.getString(2));
                    empleado.setTelCand(resultSet.getString(3));
                    empleado.setEmailCand(resultSet.getString(4));
                    empleado.setNomina(resultSet.getInt(5));
                    empleados.add(empleado);
                }
            } catch (SQLException sqlex) {
                this.status = "Unable to get Employees. <br>" + sqlex.getMessage() + Arrays.toString(sqlex.getStackTrace());
                this.status = this.status.replace(",", "<br>");
            }
        }
        return empleados;
    }

    public Empleado getDetalleEmpleado(int idEmp) {
        Empleado empleado = new Empleado();
        PreparedStatement statement;
        ResultSet resultSet;
        if (connected) {
            try {
                String query = "SELECT c.nombreCand, c.telCand, c.emailCand, c.expectEconCand,"
                        + " c.razonRechazo, d.numero, d.calle, d.ciudad, d.estado,"
                        + " d.codigoPostal, e.nomina, e.puesto, e.departamento,"
                        + " e.fechaEntrada, e.salario, e.diasVacaciones, sc.nombreCand, c.idCand "
                        + "FROM candidato c JOIN empleado e ON e.candId = c.idCand "
                        + "JOIN direccion d ON d.idDir = c.direccion "
                        + "LEFT JOIN empleado s ON e.supervisor = s.nomina "
                        + "LEFT JOIN candidato sc ON sc.idCand = s.candId "
                        + "WHERE e.nomina = ?;";
                statement = connection.prepareStatement(query);
                statement.setInt(1, idEmp);
                resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    empleado.setNombreCand(resultSet.getString(1));
                    empleado.setTelCand(resultSet.getString(2));
                    empleado.setEmailCand(resultSet.getString(3));
                    empleado.setExpectEconCand(resultSet.getInt(4));
                    empleado.setRazonRechazo(resultSet.getString(5));
                    empleado.setNumero(resultSet.getInt(6));
                    empleado.setCalle(resultSet.getString(7));
                    empleado.setCiudad(resultSet.getString(8));
                    empleado.setEstado(resultSet.getString(9));
                    empleado.setCodigo(resultSet.getInt(10));
                    empleado.setNomina(resultSet.getInt(11));
                    empleado.setPuesto(resultSet.getString(12));
                    empleado.setDepartamento(resultSet.getString(13));
                    empleado.setFechaEntrada(resultSet.getDate(14));
                    empleado.setSalario(resultSet.getInt(15));
                    empleado.setDiasVacaciones(resultSet.getInt(16));
                    empleado.setSupervisor(resultSet.getString(17));
                    empleado.setIdCand(resultSet.getInt(18));
                }
            } catch (SQLException sqlex) {
                this.status = "Unable to get Employees. <br>" + sqlex.getMessage() + Arrays.toString(sqlex.getStackTrace());
                this.status = this.status.replace(",", "<br>");
            }
        }
        return empleado;
    }

}
