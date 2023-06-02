/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

public class ThuNhapNgay_DA {
    private int tien;
    private String ngay;

    public ThuNhapNgay_DA() {
    }

    public ThuNhapNgay_DA(int tien, String ngay) {
        this.tien = tien;
        this.ngay = ngay;
    }

    
    public int getTien() {
        return tien;
    }

    public void setTien(int tien) {
        this.tien = tien;
    }

    public String getNgay() {
        return ngay;
    }

    public void setNgay(String ngay) {
        this.ngay = ngay;
    }
    
}
