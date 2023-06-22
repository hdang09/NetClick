/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.AccountDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class AccountDAO {
        public AccountDTO login(String user, String pass){
        String sql = "select * from Account\n"
                + "where [username] = ? "
                + "and password = ?";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);                      
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                     return new AccountDTO(
                                    rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getInt("role"),
                        rs.getInt("subscriptionID"));
            }
    } catch (SQLException e){
        
    }
        return null;
}
        
        public AccountDTO checkAccountExist(String user, String email) {
        String sql = "select * from Account\n"
                + "where [username] = ?\n OR email = ?\n";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);                      
            ps.setString(1, user);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                     return new AccountDTO(
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getInt("role"),
                        rs.getInt("subscriptionID"));
            }
    } catch (SQLException e){
        
    }
        return null;
}
        
        public void signup(String username, String email, String password) {
        String sql = "INSERT INTO Account (username, email, password, role, subscriptionID) VALUES (?, ?, ?, 0, 0)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
}

}
    
