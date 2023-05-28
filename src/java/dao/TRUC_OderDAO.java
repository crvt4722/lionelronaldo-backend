/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.TRUC_Order;

/**
 *
 * @author hi
 */
public class TRUC_OderDAO {
    public static Connection openConnection(){
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/mydb";
        String user = "root";
        String password = "27082002";
        Connection conn = null;
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return conn;
    }
    public static ArrayList<TRUC_Order> getOrder(String id, String ds){
        ArrayList<TRUC_Order> res = new ArrayList<>();
        try (Connection c = openConnection()){
            String select = "SELECT * FROM order WHERE user_id = '%s' AND delivery_status = '%s'";
            select = String.format(select, id, ds);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int st1 = Integer.parseInt(rs.getString("order_id") );
                int st2 = Integer.parseInt(rs.getString("user_id") );
                int st3 = Integer.parseInt(rs.getString("quantity") );
                String st4 = rs.getString("phone");
                String st5 = rs.getString("address");
                String st6 = rs.getString("size");
                String st7 = rs.getString("delivery_status");
                String st8 = rs.getString("payment_method");
                float st9 = Float.parseFloat( rs.getString("total_amount") );
                int st10 = Integer.parseInt(rs.getString("warehouse_id") );
                res.add(new TRUC_Order(st1, st2, st3, st4, st5, st6, st7, st8, st9, st10));
            }
            return res;
        } 
        catch (Exception e) {
        }
        return res;
    }
}
