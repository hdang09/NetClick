/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author ThanhF
 */
public class SubscriptionDAO {

    public ArrayList<ArrayList<String>> getPaymentSubscription() {
        ArrayList<String> subscription_counts = new ArrayList<>();
        ArrayList<String> titles = new ArrayList<>();

        String sql = "SELECT subscriptionID, COUNT(subscriptionID) as count "
                   + "FROM Payment "
                   + "WHERE subscriptionID IS NOT NULL "
                   + "GROUP BY subscriptionID";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String title = rs.getString("subscriptionID");
                titles.add(title);
                String review_count = rs.getString("count");
                subscription_counts.add(review_count);
            }

            ArrayList<ArrayList<String>> result = new ArrayList<>();
            result.add(titles);
            result.add(subscription_counts);
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public int getTotalUser() {

        String sql = "SELECT COUNT(*) FROM Account";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int count = rs.getInt(1);
                return count;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int getTotalBannedUser() {

        String sql = "SELECT COUNT(*) FROM Account WHERE is_ban = 1";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int count = rs.getInt(1);
                return count;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int getTotalMovie() {
        String sql = "SELECT COUNT(*) FROM Movie";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int count = rs.getInt(1);
                return count;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int getTotalInCome() {
        String sql = "SELECT SUM(total) AS total FROM ( SELECT subscriptionID, count, CASE subscriptionID WHEN 1 THEN count * 2 WHEN 2 THEN count * 5 WHEN 3 THEN count * 10 WHEN 4 THEN count * 20 ELSE 0 END AS total FROM ( SELECT subscriptionID, COUNT(subscriptionID) AS count  FROM Payment  GROUP BY subscriptionID ) AS subquery) AS lastquery";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int count = rs.getInt(1);
                return count;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
