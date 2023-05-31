package model;

public class Order {
    private int id;
    private String customerName, phone, address, dateTime, productName, size;
    private int quantity, totalAmount; 
    private String paymentMethod, deliveryStatus; 

    public Order(int id, String customerName, String phone, String address, String dateTime, String productName, String size, int quantity, int totalAmount, String paymentMethod, String deliveryStatus) {
        this.id = id;
        this.customerName = customerName;
        this.phone = phone;
        this.address = address;
        this.dateTime = dateTime;
        this.productName = productName;
        this.size = size;
        this.quantity = quantity;
        this.totalAmount = totalAmount;
        this.paymentMethod = paymentMethod;
        this.deliveryStatus = deliveryStatus;
    }

    public int getId() {
        return id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public String getDateTime() {
        return dateTime;
    }

    public String getProductName() {
        return productName;
    }

    public String getSize() {
        return size;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public String getDeliveryStatus() {
        return deliveryStatus;
    }
    
    
}
