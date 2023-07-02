/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class ReviewDTO {
    private int id;
    private int movieID;
    private int userID;
    private String username;
    private String comment;
    private int rating;
    private Date dateReview;

    public ReviewDTO() {
    }
    
    public ReviewDTO(int movieID, int userID, String comment, int rating) {
        this.movieID = movieID;
        this.userID = userID;
        this.comment = comment;
        this.rating = rating;
    }

    public ReviewDTO(int movieID, int userID, String username, String comment, int rating) {
        this.movieID = movieID;
        this.userID = userID;
        this.username = username;
        this.comment = comment;
        this.rating = rating;
    }

    public ReviewDTO(int id, int movieID, int userID, String username, String comment, int rating, Date dateReview) {
        this.id = id;
        this.movieID = movieID;
        this.userID = userID;
        this.username = username;
        this.comment = comment;
        this.rating = rating;
        this.dateReview = dateReview;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    public int getUserID() {
        return userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Date dateReview() {
        return dateReview;
    }

    public void setDateReview(Date dateReview) {
        this.dateReview = dateReview;
    }

    @Override
    public String toString() {
        return "ReviewDTO{" + "id=" + id + ", movieID=" + movieID + ", userID=" + userID + ", comment=" + comment + ", rating=" + rating + ", dateReview=" + dateReview + '}';
    }
    
}
