/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dao.TRUC_OderDAO;
import java.util.ArrayList;

/**
 *
 * @author hi
 */
public class TRUC_Order {
    int orderId;
    int userId;
    int quantity;//so luong
    String phone; // so dien thoi
    String address;//dia chi nhan
    String orderTime;//dia chi nhan
    String deliveryStatus; // trang thai don
    String paymentMenthod; // phuong thuc thanh toan
    float totalAmount; // gia tien
    int wareHouseID;// chi tiet san pham
    WareHouse wh;
    Product p;

    public TRUC_Order() {
    }

    public TRUC_Order(int orderId, int userId, int quantity, String phone, String address, String orderTime, String deliveryStatus, String paymentMenthod, float totalAmount, int wareHouseID, WareHouse wh, Product p) {
        this.orderId = orderId;
        this.userId = userId;
        this.quantity = quantity;
        this.phone = phone;
        this.address = address;
        this.orderTime = orderTime;
        this.deliveryStatus = deliveryStatus;
        this.paymentMenthod = paymentMenthod;
        this.totalAmount = totalAmount;
        this.wareHouseID = wareHouseID;
        this.wh = wh;
        this.p = p;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public String getDeliveryStatus() {
        return deliveryStatus;
    }

    public void setDeliveryStatus(String deliveryStatus) {
        this.deliveryStatus = deliveryStatus;
    }

    public String getPaymentMenthod() {
        return paymentMenthod;
    }

    public void setPaymentMenthod(String paymentMenthod) {
        this.paymentMenthod = paymentMenthod;
    }

    public float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public int getWareHouseID() {
        return wareHouseID;
    }

    public void setWareHouseID(int wareHouseID) {
        this.wareHouseID = wareHouseID;
    }

    public WareHouse getWh() {
        return wh;
    }

    public void setWh(WareHouse wh) {
        this.wh = wh;
    }

    public Product getP() {
        return p;
    }

    public void setP(Product p) {
        this.p = p;
    }

    

    public static ArrayList<TRUC_Order> ListOders(String user_id, String trangThai){
        return TRUC_OderDAO.getOrder(user_id, trangThai);
    }
    public static void xoaOrder(String id_order){
        TRUC_OderDAO.xoaOrder(id_order);
    }
}
