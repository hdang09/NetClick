/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class MovieDTO implements Serializable {

    private int ID;
    private String title;
    private String description;
    private String thumbnail;
    private String movie_url;
    private Date release;
    private String director;
    private int rating;
    private String tag;

    public MovieDTO() {
    }
    
    public MovieDTO(String title, String description, String thumbnail, String movie_url, Date release, String director, int rating, String tag) {
        this.title = title;
        this.description = description;
        this.thumbnail = thumbnail;
        this.movie_url = movie_url;
        this.release = release;
        this.director = director;
        this.rating = rating;
        this.tag = tag;
    }

    public MovieDTO(int ID, String title, String description, String thumbnail, String movie_url, Date release, String director, int rating, String tag) {
        this.ID = ID;
        this.title = title;
        this.description = description;
        this.thumbnail = thumbnail;
        this.movie_url = movie_url;
        this.release = release;
        this.director = director;
        this.rating = rating;
        this.tag = tag;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getMovie_url() {
        return movie_url;
    }

    public void setMovie_url(String movie_url) {
        this.movie_url = movie_url;
    }

    public Date getRelease() {
        return release;
    }

    public void setRelease(Date release) {
        this.release = release;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    @Override
    public String toString() {
        return "MovieDTO{" + "ID=" + ID + ", title=" + title + ", description=" + description + ", thumbnail=" + thumbnail + ", movie_url=" + movie_url + ", release=" + release + ", director=" + director + ", rating=" + rating + ", tag=" + tag + '}';
    }

}
