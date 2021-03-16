package vn.com.dutmobile.DAO.Implement;

import vn.com.dutmobile.DAO.TypeProductDAO;
import vn.com.dutmobile.connection.DBConnection;
import vn.com.dutmobile.model.TypeProductModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TypeProductDAOImpl implements TypeProductDAO {
    @Override
    public ArrayList<TypeProductModel> getAllType() {
        Connection con = DBConnection.getConnection();
        ArrayList<TypeProductModel> list = new ArrayList<>();
        PreparedStatement statement = null;
        String sql = "SELECT * FROM type_product";
        try {
            statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                TypeProductModel type = new TypeProductModel();

                type.setId(rs.getInt("id"));
                type.setType(rs.getString("type"));
                type.setActive(rs.getInt("active"));
                list.add(type);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public TypeProductModel getTypeById(int id) {
        Connection con = DBConnection.getConnection();
        TypeProductModel type = new TypeProductModel();
        PreparedStatement statement = null;
        String sql = "SELECT * FROM type_product where id =?";
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1,id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                type.setType(rs.getString("type"));
                type.setActive(rs.getInt("active"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return type;
    }

    @Override
    public void updateType(int id, String type, int active) {
        Connection con = DBConnection.getConnection();
        PreparedStatement statement = null;
        String sql = "UPDATE type_product set type = ?, active=? where id =?";
        try {
            statement = con.prepareStatement(sql);
            statement.setString(1,type);
            statement.setInt(2,active);
            statement.setInt(3,id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteType(int id) {
        Connection con = DBConnection.getConnection();
        PreparedStatement statement = null;
        String sql = "DELETE FROM type_product WHERE id=?";
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1,id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertType(String type, int active) {

        Connection con = DBConnection.getConnection();
        PreparedStatement statement = null;
        String sql = "insert into type_product(type,active) value(?,?)";
        try {
            statement = con.prepareStatement(sql);
            statement.setString(1,type);
            statement.setInt(2,active);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
