/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.MovieDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class MovieDAO {

    public ArrayList<MovieDTO> getAll() {
        ArrayList<MovieDTO> movies = new ArrayList<>();

        String sql = "SELECT * FROM movie";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                String movieUrl = rs.getString("movie_url");
                String release = rs.getString("release");
                String director = rs.getString("director");
                int rating = rs.getInt("rating");
                ArrayList tags = new ArrayList();
                MovieDTO movie = new MovieDTO(id, title, description, thumbnail, movieUrl, LocalDate.MAX, director, rating, director);
                movies.add(movie);
            }
            return movies;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public MovieDTO getById(int id) {
        String sql = "SELECT * FROM movie WHERE id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String title = rs.getString("title");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                String movieUrl = rs.getString("movie_url");
                String release = rs.getString("release");
                String director = rs.getString("director");
                int rating = rs.getInt("rating");
                // ArrayList tags = new ArrayList();
                MovieDTO movie = new MovieDTO(id, title, description, thumbnail, movieUrl, LocalDate.MAX, director, rating, director);
                return movie;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<MovieDTO> getByTag(String tag) {
        ArrayList<MovieDTO> movies = new ArrayList<>();

        String sql = "SELECT * FROM movie m, tag t, MovieTag mt "
                + "where m.id = mt.movie_id and t.id = mt.tag_id and tag_name = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, tag);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString("title");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                String movieUrl = rs.getString("movie_url");
                String release = rs.getString("release");
                String director = rs.getString("director");
                int rating = rs.getInt("rating");
                // ArrayList tags = new ArrayList();
                MovieDTO movie = new MovieDTO(id, title, description, thumbnail, movieUrl, LocalDate.MAX, director, rating, director);
                movies.add(movie);
            }
            return movies;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
    
    public ArrayList<MovieDTO> getRelatedByTag(int id, String tag) {
                ArrayList<MovieDTO> movies = new ArrayList<>();

        String sql = "SELECT * FROM movie m, tag t, MovieTag mt "
                + "where m.id = mt.movie_id and t.id = mt.tag_id and tag_name = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, tag);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String title = rs.getString("title");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                String movieUrl = rs.getString("movie_url");
                String release = rs.getString("release");
                String director = rs.getString("director");
                int rating = rs.getInt("rating");
                // ArrayList tags = new ArrayList();
                MovieDTO movie = new MovieDTO(id, title, description, thumbnail, movieUrl, LocalDate.MAX, director, rating, director);
                movies.add(movie);
            }
            return movies;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
