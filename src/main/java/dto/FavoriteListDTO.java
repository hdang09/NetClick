/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author Admin
 */
public class FavoriteListDTO {
    private int accountID;
    private int movieID;

    public FavoriteListDTO() {
    }

    public FavoriteListDTO(int accountID, int movieID) {
        this.accountID = accountID;
        this.movieID = movieID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    @Override
    public String toString() {
        return "FavoriteListDTO{" + "accountID=" + accountID + ", movieID=" + movieID + '}';
    }
    
    
}
