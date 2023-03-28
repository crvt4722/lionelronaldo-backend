/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author DELL
 */

import java.sql.*;
public class UserDAO {
    public static Connection openConnection(){
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/lionelronaldo";
        String user = "root";
        String password = "04072002";
        Connection conn = null;
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return conn;
    }
    
    public static boolean insertMessage(String nameShown, String receiver, String message) {
        try (Connection c = openConnection()){
            String insert = "INSERT INTO message VALUES (?, ?, ?)";
            PreparedStatement ps = c.prepareStatement(insert);
            ps.setString(1, nameShown);
            ps.setString(2, receiver);
            ps.setString(3, message);
            
            return ps.execute();
        } catch (Exception e) {
        }
        return false;
    }
}
