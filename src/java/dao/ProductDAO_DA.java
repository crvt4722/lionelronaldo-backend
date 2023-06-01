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


public class ProductDAO_DA {
     public static int getSoLuongSanPham(){
        try ( Connection c = openConnection()) {
            String select = "SELECT count(*) as tongSanPham FROM mydb.product;";
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("tongSanPham");
            }
        } catch (SQLException ex) {
            
        }
        return 0;
    }
}
