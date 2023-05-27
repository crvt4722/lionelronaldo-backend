/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.ProductDAO.openConnection;
import static dao.ProductDAO.xuLyDanhGia;
import static dao.ProductDAO.xuLySoLuongDaBan;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;
import java.util.*;

/**
 *
 * @author User
 */
public class UserDAO {

    public static Connection openConnection() {
        Connection conn = null;
        try {
            System.out.println("Hello from DBConfig.driver " + DBConfig.driver);
            Class.forName(DBConfig.driver);
            conn = DriverManager.getConnection(DBConfig.url, DBConfig.user, DBConfig.password);
            System.out.println("connected successfully");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return conn;
    }

    public static User checkSignin(String email, String password) {
        try ( Connection c = openConnection()) {
            String select = String.format("select * from nguoi_dung where email = '%s' and password = '%s'", email, password);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return new User(rs.getString("name"), rs.getString("email"), rs.getString("phoneNumber"), rs.getString("password"));
            }
            return null;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
    public static boolean checkSignup(String name, String email, String phoneNumber, String password) {
        try ( Connection c = openConnection()) {
            String select = String.format("insert into nguoi_dung\n" +
"values(null, '%s', '%s', '%s', '%s')", name, email, phoneNumber,password);
            PreparedStatement ps = c.prepareStatement(select);
            ps.executeQuery();
            return true;
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
}
