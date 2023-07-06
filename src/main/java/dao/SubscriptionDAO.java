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

        String sql = "SELECT payment.subscriptionID, COUNT(payment.subscriptionID) as count FROM Payment as payment GROUP BY payment.subscriptionID";
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
}
