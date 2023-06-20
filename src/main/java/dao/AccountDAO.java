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
        String query = "select * from Account\n"
                + "where [username] = ? "
                + "and password = ?";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);                      
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                     return new AccountDTO(
                                    rs.getInt(1),
                                    rs.getString(2),
                                    rs.getString(3),
                                    rs.getString(4),
                                    rs.getInt(5),
                                    rs.getInt(6));
            }
    } catch (SQLException e){
        
    }
        return null;
}
        public AccountDTO checkAccountExist(String user){
        String query = "select * from Account\n"
                + "where [user] = ?\n";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);                      
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                     return new AccountDTO(
                                    rs.getInt(1),
                                    rs.getString(2),
                                    rs.getString(3),
                                    rs.getString(4),
                                    rs.getInt(5),
                                    rs.getInt(6));
            }
    } catch (Exception e){
        
    }
        return null;
}
        public void register(String user, String pass){
            String query = "insert into Account\n" 
                    + "values(?,?,?,?,0,0,0";
            try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);                      
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {
            
        }
            
    }
}
    

