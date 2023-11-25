/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {

    public static Connection getConnection() {
        try {
            String url = "jdbc:mysql://" + serverName + ":" + portNumber + "/" + dbName;

            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(url, username, password);
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Connection error! " + ex.getMessage());
        }
        return null;
    }
    private final static String serverName = "YOUR_SERVER_IP_ADDRESS | localhost";
    private final static String dbName = "YOUR_DB_NAME";
    private final static String portNumber = "3306"; // 1433: SQL Server, 3306: MySQL
    private final static String username = "YOUR_USERNAME";
    private final static String password = "YOUR_PASSWORD";
}
