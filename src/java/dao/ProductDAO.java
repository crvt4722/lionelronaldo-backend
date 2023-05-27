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
//            System.out.println("Hello from DBConfig.driver " + DBConfig.driver);
            Class.forName(DBConfig.driver);
            conn = DriverManager.getConnection(DBConfig.url, DBConfig.user, DBConfig.password);
//            System.out.println("connected successfully");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return conn;
    }

//    public static void xuLySoLuongDaBan(ArrayList<Product> products) {
//        try ( Connection c = openConnection()) {
//            String select = String.format("select SP.idSanPham, sum(soLuong) AS soLuongDaBan\n"
//                    + "from san_pham AS SP, dat_hang AS DH\n"
//                    + "where SP.idSanPham = DH.idSanPham\n"
//                    + "group by SP.idSanPham");
//            PreparedStatement ps = c.prepareStatement(select);
//            ResultSet rs = ps.executeQuery();
//            Map<Integer, Integer> mp = new TreeMap<>();
//            while (rs.next()) {
//                mp.put(rs.getInt("idSanPham"), rs.getInt("soLuongDaBan"));
//            }
//            for(Product product : products) {
//                int id = product.getIdSanPham();
//                if(mp.containsKey(id)){
//                    product.setSoLuongDaBan(mp.get((id)));
//                }
//                else{
//                    product.setSoLuongDaBan(0);
//                }
//            }
//            
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//    }
//
//    public static void xuLyDanhGia(ArrayList<Product> products) {
//        try ( Connection c = openConnection()) {
//            String select = String.format("select SP.idSanPham, AVG(DG.so_sao) as soSaoDanhGia, count(*) AS soLuotDanhGia\n"
//                    + "from san_pham AS SP, danh_gia AS DG\n"
//                    + "where SP.idSanPham = DG.idSanPham\n"
//                    + "group by SP.idSanPham");
//            PreparedStatement ps = c.prepareStatement(select);
//            ResultSet rs = ps.executeQuery();
//            Map<Integer, String[]> mp = new TreeMap<>();
//            while (rs.next()) {
//                int idSanPham = rs.getInt("idSanPham");
//                double soSaoDanhGia = rs.getDouble("soSaoDanhGia");
//                int soLuotDanhGia = rs.getInt("soLuotDanhGia");
//                String[] arr = new String[2];
//                arr[0] = "" + soSaoDanhGia;
//                arr[1] = "" + soLuotDanhGia;
//                mp.put(idSanPham, arr);
//            }
//            for(Product product : products) {
//                int id = product.getIdSanPham();
//                if(mp.containsKey(id)){
//                    product.setSoSaoDanhGia(Double.parseDouble(mp.get(id)[0]));
//                    product.setSoLuotDanhGia(Integer.parseInt(mp.get(id)[1]));
//                }
//                else{
//                    product.setSoSaoDanhGia(0);
//                    product.setSoLuotDanhGia(0);
//                }
//            }
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//    }
//
//    public static ArrayList<Product> getAllProduct() {
//        try ( Connection c = openConnection()) {
//            String select = String.format("select * from san_pham");
//            PreparedStatement ps = c.prepareStatement(select);
//            ResultSet rs = ps.executeQuery();
//            ArrayList<Product> res = new ArrayList<>();
//            while (rs.next()) {
//                res.add(new Product(rs.getInt("idSanPham"), rs.getInt("idDanhMuc"), rs.getString("tenSanPham"), rs.getString("moTa"), rs.getInt("giaCu"), rs.getInt("giaHienTai"), rs.getString("linkAnh")));
//            }
//            xuLySoLuongDaBan(res);
//            xuLyDanhGia(res);
//            return res;
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//        return null;
//    }
//    public Product(int productId, int categoryId, int originPrice, int sale, String name, String description, String gender, String brand, ArrayList<String> image_link) {
    public static ArrayList<String> setImagesForProduct(int productId) {

        try ( Connection c = openConnection()) {
            String select = String.format("select * from product_image where product_id = %s", productId);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            ArrayList<String> res = new ArrayList<>();
            while (rs.next()) {
                res.add(rs.getString("image_link"));
            }
            return res;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static void setImagesListForEachProduct(ArrayList<Product> productsList) {
        for (Product product : productsList) {
            ArrayList<String> productImages = setImagesForProduct(product.getProductId());
            product.setImageLinks(productImages);
        }
    }

    public static void setSoldQuantityForEachProduct(ArrayList<Product> productsList) {
        try ( Connection c = openConnection()) {
            for (Product product : productsList) {
                String select = String.format("select sum(O.quantity) as sold_quantity\n"
                        + "from warehouse as WH, product as P, `order` as O\n"
                        + "where WH.product_id = P.product_id\n"
                        + "and O.warehouse_id = WH.warehouse_id\n"
                        + "and WH.product_id = %s", product.getProductId());
                PreparedStatement ps = c.prepareStatement(select);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    product.setSoldQuantity(rs.getInt("sold_quantity"));
                }

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static void setRatingForEachProduct(ArrayList<Product> productsList) {
        try ( Connection c = openConnection()) {
            for (Product product : productsList) {
                String select = String.format("select count(*) as number_of_rating, avg(rating) as avg_rating\n"
                        + "from warehouse as WH, product as P, `order` as O, customer_response as CR\n"
                        + "where WH.product_id = P.product_id\n"
                        + "and O.warehouse_id = WH.warehouse_id\n"
                        + "and CR.order_id = O.order_id\n"
                        + "and WH.product_id = %s", product.getProductId());
                PreparedStatement ps = c.prepareStatement(select);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    product.setNumberOfRating(rs.getInt("number_of_rating"));
                    product.setAvgRating(rs.getDouble("avg_rating"));
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static ArrayList<Product> getAllProduct() {
        try ( Connection c = openConnection()) {
            String select = String.format("select * from product");
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            ArrayList<Product> productsList = new ArrayList<>();
            while (rs.next()) {
                productsList.add(new Product(rs.getInt("product_id"), rs.getInt("category_id"), rs.getInt("origin_price"), rs.getInt("sale"), rs.getString("name"), rs.getString("description"), rs.getString("gender"), rs.getString("brand"), new ArrayList<String>()));
            }
            setImagesListForEachProduct(productsList);
            setSoldQuantityForEachProduct(productsList);
            setRatingForEachProduct(productsList);
            System.out.println(">>>test");
            System.out.println(productsList.get(0));
            return productsList;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
