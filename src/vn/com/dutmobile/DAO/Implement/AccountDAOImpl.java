package vn.com.dutmobile.DAO.Implement;

import org.apache.commons.lang.RandomStringUtils;
import vn.com.dutmobile.DAO.AccountDAO;
import vn.com.dutmobile.model.AccountModel;
import vn.com.dutmobile.connection.DBConnection;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.ArrayList;

public class AccountDAOImpl implements AccountDAO {

    @Override
    public boolean checkAccountExist(String username) {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT username FROM account WHERE username = '" + username + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            //neu username da ton tai thi tra ve true
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //neu username khong ton tai thi tra ve false
        return false;
    }

    @Override
    public boolean checkEmailExist(String email) {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT email FROM account WHERE email = '" + email + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            //neu email da ton tai thi tra ve true
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //neu email khong ton tai thi tra ve false
        return false;
    }

    @Override
    public void register(AccountModel accounts) {
        Connection connection = DBConnection.getConnection();
        String sql = "INSERT INTO account(username, password, `type`, active, fullname, phonenumber, email, address, gender, dateofbirth) VALUES (?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, accounts.getUsername());
            ps.setString(2, accounts.getPassword());
            ps.setString(3, "user");
            ps.setInt(4, 1);
            ps.setString(5, accounts.getFullname());
            ps.setString(6, accounts.getPhoneNumber());
            ps.setString(7, accounts.getEmail());
            ps.setString(8, accounts.getAddress());
            ps.setString(9, accounts.getGender());
            ps.setDate(10, accounts.getDateOfBirth());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public AccountModel checkLogin(String username, String password) {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM account WHERE username = '" + username + "' AND password ='" + password + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AccountModel accountsBean = new AccountModel();
                accountsBean.setId(rs.getString("id"));
                accountsBean.setUsername(rs.getString("username"));
                accountsBean.setPassword(rs.getString("password"));
                accountsBean.setType(rs.getString("type"));
                accountsBean.setActive(rs.getString("active"));
                accountsBean.setFullname(rs.getString("fullname"));
                accountsBean.setPhoneNumber(rs.getString("phonenumber"));
                accountsBean.setEmail(rs.getString("email"));
                accountsBean.setAddress(rs.getString("address"));
                accountsBean.setGender(rs.getString("gender"));
                accountsBean.setDateOfBirth(rs.getDate("dateofbirth"));
                return accountsBean;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean checkAccount(String username, String password) {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM account WHERE username = '" + username + "' AND password ='" + password + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public ArrayList<AccountModel> getAll() {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM account";
        ArrayList<AccountModel> listAccount = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AccountModel accountModel = new AccountModel();
                accountModel.setId(rs.getString("id"));
                accountModel.setUsername(rs.getString("username"));
                accountModel.setFullname(rs.getString("fullname"));
                accountModel.setEmail(rs.getString("email"));
                accountModel.setPhoneNumber(rs.getString("phonenumber"));
                accountModel.setAddress(rs.getString("address"));
                accountModel.setGender(rs.getString("gender"));
                accountModel.setDateOfBirth(rs.getDate("dateofbirth"));
                accountModel.setType(rs.getString("type"));
                listAccount.add(accountModel);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listAccount;
    }

    @Override
    public void updateAccount(AccountModel accounts) {
        Connection connection = DBConnection.getConnection();
        String sql = "UPDATE account SET `password`=?, `type` = ?, active = ?, fullname = ?, phonenumber = ?, email = ?, address =?, gender = ?,  dateofbirth = ?";
        sql += " WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, accounts.getPassword());
            ps.setString(2, accounts.getType());
            ps.setString(3, accounts.getActive());
            ps.setString(4, accounts.getFullname());
            ps.setString(5, accounts.getPhoneNumber());
            ps.setString(6, accounts.getEmail());
            ps.setString(7, accounts.getAddress());
            ps.setString(8, accounts.getGender());
            ps.setDate(9, accounts.getDateOfBirth());
            ps.setString(10, accounts.getId());
            ps.executeUpdate();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteAccount(String id) {
        Connection connection = DBConnection.getConnection();
        String sql = "DELETE FROM account WHERE id = '" + id + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertAccount(AccountModel accounts) {
        Connection connection = DBConnection.getConnection();
        String sql = "INSERT INTO account(username,password, `type`, active, fullname, phonenumber, email, address, gender, dateofbirth) VALUES (?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, accounts.getUsername());
            ps.setString(2, accounts.getPassword());
            ps.setString(3, accounts.getType());
            ps.setString(4, accounts.getActive());
            ps.setString(5, accounts.getFullname());
            ps.setString(6, accounts.getPhoneNumber());
            ps.setString(7, accounts.getEmail());
            ps.setString(8, accounts.getAddress());
            ps.setString(9, accounts.getGender());
            ps.setDate(10, accounts.getDateOfBirth());
            ps.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public AccountModel getAccountById(String id) {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM account WHERE id='" + id + "'";
        AccountModel accountModel = new AccountModel();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                accountModel.setFullname(rs.getString("fullname"));
                accountModel.setEmail(rs.getString("email"));
                accountModel.setPhoneNumber(rs.getString("phonenumber"));
                accountModel.setGender(rs.getString("gender"));
                accountModel.setAddress(rs.getString("address"));
                accountModel.setDateOfBirth(rs.getDate("dateofbirth"));
                accountModel.setPassword(rs.getString("password"));
                accountModel.setActive(rs.getString("active"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return accountModel;
    }

    @Override
    public void updateUser(AccountModel accountModel, String id) {
        Connection connection = DBConnection.getConnection();
        ResultSet rs = null;
        String sql = "UPDATE account SET fullname = ?, phonenumber = ?, email = ?, address =?, gender = ?,  dateofbirth = ? WHERE id= ?";
        try {
            PreparedStatement prs = connection.prepareStatement(sql);
            prs.setString(1, accountModel.getFullname());
            prs.setString(2, accountModel.getPhoneNumber());
            prs.setString(3, accountModel.getEmail());
            prs.setString(4, accountModel.getAddress());
            prs.setString(5, accountModel.getGender());
            prs.setDate(6, accountModel.getDateOfBirth());
            prs.setString(7, id);
            prs.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updatePassword(AccountModel accountModel, String id) {
        Connection connection = DBConnection.getConnection();
        String sql = "UPDATE account SET password = ? WHERE id= ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, accountModel.getPassword());
            statement.setString(2, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static ResultSet InsertMyOders(String id) {
        ResultSet rs = null;
        String sql = " SELECT orders.id,product.productname,orders.ngay_gio,orders.address  FROM orders INNER JOIN account ON orders.id_khach_hang = account.id INNER JOIN product ON orders.id_product = product.id where account.id = ? ";
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            rs = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    @Override
    public void resetPassword(AccountModel accountModel) {
        Connection connection = DBConnection.getConnection();
        String sql = "UPDATE account SET password = ? WHERE email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, accountModel.getPassword());
            ps.setString(2, accountModel.getEmail());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String codeKeyResetPass() {
        String randomPassword = RandomStringUtils.randomAlphanumeric(10);
        return randomPassword;
    }
}
