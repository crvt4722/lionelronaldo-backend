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

/**
 *
 * @author Vinh
 */
public class UserDAO_DA {
    public static int getSoLuongUser(){
        try ( Connection c = openConnection()) {
            String select = "SELECT count(*) as soUser FROM mydb.user_profile u where u.role = \"user\";";
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("soUser");
            }
        } catch (SQLException ex) {
            
        }
        return 0;
    }
}
