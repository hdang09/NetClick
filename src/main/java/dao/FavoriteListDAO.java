/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.FavoriteListDTO;
import dto.MovieDTO;
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
public class FavoriteListDAO {

    public ArrayList<MovieDTO> getAll(int accountID) {
        ArrayList<MovieDTO> movies = new ArrayList<>();

        String sql = "SELECT * FROM Movie m, FavoriteList fl\n" + 
                     "WHERE m.id = fl.movieID AND fl.accountID = ?";
        
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, accountID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                String movieUrl = rs.getString("movie_url");
                Date release = rs.getDate("release");
                String director = rs.getString("director");
                int rating = rs.getInt("rating");
                ArrayList tags = new ArrayList();
                MovieDTO movie = new MovieDTO(id, title, description, thumbnail, movieUrl, release, director, rating, director);
                movies.add(movie);
            }
            return movies;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insert(int accountID, int movieID) {
        String sql = "INSERT INTO FavoriteList VALUES (?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, accountID);
            ps.setInt(2, movieID);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
