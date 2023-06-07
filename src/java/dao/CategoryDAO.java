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
public class CategoryDAO {

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

    public static ArrayList<String> getFeaturedCategory() {
        try ( Connection c = openConnection()) {
            String select = String.format("sselect * \n"
                    + "from category\n"
                    + "limit 8");
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            ArrayList<String> featuredCategories = new ArrayList<>();

            if (rs.next()) {
                featuredCategories.add(rs.getString("name"));
            }
            return featuredCategories;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

}
