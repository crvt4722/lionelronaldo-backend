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
public class Category_DA {
    private int id;
    private String name;
    private int tongSPDaBan;

    public Category_DA() {
    }
    public Category_DA(int id, String name) {
        this.id = id;
        this.name = name;
       
    }
    public Category_DA(int id, String name, int tongSPDaBan) {
        this.id = id;
        this.name = name;
        this.tongSPDaBan = tongSPDaBan;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTongSPDaBan() {
        return tongSPDaBan;
    }

    public void setTongSPDaBan(int tongSPDaBan) {
        this.tongSPDaBan = tongSPDaBan;
    }
    
}
