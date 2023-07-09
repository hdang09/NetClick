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

    // VISA
    public void insertv(int userID, String visa, Date expireDate, int cvv, String placeholderCard, Date startDate) {
        String sql = "UPDATE payment " +
                     "SET visa_num = ?, expire_visa_date = ?, cvv = ?, placeholder_card = ?, start_date = ?" +
                     "WHERE userID = ?";
        
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, visa);
            ps.setDate(2, dateUtils.convertToSqlDate(expireDate));
            ps.setInt(3, cvv);
            ps.setString(4, placeholderCard);
            ps.setDate(5, dateUtils.convertToSqlDate(startDate));
            ps.setInt(6, userID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // MOMO
    public void insertm(int userID, int momoNum, Date startDate) {
        String sql = "UPDATE payment " +
                     "SET momo_num = ?, start_date = ? " + 
                     "WHERE userID = ?";
        
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, momoNum);
            ps.setDate(2, dateUtils.convertToSqlDate(startDate));
            ps.setInt(3, userID);
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
    
    public PaymentDTO getPaymentByUserID(int userID) {
        String sql = "SELECT * FROM Payment WHERE userID = ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new PaymentDTO(
                        rs.getInt("id"),
                        rs.getInt("userID"),
                        rs.getString("visa_num"),
                        rs.getDate("expire_visa_date"),
                        rs.getInt("cvv"),
                        rs.getString("placeholder_card"),
                        rs.getInt("momo_num"),
                        rs.getDate("start_date"),
                        rs.getInt("subscriptionID")
                );
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean isPurchased(int accountID) {
        PaymentDTO payment = getPaymentByUserID(accountID);
        if (payment == null) return false;
        
        boolean isMoMo = payment.getMomoNum() != 0;
        boolean isVisa = payment.getCvv() != 0 && payment.getCvv() != 0 && payment.getExpireVisaDate() != null && payment.getSaNum() != null;
        
        return isMoMo || isVisa;
    }

    public void insertSubscriptionID(int userID, int subscriptionID) {
        String sql = "INSERT INTO Payment (userID, subscriptionID) VALUES (?, ?)";
        
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setInt(2, subscriptionID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean isChooseSubscriptionPlan(int accountID) {
        PaymentDTO payment = getPaymentByUserID(accountID);
        if (payment == null) return false;
        return payment.getSubscriptionID() != 0;
    }

}
