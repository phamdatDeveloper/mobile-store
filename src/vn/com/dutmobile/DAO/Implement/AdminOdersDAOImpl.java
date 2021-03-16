package vn.com.dutmobile.DAO.Implement;

import vn.com.dutmobile.DAO.AdminManagerOders;
import vn.com.dutmobile.connection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminOdersDAOImpl implements AdminManagerOders {


    public static ResultSet getCart() {
        ResultSet rs = null;
        String sql = "SELECT cart.id,account.fullname,cart.thanh_toan,account.address,cart.trang_thai  FROM cart INNER JOIN account ON cart.id_khach_hang = account.id";
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            rs = statement.executeQuery();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }


    @Override
    public void deleteOrder(int id) {
        Connection con = DBConnection.getConnection();
        PreparedStatement statement = null;
        String sql = "DELETE FROM cart WHERE id=?";
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1,id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
