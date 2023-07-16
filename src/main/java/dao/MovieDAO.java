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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;
import utils.DateUtils;

/**
 *
 * @author Admin
 */
public class MovieDAO {

    DateUtils dateUtils = new DateUtils();

    public ArrayList<MovieDTO> getAll() {
        ArrayList<MovieDTO> movies = new ArrayList<>();

        String movieSql = "SELECT * FROM Movie "
                + "LEFT JOIN ( "
                + "SELECT Review.movieID, AVG(Review.rating) AS average_rating "
                + "FROM Review "
                + "GROUP BY Review.movieID "
                + ") AS ratingQuery ON ratingQuery.movieID = Movie.id";

        String tagSql = "SELECT * FROM Tag "
                + "INNER JOIN MovieTag ON MovieTag.tag_id = Tag.id "
                + "WHERE MovieTag.movie_id = ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement moviePs = conn.prepareStatement(movieSql);
            ResultSet movieRs = moviePs.executeQuery();

            while (movieRs.next()) {
                int id = movieRs.getInt("id");
                String title = movieRs.getString("title");
                String description = movieRs.getString("description");
                String thumbnail = movieRs.getString("thumbnail");
                String movieUrl = movieRs.getString("movie_url");
                Date release = movieRs.getDate("release");
                String director = movieRs.getString("director");
                float rating = movieRs.getFloat("average_rating");

                PreparedStatement tagPs = conn.prepareStatement(tagSql);
                tagPs.setInt(1, id);
                ResultSet tagResult = tagPs.executeQuery();

                ArrayList<String> tags = new ArrayList<>();
                while (tagResult.next()) {
                    String tag = tagResult.getString("tag_name");
                    tags.add(tag);
                }

                MovieDTO movie = new MovieDTO(id, title, description, thumbnail, movieUrl, release, director, rating, tags.toString());
                movies.add(movie);
            }
            return movies;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public MovieDTO getById(int id) {
        String sql = "SELECT * FROM Movie "
                + "LEFT JOIN ( "
                + "SELECT Review.movieID, AVG(Review.rating) AS average_rating "
                + "FROM Review , Account WHERE Review.userID = Account.userID "
                + "GROUP BY Review.movieID "
                + ") AS ratingQuery ON ratingQuery.movieID = Movie.id "
                + "LEFT JOIN MovieTag ON Movie.id = MovieTag.movie_id "
                + "LEFT JOIN Tag ON Tag.id = MovieTag.tag_id "
                + "WHERE Movie.id = ?";

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
                Date release = rs.getDate("release");
                String director = rs.getString("director");
                float rating = Math.round(rs.getFloat("average_rating") * 10) / 10f;

                ArrayList<String> tags = new ArrayList<>();
                do {
                    String tag = rs.getString("tag_name");
                    tags.add(tag);
                } while (rs.next());

                MovieDTO movie = new MovieDTO(id, title, description, thumbnail, movieUrl, release, director, rating, tags.toString());
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
            ps.setNString(1, tag);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString("title");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                String movieUrl = rs.getString("movie_url");
                Date release = rs.getDate("release");
                String director = rs.getString("director");
                int rating = rs.getInt("rating");
                MovieDTO movie = new MovieDTO(id, title, description, thumbnail, movieUrl, release, director, rating, tag);
                movies.add(movie);
            }
            return movies;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public ArrayList<MovieDTO> getRelatedByTag(int movieId) {
        ArrayList<MovieDTO> movies = new ArrayList<>();

        String sql = "SELECT TOP 10 * FROM MovieTag mt "
                + "INNER JOIN Movie m  "
                + "ON mt.movie_id = m.id   "
                + "WHERE mt.tag_id = (  "
                + "      SELECT tag_id FROM MovieTag WHERE movie_id = ? "
                + ") "
                + "AND m.id <> ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, movieId);
            ps.setInt(2, movieId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString("title");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                String movieUrl = rs.getString("movie_url");
                Date release = rs.getDate("release");
                String director = rs.getString("director");
                int rating = rs.getInt("rating");
                ArrayList tags = new ArrayList();
                MovieDTO movie = new MovieDTO(id, title, description, thumbnail, movieUrl, release, director, rating, tags.toString());
                movies.add(movie);
            }
            return movies;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public ArrayList<String> getAllTag() {
        ArrayList<String> tags = new ArrayList<>();

        String sql = "SELECT tag_name FROM Tag";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String tag = rs.getString(1);
                tags.add(tag);
            }
            return tags;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public ArrayList<ArrayList<String>> getMostFiveRatingMovie() {
        ArrayList<String> rating_counts = new ArrayList<>();
        ArrayList<String> titles = new ArrayList<>();

        String sql = "SELECT TOP 5 movie.title, review.review_count FROM Movie AS movie INNER JOIN (SELECT review.movieID, AVG(Cast(review.rating as Float)) as review_count FROM Review AS review GROUP BY review.movieID) AS review ON movie.id = review.movieID ORDER BY review.review_count DESC";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String title = rs.getString("title");
                titles.add(title);
                String rating = rs.getString("review_count");
                rating_counts.add(rating);
            }

            ArrayList<ArrayList<String>> result = new ArrayList<>();
            result.add(titles);
            result.add(rating_counts);
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public ArrayList<ArrayList<String>> getMostFiveWatchedMovie() {
        ArrayList<String> watch_counts = new ArrayList<>();
        ArrayList<String> titles = new ArrayList<>();

        String sql = "SELECT TOP 5 title, watch_count FROM Movie ORDER BY watch_count DESC";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String title = rs.getString("title");
                titles.add(title);
                String watch_count = rs.getString("watch_count");
                watch_counts.add(watch_count);
            }

            ArrayList<ArrayList<String>> result = new ArrayList<>();
            result.add(titles);
            result.add(watch_counts);
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public ArrayList<ArrayList<String>> getMostFiveCommentMovie() {
        ArrayList<String> comment_counts = new ArrayList<>();
        ArrayList<String> titles = new ArrayList<>();

        String sql = "SELECT TOP 5 movie.title, review.review_count FROM Movie AS movie INNER JOIN (SELECT review.movieID, COUNT(*) AS review_count FROM Review AS review GROUP BY review.movieID) AS review ON movie.id = review.movieID ORDER BY review.review_count DESC";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String title = rs.getString("title");
                titles.add(title);
                String review_count = rs.getString("review_count");
                comment_counts.add(review_count);
            }

            ArrayList<ArrayList<String>> result = new ArrayList<>();
            result.add(titles);
            result.add(comment_counts);
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public void delete(int id) {
        String sql = "DELETE FROM Movie WHERE id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void add(MovieDTO movie) {
        String insertMovieSQL = "INSERT INTO Movie (title, description, thumbnail, movie_url, release, director, rating)\n"
                + "OUTPUT INSERTED.id "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        String insertTagSQL = "INSERT INTO MovieTag VALUES (?, ?)";

        try {
            Connection conn = DBUtils.getConnection();

            // Insert movie
            PreparedStatement ps = conn.prepareStatement(insertMovieSQL);
            ps.setNString(1, movie.getTitle());
            ps.setNString(2, movie.getDescription());
            ps.setNString(3, movie.getThumbnail());
            ps.setNString(4, movie.getMovie_url());
            ps.setDate(5, dateUtils.convertToSqlDate(movie.getRelease()));
            ps.setNString(6, movie.getDirector());
            ps.setFloat(7, movie.getRating());
            ResultSet rs = ps.executeQuery();
            int id = 0;
            if (rs.next()) {
                id = rs.getInt("id");
            }

            // Insert movie tag
            String[] tags = movie.getTag().split(",");
            for (String tag : tags) {
                PreparedStatement tagPs = conn.prepareStatement(insertTagSQL);
                tagPs.setInt(1, id);
                tagPs.setNString(2, tag);
                tagPs.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void update(MovieDTO movie, int id) {
        String sql = "UPDATE Movie "
                + "SET title = ?, description = ?, thumbnail = ?, movie_url = ?, release = ?, director = ? "
                + "WHERE id = ?";
        String deleteTagSQL = "DELETE FROM MovieTag "
                + "WHERE movie_id = ?";
        String insertTagSQL = "INSERT INTO MovieTag VALUES (?, ?)";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setNString(1, movie.getTitle());
            ps.setNString(2, movie.getDescription());
            ps.setNString(3, movie.getThumbnail());
            ps.setNString(4, movie.getMovie_url());
            ps.setDate(5, dateUtils.convertToSqlDate(movie.getRelease()));
            ps.setNString(6, movie.getDirector());
            ps.setInt(7, id);
            ps.executeUpdate();

            // Delete all current tag
            PreparedStatement deletePs = conn.prepareStatement(deleteTagSQL);
            deletePs.setInt(1, id);
            deletePs.executeUpdate();

            // Insert new tag
            // Insert movie tag
            String[] tags = movie.getTag().split(",");
            for (String tag : tags) {
                PreparedStatement insertPs = conn.prepareStatement(insertTagSQL);
                insertPs.setInt(1, id);
                insertPs.setNString(2, tag);
                insertPs.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<MovieDTO> getPopularMovies(int count) {
        ArrayList<MovieDTO> movies = new ArrayList<>();
        String sql = "SELECT TOP (?) * FROM Movie "
                + "ORDER BY watch_count DESC";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, count);
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
                MovieDTO movie = new MovieDTO(id, title, description, thumbnail, movieUrl, release, director, rating, tags.toString());
                movies.add(movie);
            }
            return movies;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<MovieDTO> getNewMovies(int count) {
        ArrayList<MovieDTO> movies = new ArrayList<>();
        String sql = "SELECT TOP (?) * FROM Movie "
                + "ORDER BY release DESC";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, count);
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
                MovieDTO movie = new MovieDTO(id, title, description, thumbnail, movieUrl, release, director, rating, tags.toString());
                movies.add(movie);
            }
            return movies;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<MovieDTO> getTopRatedMovies(int count) {
        ArrayList<MovieDTO> movies = new ArrayList<>();
        String sql = "SELECT TOP (?) movieID, title, thumbnail, movie_url, release, director, watch_count, AVG(r.rating) as rating "
                + "FROM Review r "
                + "INNER JOIN Movie m "
                + "ON r.movieID = m.id "
                + "GROUP BY movieID, title, thumbnail, movie_url, release, director, watch_count "
                + "ORDER BY rating DESC";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, count);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("movieID");
                String title = rs.getString("title");
//                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                String movieUrl = rs.getString("movie_url");
                Date release = rs.getDate("release");
                String director = rs.getString("director");
                int rating = rs.getInt("rating");
                ArrayList tags = new ArrayList();
                MovieDTO movie = new MovieDTO(id, title, "", thumbnail, movieUrl, release, director, rating, tags.toString());
                movies.add(movie);
            }
            return movies;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<MovieDTO> getFavoriteList(int accountID) {
        ArrayList<MovieDTO> movies = new ArrayList<>();

        String sql = "SELECT * FROM Movie m, FavoriteList fl\n"
                + "WHERE m.id = fl.movieID AND fl.accountID = ?";

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

    public ArrayList<MovieDTO> search(String query) {
        ArrayList<MovieDTO> movies = new ArrayList<>();

        String sql = "SELECT * FROM Movie "
                + "WHERE title LIKE ? OR description LIKE ? OR director LIKE ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            String queryParam = "%" + query + "%";
            ps.setNString(1, queryParam);
            ps.setNString(2, queryParam);
            ps.setNString(3, queryParam);
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
}
