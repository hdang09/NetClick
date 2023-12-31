/*
     * To change this license header, choose License Headers in Project Properties.
     * To change this template file, choose Tools | Templates
     * and open the template in the editor.
 */
package dto;

import java.util.Date;

/**
 *
 * @author Quan
 */
public class PaymentDTO {

    private int id;
    private int userID;
    private String saNum;
    private Date expire_visa_date;
    private int cvv;
    private String placeholderCard;
    private int momoNum;
    private Date startDate;
    private int subscriptionID;

    public PaymentDTO() {
    }

    public PaymentDTO(int id, int userID, String saNum, Date expireVisaDate, int cvv, String placeholderCard, int momoNum, Date startDate, int subscriptionID) {
        this.id = id;
        this.userID = userID;
        this.saNum = saNum;
        this.expire_visa_date = expireVisaDate;
        this.cvv = cvv;
        this.placeholderCard = placeholderCard;
        this.momoNum = momoNum;
        this.startDate = startDate;
        this.subscriptionID = subscriptionID;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getSaNum() {
        return saNum;
    }

    public void setSaNum(String saNum) {
        this.saNum = saNum;
    }

    public Date getExpireVisaDate() {
        return expire_visa_date;
    }

    public void setExpireVisaDate(Date expireVisaDate) {
        this.expire_visa_date = expireVisaDate;
    }

    public int getCvv() {
        return cvv;
    }

    public void setCvv(int cvv) {
        this.cvv = cvv;
    }

    public String getPlaceholderCard() {
        return placeholderCard;
    }

    public void setPlaceholderCard(String placeholderCard) {
        this.placeholderCard = placeholderCard;
    }

    public int getMomoNum() {
        return momoNum;
    }

    public void setMomoNum(int momoNum) {
        this.momoNum = momoNum;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public int getSubscriptionID() {
        return subscriptionID;
    }

    public void setSubscriptionID(int subscriptionID) {
        this.subscriptionID = subscriptionID;
    }

    @Override
    public String toString() {
        return "PaymentDTO{" + "id=" + id + ", userID=" + userID + ", saNum=" + saNum + ", expire_visa_date=" + expire_visa_date + ", cvv=" + cvv + ", placeholderCard=" + placeholderCard + ", momoNum=" + momoNum + ", startDate=" + startDate + ", subscriptionID=" + subscriptionID + '}';
    }
    
}
