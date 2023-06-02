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
     public static ArrayList<String> getListAnh(int id_p){
        ArrayList<String> list = new ArrayList<>();
        try (Connection c = openConnection()){
           
            String select = "SELECT * FROM mydb.product_image WHERE product_id = '%d'";
            //System.out.println(id +  ds);
            select = String.format(select, id_p);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(rs.getString("image_link"));
            }
            if (list.isEmpty()) list.add("https://i8.amplience.net/i/jpl/jd_533345_a?qlt=92&w=750&h=957&v=1&fmt=auto");
            return list;
        } 
        catch (Exception e) {
        }
        return list;
    }
    public static List<Product> getTop5SanPham(){
        List<Product> listP = new ArrayList<>();
        try(Connection c = openConnection()){
            String select = "SELECT p.*,sum(o.quantity) as tongdaban FROM mydb.product p, mydb.order o, mydb.warehouse w\n" +
                            " where p.product_id = w.product_id and o.warehouse_id = w.warehouse_id\n" +
                            " group by p.product_id\n" +
                            " order by  tongdaban DESC\n" +
                            " limit 5";
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int st1 = Integer.parseInt(rs.getString("product_id"));
                int st2 = Integer.parseInt(rs.getString("category_id"));
                int st3 = Integer.parseInt(rs.getString("origin_price"));
                int st4 = Integer.parseInt(rs.getString("sale")); 
                String st5 = rs.getString("name");
                String st6 = rs.getString("description");
                String st7 = rs.getString("gender");
                String st8 = rs.getString("brand");
                ArrayList<String> st9 = getListAnh(st1);
                listP.add(new Product(st1,st2,st3,st4,st5,st6,st7,st8,st9));
            }
        }
        
        catch (SQLException ex) {
            
        }
        return listP;
    }
}
