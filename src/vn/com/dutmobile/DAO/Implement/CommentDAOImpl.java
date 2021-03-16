package vn.com.dutmobile.DAO.Implement;

import vn.com.dutmobile.DAO.CommentDAO;
import vn.com.dutmobile.connection.DBConnection;
import vn.com.dutmobile.model.AccountModel;

import javax.servlet.jsp.jstl.sql.Result;
import java.sql.*;

public class CommentDAOImpl implements CommentDAO {
    @Override
    public void insertComment(int id, String name, String email, String comment) {
        Connection con = DBConnection.getConnection();
        AccountModel acc = new AccountModel();
        String sql = "insert into comment_product(idproduct,name,email,comment) value(?,?,?,?)";
        PreparedStatement prs = null;
        try {
            prs = con.prepareStatement(sql);
            prs.setInt(1, id);
            prs.setString(2, name);
            prs.setString(3, email);
            prs.setString(4, comment);
            prs.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ResultSet getCommentProduct(String id) {
        Connection con = DBConnection.getConnection();
        String sql = "select *  from comment_product where idproduct = ?";
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            statement = con.prepareStatement(sql);
            statement.setString(1, id);
            rs = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  rs;
    }
}
