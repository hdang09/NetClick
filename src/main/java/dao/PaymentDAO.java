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
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;
import utils.DateUtils;

/**
 *
 * @author Quan
 */
public class PaymentDAO {

    DateUtils dateUtils = new DateUtils();

//  VISA

    public PaymentDTO checkPaymentExist(String visa, Date expiredate, Integer cvv, String cholder) {
        String sql = "SELECT *\n"
                + "FROM payment\n"
                + "WHERE visa_num = ? AND expire_visa_date = ? AND cvv = ? AND placeholder_card = ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, visa);
            ps.setDate(2, dateUtils.convertToSqlDate(expiredate));
            ps.setInt(3, cvv);
            ps.setString(4, cholder);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new PaymentDTO(
                        rs.getInt("id"),
                        rs.getInt("userID"),
                        rs.getString("saNum"),
                        rs.getDate("expireVisaDate"),
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

    public void insertv(String visa, Date expiredate, Integer cvv, String cholder, Date startDate) {
    String sql = "INSERT INTO payment (visa_num, expire_visa_date, cvv, placeholder_card, start_date)\n"
            + "VALUES (?, ?, ?, ?, ?)";
    try {
        Connection conn = DBUtils.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, visa);
        ps.setDate(2, dateUtils.convertToSqlDate(expiredate));
        ps.setInt(3, cvv);
        ps.setString(4, cholder);
        ps.setDate(5, dateUtils.convertToSqlDate(startDate));
        ps.executeUpdate();
    } catch (SQLException e) {
        // Handle exception
    }
}
//  MOMO
    public void insertm(Integer momoNum, Date startDate) {
        String sql = "INSERT INTO payment (momo_num, start_date) VALUES (?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, momoNum);
            ps.setDate(2, dateUtils.convertToSqlDate(startDate));
            ps.executeUpdate();
        } catch (SQLException e) {
            // Handle exception
        }
    }
   public boolean isMomoExists(Integer momo) {
        String sql = "SELECT * FROM payment WHERE momo_num = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, momo);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
        }
        return false;
    }

}