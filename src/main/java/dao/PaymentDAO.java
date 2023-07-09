package dao;

import dto.PaymentDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import utils.DBUtils;
import utils.DateUtils;

/**
 * 
 */
public class PaymentDAO {
    DateUtils dateUtils = new DateUtils();
    
    // VISA
    public PaymentDTO checkPaymentExist(int userID, String visa, Date expireDate, int cvv, String placeholderCard) {
        String sql = "SELECT *\n"
                + "FROM payment\n"
                + "WHERE userID = ? AND visa_num = ? AND expire_visa_date = ? AND cvv = ? AND placeholder_card = ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setString(2, visa);
            ps.setDate(3, dateUtils.convertToSqlDate(expireDate));
            ps.setInt(4, cvv);
            ps.setString(5, placeholderCard);
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

    public void insertv(int userID, String visa, Date expireDate, int cvv, String placeholderCard, Date startDate, int subscriptionID) {
    String sql = "INSERT INTO payment (userID, visa_num, expire_visa_date, cvv, placeholder_card, start_date, subscriptionID) VALUES (?, ?, ?, ?, ?, ?, ?)";
    try {
        Connection conn = DBUtils.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, userID);
        ps.setString(2, visa);
        ps.setDate(3, dateUtils.convertToSqlDate(expireDate));
        ps.setInt(4, cvv);
        ps.setString(5, placeholderCard);
        ps.setDate(6, dateUtils.convertToSqlDate(startDate));
        ps.setInt(7, subscriptionID);
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

    // MOMO
    public void insertm(int userID, int momoNum, Date startDate, int subscriptionID) {
    String sql = "INSERT INTO payment (userID, momo_num, start_date, subscriptionID) VALUES (?, ?, ?, ?)";
    try {
        Connection conn = DBUtils.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, userID);
        ps.setInt(2, momoNum);
        ps.setDate(3, dateUtils.convertToSqlDate(startDate));
        ps.setInt(4, subscriptionID);
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

    public boolean isMomoExists(int momoNum) {
        String sql = "SELECT * FROM payment WHERE momo_num = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, momoNum);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
        }
        return false;
    }
}