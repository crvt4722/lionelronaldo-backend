/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author User
 */
public class SanPham {
    private String tenSanPham, linkAnh;
    private int giaHienTai;

    public SanPham(String tenSanPham, String linkAnh, int giaHienTai) {
        this.tenSanPham = tenSanPham;
        this.linkAnh = linkAnh;
        this.giaHienTai = giaHienTai;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public String getLinkAnh() {
        return linkAnh;
    }

    public int getGiaHienTai() {
        return giaHienTai;
    }

    @Override
    public String toString() {
        return "SanPham{" + "tenSanPham=" + tenSanPham + ", linkAnh=" + linkAnh + ", giaHienTai=" + giaHienTai + '}';
    }

   
    
}
