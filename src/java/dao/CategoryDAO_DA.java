/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category_DA;
import model.ThuNhapNgay_DA;
import static dao.UserDAO.openConnection;

/**
 *
 * @author Vinh
 */
public class CategoryDAO_DA {
     public static List<Category_DA> getDanhMucSanPham(){
        List<Category_DA> list = new ArrayList<>();
        try ( Connection c = openConnection()) {
            String select = "SELECT c.category_id, c.name,sum(o.quantity) as tongdaban FROM lionelronaldo.category c, lionelronaldo.product p, lionelronaldo.order o, lionelronaldo.warehouse w\n" +
                            " where c.category_id = p.category_id \n" +
                            " and p.product_id = w.product_id \n" +
                            " and o.warehouse_id = w.warehouse_id\n" +
                            " group by c.category_id";
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("category_id");
                String name = rs.getString("name");
                int tong = rs.getInt("tongdaban");
                list.add(new Category_DA(id,name,tong));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
        
    }
}
