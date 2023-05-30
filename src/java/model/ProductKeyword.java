/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author User
 */
public class ProductKeyword {
    private Product product;
    private double find;

    public ProductKeyword(Product product, double find) {
        this.product = product;
        this.find = find;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getFind() {
        return find;
    }

    public void setFind(double find) {
        this.find = find;
    }

    @Override
    public String toString() {
        return "ProductKeyword{" + "product=" + product + ", find=" + find + '}';
    }
    
}
