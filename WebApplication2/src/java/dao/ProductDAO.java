/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Product;
import java.util.*;

/**
 *
 * @author User
 */
public class ProductDAO {

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

    public static void xuLySoLuongDaBan(ArrayList<Product> products) {
        try ( Connection c = openConnection()) {
            String select = String.format("select SP.idSanPham, sum(soLuong) AS soLuongDaBan\n"
                    + "from san_pham AS SP, dat_hang AS DH\n"
                    + "where SP.idSanPham = DH.idSanPham\n"
                    + "group by SP.idSanPham");
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            Map<Integer, Integer> mp = new TreeMap<>();
            while (rs.next()) {
                mp.put(rs.getInt("idSanPham"), rs.getInt("soLuongDaBan"));
            }
            for(Product product : products) {
                int id = product.getIdSanPham();
                if(mp.containsKey(id)){
                    product.setSoLuongDaBan(mp.get((id)));
                }
                else{
                    product.setSoLuongDaBan(0);
                }
            }
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static void xuLyDanhGia(ArrayList<Product> products) {
        try ( Connection c = openConnection()) {
            String select = String.format("select SP.idSanPham, AVG(DG.so_sao) as soSaoDanhGia, count(*) AS soLuotDanhGia\n"
                    + "from san_pham AS SP, danh_gia AS DG\n"
                    + "where SP.idSanPham = DG.idSanPham\n"
                    + "group by SP.idSanPham");
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            Map<Integer, String[]> mp = new TreeMap<>();
            while (rs.next()) {
                int idSanPham = rs.getInt("idSanPham");
                double soSaoDanhGia = rs.getDouble("soSaoDanhGia");
                int soLuotDanhGia = rs.getInt("soLuotDanhGia");
                String[] arr = new String[2];
                arr[0] = "" + soSaoDanhGia;
                arr[1] = "" + soLuotDanhGia;
                mp.put(idSanPham, arr);
            }
            for(Product product : products) {
                int id = product.getIdSanPham();
                if(mp.containsKey(id)){
                    product.setSoSaoDanhGia(Double.parseDouble(mp.get(id)[0]));
                    product.setSoLuotDanhGia(Integer.parseInt(mp.get(id)[1]));
                }
                else{
                    product.setSoSaoDanhGia(0);
                    product.setSoLuotDanhGia(0);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static ArrayList<Product> getAllProduct() {
        try ( Connection c = openConnection()) {
            String select = String.format("select * from san_pham");
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            ArrayList<Product> res = new ArrayList<>();
            while (rs.next()) {
                res.add(new Product(rs.getInt("idSanPham"), rs.getInt("idDanhMuc"), rs.getString("tenSanPham"), rs.getString("moTa"), rs.getInt("giaCu"), rs.getInt("giaHienTai"), rs.getString("linkAnh")));
            }
            xuLySoLuongDaBan(res);
            xuLyDanhGia(res);
            return res;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
