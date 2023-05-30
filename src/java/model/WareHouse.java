/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dao.TRUC_OderDAO;

/**
 *
 * @author hi
 */
public class WareHouse {
    int productId, quantity, wareHouseId;
    String size;

    public WareHouse() {
    }

    public WareHouse(int productId, int quantity, int wareHouseId, String size) {
        this.productId = productId;
        this.quantity = quantity;
        this.wareHouseId = wareHouseId;
        this.size = size;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getWareHouseId() {
        return wareHouseId;
    }

    public void setWareHouseId(int wareHouseId) {
        this.wareHouseId = wareHouseId;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }
    public static WareHouse getWareHouse(String id_wh){
        return TRUC_OderDAO.getWareHouse(id_wh);
    }
}
