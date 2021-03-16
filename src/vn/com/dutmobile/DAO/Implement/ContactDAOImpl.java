package vn.com.dutmobile.DAO.Implement;

import vn.com.dutmobile.DAO.ContactDAO;
import vn.com.dutmobile.connection.DBConnection;
import vn.com.dutmobile.model.ContactModel;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ContactDAOImpl implements ContactDAO {
    @Override
    public void contact(ContactModel contactModel) {
        Connection connection = DBConnection.getConnection();
        String sql = "INSERT INTO contact(`name`, email, topic, question) VALUES (?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, contactModel.getName());
            ps.setString(2, contactModel.getEmail());
            ps.setString(3, contactModel.getTopic());
            ps.setString(4, contactModel.getQuestion());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
