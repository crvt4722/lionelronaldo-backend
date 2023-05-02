/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author User
 */
public class Product {
    private String tenSanPham, moTa, linkAnh;
    private int idSanPham, idDanhMuc, giaCu, giaHienTai, soLuongDaBan, soLuotDanhGia;
    private double soSaoDanhGia;

    public Product(int idSanPham, int idDanhMuc, String tenSanPham, String moTa, int giaCu, int giaHienTai, String linkAnh) {
        this.idSanPham = idSanPham;
        this.tenSanPham = tenSanPham;
        this.moTa = moTa;
        this.linkAnh = linkAnh;
        this.idDanhMuc = idDanhMuc;
        this.giaCu = giaCu;
        this.giaHienTai = giaHienTai;
    }

    public int getIdSanPham() {
        return idSanPham;
    }

    public int getGiaHienTai() {
        return giaHienTai;
    }

    public int getIdDanhMuc() {
        return idDanhMuc;
    }

    public double getSoSaoDanhGia() {
        return soSaoDanhGia;
    }

    public void setSoLuongDaBan(int soLuongDaBan) {
        this.soLuongDaBan = soLuongDaBan;
    }

    public void setSoSaoDanhGia(double soSaoDanhGia) {
        this.soSaoDanhGia = soSaoDanhGia;
    }

    public void setSoLuotDanhGia(int soLuotDanhGia) {
        this.soLuotDanhGia = soLuotDanhGia;
    }

    
    
    
    
}
