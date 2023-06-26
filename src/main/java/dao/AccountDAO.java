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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class AccountDAO {

    public AccountDTO login(String user, String pass) {
        String sql = "select * from Account\n"
                + "where [username] = ? "
                + "and password = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new AccountDTO(
                        rs.getInt("userID"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getInt("is_ban") == 1,
                        rs.getInt("role"),
                        rs.getInt("subscriptionID")
                );
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public AccountDTO checkAccountExist(String username, String email) {
        String sql = "select * from Account\n"
                + "where [username] = ? OR email = ?\n";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new AccountDTO(
                        rs.getInt("userID"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getInt("is_ban") == 1,
                        rs.getInt("role"),
                        rs.getInt("subscriptionID")
                );
            }
        } catch (SQLException e) {

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
        }
    }
    
    public List<AccountDTO> getAll() {
        List<AccountDTO> accounts = new ArrayList<>();

        String sql = "SELECT * FROM Account";
            
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                AccountDTO movie = new AccountDTO(
                        rs.getInt("userID"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getInt("is_ban") == 1,
                        rs.getInt("role"),
                        rs.getInt("subscriptionID")
                );
                accounts.add(movie);
            }
            return accounts;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        return null;
    }
    public AccountDTO getById(int id) {
        String sql = "SELECT * FROM Account WHERE userID = ?";
        
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String username = rs.getString("username");
                String email = rs.getString("email");
                String password = rs.getString("password");
                boolean isBan = rs.getInt("is_ban") == 1;
                int role = rs.getInt("role");
                int subscriptionID = rs.getInt("subscriptionID");
                AccountDTO account = new AccountDTO(id, username, email, password, isBan, role, subscriptionID);
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
    public void changeStatus(int accountID) {
        int currentStatus = getById(accountID).isIsBan() ? 1 : 0;
        int switchStatus = currentStatus == 1 ? 0 : 1;
        
        String sql = "UPDATE Account SET is_ban = ? WHERE userID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, switchStatus);
            ps.setInt(2, accountID);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void changeRole( int accountID) {
        int currentRole = getById(accountID).getRole();
        int switchRole = currentRole == 1 ? 0 : 1;
        
        String sql = "UPDATE Account SET role = ? WHERE userID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, switchRole);
            ps.setInt(2, accountID);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}