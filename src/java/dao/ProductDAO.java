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
import model.CustomerResponse;

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

    public static Map<Integer, String> getAllCategoriesMap() {
        try ( Connection c = openConnection()) {
            String select = String.format("select * from category");
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            HashMap<Integer, String> mp = new HashMap<>();
            while (rs.next()) {
                mp.put(rs.getInt("category_id"), rs.getString("name"));
            }
            return mp;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static void setCategoryForEachProduct(ArrayList<Product> productsList) {
        Map<Integer, String> categoryMap = getAllCategoriesMap();
        for (Product product : productsList) {
            product.setCategoryName(categoryMap.get(product.getCategoryId()));
        }
    }

    public static ArrayList<String> getAllKeywordsByProductId(int productId) {
        try ( Connection c = openConnection()) {
            String select = String.format("select * from keywords\n"
                    + "where product_id = %s;", productId);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            ArrayList<String> keywordsList = new ArrayList<>();
            while (rs.next()) {
                keywordsList.add(rs.getString("name"));
            }
            return keywordsList;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static ArrayList<String> getAllKeywords() {
        try ( Connection c = openConnection()) {
            String select = String.format("select distinct name from keywords");
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            ArrayList<String> keywordsList = new ArrayList<>();
            HashSet<String> se = new HashSet<>();
            while (rs.next()) {
                String key = rs.getString("name");
                if (!se.contains(key)) {
                    keywordsList.add(key);
                    se.add(key);
                }
            }
            return keywordsList;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static void setKeywordsForEachProduct(ArrayList<Product> productsList) {
        for (Product product : productsList) {
            product.setKeywords(getAllKeywordsByProductId(product.getProductId()));
        }
    }

    public static ArrayList<String> getSizesByProductId(int productId) {
        try ( Connection c = openConnection()) {
            String select = String.format("select size\n"
                    + "from warehouse as WH, product as P\n"
                    + "where WH.product_id = P.product_id\n"
                    + "and P.product_id = %s;", productId);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            ArrayList<String> sizes = new ArrayList<>();
            while (rs.next()) {
                sizes.add(rs.getString("size"));
            }
            return sizes;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static void setSizesForEachProduct(ArrayList<Product> productsList) {
        for (Product product : productsList) {
            product.setSizes(getSizesByProductId(product.getProductId()));
        }
    }

    public static ArrayList<Integer> getAvailableQuantityByProductId(int productId) {
        try ( Connection c = openConnection()) {
            String select = String.format("select *\n"
                    + "from warehouse\n"
                    + "where product_id = %s", productId);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            ArrayList<Integer> availableQuantity = new ArrayList<>();
            while (rs.next()) {
                availableQuantity.add(rs.getInt("quantity"));
            }
            return availableQuantity;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static void setAvailableQuantityInWarehouseForEachProduct(ArrayList<Product> productsList) {
        for (Product product : productsList) {
            product.setAvailableQuantityInWarehouse(getAvailableQuantityByProductId(product.getProductId()));
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
            setCategoryForEachProduct(productsList);
            setKeywordsForEachProduct(productsList);
            setSizesForEachProduct(productsList);
            setAvailableQuantityInWarehouseForEachProduct(productsList);

            System.out.println(">>>test");
            System.out.println(productsList.get(0));
            return productsList;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static Product getProductById(int productId) {
        ArrayList<Product> productsList = getAllProduct();
        for (Product product : productsList) {
            if (product.getProductId() == productId) {
                return product;
            }
        }
        return null;
    }

    public static ArrayList<CustomerResponse> getCustomerResponseByProductId(int productId) {
        try ( Connection c = openConnection()) {
            String select = String.format("select U.fullname, CR.comment, CR.rating, CR.response_time\n"
                    + "from user_profile as U, product as P, warehouse as W, `order` as O, customer_response as CR\n"
                    + "where P.product_id = W.product_id\n"
                    + "and W.warehouse_id = O.warehouse_id\n"
                    + "and O.user_id = U.user_id\n"
                    + "and CR.order_id = O.order_id\n"
                    + "and P.product_id = %s;", productId);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            ArrayList<CustomerResponse> productResponses = new ArrayList<>();

            while (rs.next()) {
                productResponses.add(new CustomerResponse(rs.getString("fullname"), rs.getString("comment"), rs.getDouble("rating"), rs.getDate("response_time")));
            }
//            for(CustomerResponse x : productResponses){
//                System.out.println(x);
//            }
            return productResponses;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
