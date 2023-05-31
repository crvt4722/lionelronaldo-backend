/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;


/**
 *
 * @author User
 */
public class Product {
    private int productId, categoryId, originPrice, sale, price, numberOfRating, soldQuantity;
    private String name, description, gender, brand, categoryName;
    private ArrayList<String> imageLinks;
    private ArrayList<String> sizes;
    private ArrayList<Integer> availableQuantityInWarehouse;
    private ArrayList<String> keywords;
    private double avgRating;
    
    public Product(){
        
    }
    public Product(int productId, int categoryId, int originPrice, int sale, String name, String description, String gender, String brand, ArrayList<String> imageLinks) {
        this.productId = productId;
        this.categoryId = categoryId;
        this.originPrice = originPrice;
        this.sale = sale;
        this.price = this.originPrice - this.originPrice * this.sale / 100;
        this.name = name;
        this.description = description;
        this.gender = gender;
        this.brand = brand;
        this.imageLinks = imageLinks;
    }

    public void setImageLinks(ArrayList<String> imageLinks) {
        this.imageLinks = imageLinks;
    }

    public int getProductId() {
        return productId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public int getOriginPrice() {
        return originPrice;
    }

    public int getSale() {
        return sale;
    }

    public int getPrice() {
        return price;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getGender() {
        return gender;
    }

    public String getBrand() {
        return brand;
    }

    public ArrayList<String> getImageLinks() {
        return imageLinks;
    }

    public int getNumberOfRating() {
        return numberOfRating;
    }

    public void setNumberOfRating(int numberOfRating) {
        this.numberOfRating = numberOfRating;
    }

    public double getAvgRating() {
        return avgRating;
    }
    
    public String getAvgRatingString() {
        if(this.avgRating - (int)(this.avgRating) == 0){
            return String.format("%.0f", this.avgRating);
        }
        return String.format("%.1f", this.avgRating);
    }

    public void setAvgRating(double avgRating) {
        this.avgRating = avgRating;
    }

    public int getSoldQuantity() {
        return soldQuantity;
    }

    public void setSoldQuantity(int soldQuantity) {
        this.soldQuantity = soldQuantity;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public ArrayList<String> getKeywords() {
        return keywords;
    }

    public void setKeywords(ArrayList<String> keywords) {
        this.keywords = keywords;
    }

    public ArrayList<String> getSizes() {
        return sizes;
    }

    public void setSizes(ArrayList<String> sizes) {
        this.sizes = sizes;
    }

    public ArrayList<Integer> getAvailableQuantityInWarehouse() {
        return availableQuantityInWarehouse;
    }

    public void setAvailableQuantityInWarehouse(ArrayList<Integer> availableQuantityInWarehouse) {
        this.availableQuantityInWarehouse = availableQuantityInWarehouse;
    }
    
    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", categoryId=" + categoryId + ", originPrice=" + originPrice + ", sale=" + sale + ", price=" + price + ", numberOfRating=" + numberOfRating + ", soldQuantity=" + soldQuantity + ", name=" + name + ", description=" + description + ", gender=" + gender + ", brand=" + brand + ", categoryName=" + categoryName + ", imageLinks=" + imageLinks + ", avgRating=" + avgRating + '}';
    }
      
}