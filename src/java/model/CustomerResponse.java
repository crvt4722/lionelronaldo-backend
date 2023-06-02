/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Time;
import java.util.Date;

/**
 *
 * @author User
 */
public class CustomerResponse {
    private String userName, comment;
    private Date responseTime;
    private double rating;

    public CustomerResponse(String userName, String comment, double rating, Date responseTime) {
        this.userName = userName;
        this.comment = comment;
        this.responseTime = responseTime;
        this.rating = rating;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getComment() {
        return comment;
    }

    public void setCommentContent(String comment) {
        this.comment = comment;
    }

    public Date getResponseTime() {
        return responseTime;
    }

    public void setResponseTime(Date responseTime) {
        this.responseTime = responseTime;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "CustomerResponse{" + "userName=" + userName + ", commentContent=" + comment + ", responseTime=" + responseTime + ", rating=" + rating + '}';
    }
            
}
