/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.PaymentDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import utils.DBUtils;

/**
 *
 * @author Quan
 */
public class PaymentDAO {
     public PaymentDTO checkPaymentExist(Integer visa, Date expiredate, Integer cvv, String cholder) {
        String sql = "SELECT *\n" +
"FROM payment\n" +
"WHERE visa_num = ? AND expire_visa_date = ? AND cvv = ? AND placeholder_card = ?;";
        
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, visa);
            ps.setDate(2, (java.sql.Date) expiredate);
            ps.setInt(3, cvv);
            ps.setString(4, cholder);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new PaymentDTO(
                    rs.getInt("id"),
                    rs.getInt("userID"),
                    rs.getInt("saNum"),
                    rs.getDate("expire_visa_date"),
                    rs.getInt("cvv"),
                    rs.getString("placeholderCard"),
                    rs.getInt("momoNum"),
                    rs.getDate("startDate"),
                    rs.getInt("subscriptionID")
                                 
                );
            }
        } catch (SQLException e) {

        }
        return null;
    }
}
   
