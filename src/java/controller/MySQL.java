/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.ResultSetMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.Arrays;

/**
 *
 * @author Luis Juan Sanchez P
 */
public class MySQL {

    private Connection connection;
    private boolean connected;
    private String status;

    public MySQL() {
        // Load the driver to allow connection to the database
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection(
                    "jdbc:mysql://localhost/proyectodaw", "root", "");
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

    public String getCandidates() {
        String result = "";
        PreparedStatement statement;
        ResultSet resultSet;
        if (connected) {
            try {
                String query = "SELECT * FROM candidato;";
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();
                // If there are no records, display a message
                if (resultSet.next()) {
                    // get column heads
                    result = "<table> <tr>";
                    ResultSetMetaData rsmd = (ResultSetMetaData) resultSet.getMetaData();
                    for (int i = 1; i <= rsmd.getColumnCount(); ++i) {
                        result += "<th>" + rsmd.getColumnName(i) + "</th>";
                    }
                    result += "</tr> <tr>";

                    // get row data
                    do {
                        for (int i = 1; i <= rsmd.getColumnCount(); ++i) {
                            result += "<td>" + resultSet.getString(i) + "</td> ";
                        }
                        result += "</tr> <tr>";
                    } while (resultSet.next());
                    result += "</tr> </table>";
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

}
