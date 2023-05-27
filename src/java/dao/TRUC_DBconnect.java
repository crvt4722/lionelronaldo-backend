/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author hi
 */
public class TRUC_DBconnect {
    protected Connection connection;

    public TRUC_DBconnect() throws ClassNotFoundException {
        try {
            String user = "sa";
            String pass = "27082002";
            String url = "jdbc:sqlserver://ANANXINH\\SERVER_WEB:143;databaseName=WEBTHAYDUNG";
            String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            Class.forName(driver);
            connection = DriverManager.getConnection(url, user, pass);
            System.out.println(connection);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Connection getConnection() {
        return connection;
    }
    
    
}
