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

    public String getBasicCandidates() {
        String result = "";
        int store = 0;
        PreparedStatement statement;
        ResultSet resultSet;
        if (connected) {
            try {
                String query = "SELECT candidato.idCand, candidato.nombreCand, candidato.telCand, candidato.emailCand from candidato;";
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();
                // If there are no records, display a message
                if (resultSet.next()) {
                    // get column heads
                    result += "<div class='container-fluid'>\n"
                            + "        <div class='jumbotron'>\n"
                            + "            <center>\n"
                            + "            <h1>Candidatos</h1> <br> <br>"
                            + "                <div class=\"panel panel-primary\">\n"
                            + "                    <div class=\"panel-heading\">"
                            + "<table class ='table'> <tr>";
                    ResultSetMetaData rsmd = (ResultSetMetaData) resultSet.getMetaData();
                    for (int i = 1; i <= rsmd.getColumnCount(); ++i) {
                        if (i != 1) {
                            result += "<th>" + rsmd.getColumnName(i) + "</th>";
                        }

                    }
                    result += "<th> </th>";
                    result += "</tr> <tr>";

                    // get row data
                    do {
                        for (int i = 1; i <= rsmd.getColumnCount(); ++i) {
                            if (i != 1) {
                                result += "<td>" + resultSet.getString(i) + "</td> ";
                            } else {
                                store = resultSet.getInt(i);
                            }
                            if (i == rsmd.getColumnCount()) {

                                result += "<td> <button type = 'button' class = 'btn btn-info' name = 'detalle' value = " + store + " onclick = \"verDetalles(" + store + ")\" > Detalles </button> </td>";
                            }
                        }
                        result += "</tr> <tr>";
                    } while (resultSet.next());
                    result += "</tr> </table> </div>\n"
                            + "                </div>\n"
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
                        + " e.fechaEntrada, e.salario, e.diasVacaciones, sc.nombreCand "
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
                    //empleado.setNumero(resultSet.getString(6));
                    //empleado.setTelCand(resultSet.getString(7));
                    //empleado.setEmailCand(resultSet.getString(8));
                    //empleado.setNombreCand(resultSet.getString(9));
                    //empleado.setDepartamento(resultSet.getString(10));
                    empleado.setNomina(resultSet.getInt(11));
                    empleado.setPuesto(resultSet.getString(12));
                    empleado.setDepartamento(resultSet.getString(13));
                    empleado.setFechaEntrada(resultSet.getDate(14));
                    empleado.setSalario(resultSet.getInt(15));
                    empleado.setDiasVacaciones(resultSet.getInt(16));
                    empleado.setSupervisor(resultSet.getString(17));
                }
            } catch (SQLException sqlex) {
                this.status = "Unable to get Employees. <br>" + sqlex.getMessage() + Arrays.toString(sqlex.getStackTrace());
                this.status = this.status.replace(",", "<br>");
            }
        }
        return empleado;
    }

}
