package dao;

import java.sql.*;
import java.util.*;
import model.UserProfile;

public class UserDAO {
    public static Connection openConnection(){
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/lionelronaldo";
        String user = "root";
        String password = "04072002";
        Connection conn = null;
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return conn;
    }
    
    public static boolean insertMessage(String nameShown, String receiver, String message) {
        try (Connection c = openConnection()){
            String insert = "INSERT INTO message VALUES (?, ?, ?)";
            PreparedStatement ps = c.prepareStatement(insert);
            ps.setString(1, nameShown);
            ps.setString(2, receiver);
            ps.setString(3, message);
            
            return ps.execute();
        } catch (Exception e) {
        }
        return false;
    }
    
    public static boolean checkUserNameExists(String userName) {
        try (Connection c = openConnection()){
            String select = "SELECT * FROM user_idol where user_name = ?";
            PreparedStatement ps = c.prepareStatement(select);
            ps.setString(1, userName);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()) return true;
        } catch (Exception e) {
        }
        return false;
    }
    
    public static boolean changeIdol(String userName, String idol) {
        try (Connection c = openConnection()){
            String update = "UPDATE user_idol SET idol = ? WHERE user_name = ?";
            PreparedStatement ps = c.prepareStatement(update);
            
            ps.setString(1, idol);
            ps.setString(2, userName);
            
            ps.execute();
            return true;
        } catch (Exception e) {
        }
        return false;
    }
    
    public static boolean insertIdol(String userName, String idol) {
        try (Connection c = openConnection()){
            String insert = "INSERT INTO user_idol VALUES (?, ?)";
            PreparedStatement ps = c.prepareStatement(insert);
            ps.setString(1, userName);
            ps.setString(2, idol);
            
            return ps.execute();
        } catch (Exception e) {
        }
        return false;
    }
    
    public static ArrayList<String> getMessages(String receiver){
        
        ArrayList<String> arr = new ArrayList<>();
        
        try (Connection c = openConnection()){
            String select = "SELECT * FROM message WHERE to_ = ?";
            PreparedStatement ps = c.prepareStatement(select);
            ps.setString(1, receiver);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                String sender = rs.getString("from_");
                String content = rs.getString("content");
                arr.add(sender + ": "+content);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr;
    }
    
    public static HashMap<String, Long> getNumberOfVotes(){
        HashMap<String, Long> hm = new HashMap<>();
        try (Connection c = openConnection()){
            String select = "SELECT idol, COUNT(*) as cnt FROM user_idol GROUP BY idol;";
            PreparedStatement ps = c.prepareStatement(select);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                String idol = rs.getString("idol");
                Long cnt = rs.getLong("cnt");
                hm.put(idol, cnt);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return hm;
    }
    
    public static boolean isDuplicateEmail(String email){
        try (Connection c = openConnection()){
            String select = "SELECT * FROM user_profile WHERE email = ?";
            PreparedStatement ps = c.prepareStatement(select);
            ps.setString(1, email);
            return ps.executeQuery().next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static boolean insertUserProfile(String fullname, String email, String password ){
        try (Connection c = openConnection()){
            String insert = "INSERT INTO user_profile VALUES (?, ?, ?)";
            PreparedStatement ps = c.prepareStatement(insert);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.execute();
            
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static boolean checkLogin(String email, String password){
        try (Connection c = openConnection()){
            String select = "SELECT * FROM user_profile WHERE email = ? AND password = ?";
            PreparedStatement ps = c.prepareStatement(select);
            ps.setString(1, email);
            ps.setString(2, password);
            return ps.executeQuery().next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static String getFullname(String email){
        String result = "";
        try (Connection c = openConnection()){
            String select = "SELECT * FROM user_profile WHERE email = ?";
            PreparedStatement ps = c.prepareStatement(select);
            ps.setString(1, email);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()) result = rs.getString("fullname");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
