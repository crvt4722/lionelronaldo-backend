/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.OrderDAO.getWarehouseId;
import static dao.OrderDAO.openConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class CustomerResponseDAO {

    public static Connection openConnection() {
        Connection conn = null;
        try {
//            System.out.println("Hello from DBConfig.driver " + DBConfig.driver);
            Class.forName(DBConfig.driver);
            conn = DriverManager.getConnection(DBConfig.url, DBConfig.user, DBConfig.password);
//            System.out.println("connected successfully");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return conn;
    }

    public static void insertCustomerResponse(int orderId, String comment, int rating) {
//        System.out.println(userId + " " + quantity + " " + size + " " + phone + " " + address + " " + paymentMethod + " " + totalAmount);
        try ( Connection c = openConnection()) {
//            updateAvaibleQuantityOfWarehouse(getWarehouseId(productId, size), quantity);
            String insert = String.format("insert into customer_response\n"
                    + "values(%s, '%s', %s, now())", orderId, comment, rating);
            PreparedStatement ps = c.prepareStatement(insert);
            ps.executeUpdate();
            ps.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
