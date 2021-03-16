package vn.com.dutmobile.connection;

import java.sql.*;

public class DBConnection {
    static Connection con = null;
    public static Statement connect() throws SQLException, ClassNotFoundException {

        if (con == null || con.isClosed()) {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/projectweb_1920_ver5?characterEncoding=UTF8", "root", "123456");
            return con.createStatement();
        } else {
            return con.createStatement();
        }
    }
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/projectweb_1920_ver5?useUnicode=true&characterEncoding=utf-8", "root", "123456");
            return conn;
        } catch (ClassNotFoundException | SQLException e) {
            return conn;
        }
    }

    public static PreparedStatement getPreparedStatement(String sql) throws ClassNotFoundException, SQLException {
        if (con == null || con.isClosed()) {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/projectweb_1920_ver5?characterEncoding=UTF8", "root", "123456");
        }
        return con.prepareStatement(sql);
    }
}
