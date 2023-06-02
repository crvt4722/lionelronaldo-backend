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
import model.Product;
import model.TRUC_Order;
import model.WareHouse;

/**
 *
 * @author hi
 */
public class TRUC_OderDAO {

    public static Connection openConnection() {
        String driver = "com.mysql.cj.jdbc.Driver";
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

    public static ArrayList<TRUC_Order> getOrder(String id, String trangThai) {
        ArrayList<TRUC_Order> res = new ArrayList<>();
        try ( Connection c = openConnection()) {

            String select = "SELECT * \n"
                    + "FROM mydb.order as O, mydb.product as P, mydb.warehouse as W\n"
                    + "WHERE user_id = %s and delivery_status = '%s'  and W.warehouse_id = O.warehouse_id and P.product_id = W.product_id";
            //System.out.println(id +  ds);
            select = String.format(select, id, trangThai);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int st1 = Integer.parseInt(rs.getString("order_id"));
                int st2 = Integer.parseInt(rs.getString("user_id"));
                int st3 = Integer.parseInt(rs.getString("quantity"));
                String st4 = rs.getString("phone");
                String st5 = rs.getString("address");
                String st6 = rs.getString("order_time");
                String st7 = rs.getString("delivery_status");
                String st8 = rs.getString("payment_method");
                String st80 = getComment("" + st1);
                float st9 = Float.parseFloat(rs.getString("total_amount"));
                int st10 = Integer.parseInt(rs.getString("warehouse_id"));
                WareHouse st11 = getWareHouse(rs.getString("warehouse_id"));
                Product st12 = getProduct(st11.getProductId() + "");
                res.add(new TRUC_Order(st1, st2, st3, st4, st5, st6, st7, st8, st80, st9, st10, st11, st12));
            }
            //System.out.println(res.size());
            return res;
        } catch (Exception e) {
        }
        return res;
    }

    public static WareHouse getWareHouse(String id_wh) {
        try ( Connection c = openConnection()) {

            String select = "SELECT * FROM mydb.warehouse WHERE warehouse_id = '%s'";
            //System.out.println(id +  ds);
            select = String.format(select, id_wh);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int st1 = Integer.parseInt(rs.getString("product_id"));
                int st2 = Integer.parseInt(rs.getString("quantity"));
                int st3 = Integer.parseInt(rs.getString("warehouse_id"));
                String st4 = rs.getString("size");
                return new WareHouse(st1, st2, st3, st4);
            }
            //System.out.println(res.size());
            return new WareHouse();
        } catch (Exception e) {
        }
        return new WareHouse();
    }

    public static ArrayList<String> getListAnh(String id_p) {
        ArrayList<String> list = new ArrayList<>();
        try ( Connection c = openConnection()) {

            String select = "SELECT * FROM mydb.product_image WHERE product_id = '%s'";
            //System.out.println(id +  ds);
            select = String.format(select, id_p);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("image_link"));
            }
            if (list.isEmpty()) {
                list.add("https://i8.amplience.net/i/jpl/jd_533345_a?qlt=92&w=750&h=957&v=1&fmt=auto");
            }
            return list;
        } catch (Exception e) {
        }
        return list;
    }

    public static Product getProduct(String id_p) {
        try ( Connection c = openConnection()) {

            String select = "SELECT * FROM mydb.product WHERE product_id = '%s'";
            //System.out.println(id +  ds);
            select = String.format(select, id_p);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int st1 = Integer.parseInt(rs.getString("product_id"));
                int st2 = Integer.parseInt(rs.getString("category_id"));
                int st3 = Integer.parseInt(rs.getString("origin_price"));
                int st4 = Integer.parseInt(rs.getString("sale"));

                String st5 = rs.getString("name");
                String st6 = rs.getString("description");
                String st7 = rs.getString("gender");
                String st8 = rs.getString("brand");
                ArrayList<String> st9 = getListAnh(id_p);
                return new Product(st1, st2, st3, st4, st5, st6, st7, st8, st9);
            }
            return new Product();
        } catch (Exception e) {
        }
        return new Product();
    }

    public static void xoaOrder(String id_order) {
        try ( Connection c = openConnection()) {
            System.out.println(id_order);
            String select = "delete from mydb.order WHERE order_id = %s;";
            //System.out.println(id +  ds);
            select = String.format(select, id_order, id_order);
            PreparedStatement ps = c.prepareStatement(select);
            ps.executeUpdate();
            ps.close();
            System.out.println(id_order);
        } catch (Exception e) {
        }
    }

    public static String getComment(String orderId) {
        try ( Connection c = openConnection()) {

            String select = "select * \n"
                    + "from mydb.customer_response as CR\n"
                    + "where CR.order_id = %s";
            //System.out.println(id +  ds);
            select = String.format(select, orderId);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString("comment");
            }
            return "";
        } catch (Exception e) {
        }
        return "";
    }
}
