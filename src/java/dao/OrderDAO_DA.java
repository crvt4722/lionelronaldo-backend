/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.UserDAO.openConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ThuNhapNgay_DA;

/**
 *
 * @author Vinh
 */
public class OrderDAO_DA {
    public static int getSoLuongSanPhamDaBan(){
        try ( Connection c = openConnection()) {
            String select = "SELECT sum(quantity) as daban FROM lionelronaldo.order where delivery_status = \"Đang vận chuyển\"";
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("daban");
            }
        } catch (SQLException ex) {
            
        }
        return 0;
    }
    ;
    public static int getTongDoangThu(){
        try ( Connection c = openConnection()) {
            String select = "SELECT sum(total_amount) as tong FROM lionelronaldo.order";
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("tong");
            }
        } catch (SQLException ex) {
            
        }
        return 0;
    }
    public static int getThuNhapHomNay(){
        try ( Connection c = openConnection()) {
            String select = "SELECT sum(total_amount) as tong FROM lionelronaldo.order o where o.order_time > curdate();";
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("tong");
            }
        } catch (SQLException ex) {
            
        }
        return 0;
        
    }
    public static List<ThuNhapNgay_DA> getThuNhapHangThang(){
        List<ThuNhapNgay_DA> tnThang = new ArrayList<>();
        try ( Connection c = openConnection()) {
            String select = "SELECT sum(total_amount) as tongtien, date(od.order_time) as ngay FROM lionelronaldo.order od\n" +
                            "where month(od.order_time) = month(now())\n" +
                            "group by ngay";
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int tongtien = rs.getInt("tongtien");
                String ngay = rs.getString("ngay");
                tnThang.add(new ThuNhapNgay_DA(tongtien,ngay));
            }
        } catch (SQLException ex) {
            
        }
        return tnThang;
        
    }
}
    

