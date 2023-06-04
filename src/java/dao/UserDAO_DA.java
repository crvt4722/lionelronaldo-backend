/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.DBConfig.openConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.User_DA;

/**
 *
 * @author Vinh
 */
public class UserDAO_DA {
    public static int getSoLuongUser(){
        try ( Connection c = openConnection()) {
            String select = "SELECT count(*) as soUser FROM mydb.user_profile u where u.role = \"user\";";
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("soUser");
            }
        } catch (SQLException ex) {
            
        }
        return 0;
    }
    public static List<User_DA> getDanhSachUserGiau(){
        List<User_DA> list = new ArrayList<>();
         try ( Connection c = openConnection()) {
            String select = "SELECT u.*,sum(od.total_amount) as tongdaban " +
                            "FROM mydb.user_profile u, mydb.product p, mydb.order od, mydb.warehouse w\n" +
                            " where u.user_id = od.user_id and u.role = \"user\"\n" +
                            " and p.product_id = w.product_id and od.warehouse_id = w.warehouse_id \n" +
                            " and month(now()) = month(od.order_time)\n" +
                            " group by od.user_id\n" +
                            " order by  tongdaban DESC\n" +
                            " limit 5";
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                 
                int id = rs.getInt("user_id");
                String name = rs.getString("fullname");
                String email = rs.getString("email");
                String pass = rs.getString("password");
                String role = rs.getString("role");
                int tong = rs.getInt("tongdaban");
                list.add(new User_DA(id,name,email,pass,role,tong));                            
            }
         }catch (SQLException ex) {
            
        }
         return list;
    }
}
