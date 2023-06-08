/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Vinh
 */
public class User_DA {
    private int user_id;
    private String fullname, email, password, role;
    private int tongdaban;

    public User_DA() {
    }

    public User_DA(int user_id, String fullname, String email, String password, String role, int tongdaban) {
        this.user_id = user_id;
        this.fullname = fullname;
        this.email = email;
        this.password = password;
        this.role = role;
        this.tongdaban = tongdaban;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getTongdaban() {
        return tongdaban;
    }

    public void setTongdaban(int tongdaban) {
        this.tongdaban = tongdaban;
    }
    
}
