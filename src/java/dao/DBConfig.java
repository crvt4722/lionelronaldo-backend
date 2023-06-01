/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author User
 */
public class DBConfig {

    public static String driver = "com.mysql.cj.jdbc.Driver";
    public static String url = "jdbc:mysql://localhost:3306/mydb";
    public static String user = "root";
    public static String password = "25112002";
    public static Connection openConnection() {
        Connection con = null;
        try {
//            System.out.println("Hello from DBConfig.driver " + DBConfig.driver);
            Class.forName(DBConfig.driver);
            con = DriverManager.getConnection(url, user, password);
//            System.out.println("connected successfully");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return con;
    }

}
