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
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vinh
 */
public class OrderDAO_DA {
    public static int getSoLuongSanPhamDaBan(){
        try ( Connection c = openConnection()) {
            String select = "SELECT sum(quantity) as daban FROM mydb.order where delivery_status = \"Đã giao\"";
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
            String select = "SELECT sum(total_amount) as tong FROM mydb.order";
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
            String select = "SELECT sum(total_amount) as tong FROM mydb.order o where o.order_time > curdate();";
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("tong");
            }
        } catch (SQLException ex) {
            
        }
        return 0;
        
    }
}
    

