/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.ProductDAO.openConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Product;
import java.util.*;
import model.CustomerResponse;

/**
 *
 * @author User
 */
public class OrderDAO {

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

    public static ArrayList<String> getPhoneAndAddressOfLastOrder(int userId) {
        try ( Connection c = openConnection()) {
            String select = String.format("select phone, address from `order`\n"
                    + "where user_id = %s\n"
                    + "order by order_id desc\n"
                    + "limit 1", userId);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            ArrayList<String> phoneAndAddress = new ArrayList<>();

            if (rs.next()) {
                phoneAndAddress.add(rs.getString("phone"));
                phoneAndAddress.add(rs.getString("address"));
                return phoneAndAddress;
            }
            return null;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static int getWarehouseId(int productId, String size) {
        try ( Connection c = openConnection()) {
            String select = String.format("select warehouse_id\n"
                    + "from warehouse\n"
                    + "where product_id = %s and size = '%s'", productId, size);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("warehouse_id");
            }
            return 0;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public static void updateAvaibleQuantityOfWarehouse(int warehouseId, int orderQuantity) {
        try ( Connection c = openConnection()) {
            String update = String.format("update warehouse\n"
                    + "set quantity = quantity - %s\n"
                    + "where warehouse_id = %s", orderQuantity, warehouseId);
            PreparedStatement ps = c.prepareStatement(update);
            ps.executeUpdate();
            ps.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static void insertOrder(int userId, int productId, int quantity, String phone, String address, String size, String paymentMethod, int totalAmount, String status) {
//        System.out.println(userId + " " + quantity + " " + size + " " + phone + " " + address + " " + paymentMethod + " " + totalAmount);
        try ( Connection c = openConnection()) {
//            updateAvaibleQuantityOfWarehouse(getWarehouseId(productId, size), quantity);
            String insert = String.format("insert into `order`\n"
                    + "values(null, %s, %s, '%s', '%s', '%s', "
                    + "'%s', '%s', %s, %s, now())", userId, quantity, phone, address, size, status,paymentMethod, totalAmount, getWarehouseId(productId, size));
            PreparedStatement ps = c.prepareStatement(insert);
            ps.executeUpdate();
            ps.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static int getTotalAmountOfEachOrder(String orderId) {
        try ( Connection c = openConnection()) {
            String update = String.format("select round(O.quantity * (P.origin_price - P.sale * P.origin_price / 100)) as totalAmount \n"
                    + "from product as P, warehouse as WH, `order` as O\n"
                    + "where P.product_id = WH.product_id\n"
                    + "and O.warehouse_id = WH.warehouse_id\n"
                    + "and O.order_id = %s", orderId);
            PreparedStatement ps = c.prepareStatement(update);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt("totalAmount");
            }
            return 0;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public static void udpateDeliveryStutus(String status, String phone, String address, String paymentMethod, int totalAmount, String orderId) {
//        System.out.println(userId + " " + quantity + " " + size + " " + phone + " " + address + " " + paymentMethod + " " + totalAmount);
        try ( Connection c = openConnection()) {
//            updateAvaibleQuantityOfWarehouse(getWarehouseId(productId, size), quantity);
            String update = String.format("update `order`\n"
                    + "set delivery_status = '%s', phone = \"%s\", address = \"%s\", payment_method = \"%s\", total_amount = %s, order_time = now()\n"
                    + "where order_id = %s", status, phone, address, paymentMethod, getTotalAmountOfEachOrder(orderId), orderId);
            PreparedStatement ps = c.prepareStatement(update);
            ps.executeUpdate();
            ps.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
