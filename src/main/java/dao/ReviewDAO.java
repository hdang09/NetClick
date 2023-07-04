/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.MovieDTO;
import dto.ReviewDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class ReviewDAO {
    
    public ArrayList<ReviewDTO> getReviewByMovieID(int movieID) {
        ArrayList<ReviewDTO> reviews = new ArrayList<>();
        String sql = "SELECT * FROM Review r, Account a "
                   + "WHERE r.movieID = ? AND r.userID = a.userID "
                   + "ORDER BY ID DESC";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, movieID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                int userID = rs.getInt("userID");
                String username = rs.getString("username");
                String comment = rs.getString("comment");
                int rating = rs.getInt("rating");
                Date timeComment = rs.getDate("date_review");
                ReviewDTO review = new ReviewDTO(id, movieID, userID, username, comment, rating, timeComment);
                reviews.add(review);
            }
            return reviews;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void addComment(ReviewDTO review) {
        String sql = "INSERT INTO Review (movieID, userID, comment, rating, date_review) " +
                     "VALUES (?, ?, ?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, review.getMovieID());
            ps.setInt(2, review.getUserID());
            ps.setString(3, review.getComment());
            ps.setInt(4, review.getRating());
            ps.setDate(5, new java.sql.Date(new Date().getTime()));
            
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
