package vn.com.dutmobile.DAO.Implement;

import vn.com.dutmobile.DAO.NewsDAO;
import vn.com.dutmobile.connection.DBConnection;
import vn.com.dutmobile.model.NewsModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NewsDAOImpl implements NewsDAO {

    @Override
    public ArrayList<NewsModel> getNews() {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM news";
        ArrayList<NewsModel> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                NewsModel newsModel = new NewsModel();
                newsModel.setId(rs.getInt("id"));
                newsModel.setTitle(rs.getString("title"));
                newsModel.setType(rs.getString("type"));
                newsModel.setDescription(rs.getString("description"));
                newsModel.setContent(rs.getString("content"));
                newsModel.setImg(rs.getString("img"));
                newsModel.setAuthor(rs.getString("author"));
                newsModel.setTimerelease(rs.getDate("timerelease"));
                newsModel.setPopular(rs.getInt("popular"));
                newsModel.setActive(rs.getInt("active"));
                list.add(newsModel);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public ArrayList<NewsModel> getAllNews(int a, int b) {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM news WHERE active = 1 limit ?,?";
        ArrayList<NewsModel> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, a);
            ps.setInt(2, b);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                NewsModel newsModel = new NewsModel();
                newsModel.setId(rs.getInt("id"));
                newsModel.setTitle(rs.getString("title"));
                newsModel.setType(rs.getString("type"));
                newsModel.setDescription(rs.getString("description"));
                newsModel.setImg(rs.getString("img"));
                newsModel.setTimerelease(rs.getDate("timerelease"));
                newsModel.setPopular(rs.getInt("popular"));
                newsModel.setActive(rs.getInt("active"));
                list.add(newsModel);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public int getCountNews() {
        Connection connection = DBConnection.getConnection();
        ArrayList<NewsModel> list = new ArrayList<>();
        String sql = "SELECT COUNT(id) FROM news";
        int count = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    @Override
    public ArrayList<NewsModel> getAllPopularNews() {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM news WHERE popular = 1";
        sql += " limit 0,4";
        ArrayList<NewsModel> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                NewsModel newsModel = new NewsModel();
                newsModel.setId(rs.getInt("id"));
                newsModel.setTitle(rs.getString("title"));
                newsModel.setType(rs.getString("type"));
                newsModel.setDescription(rs.getString("description"));
                newsModel.setImg(rs.getString("img"));
                newsModel.setTimerelease(rs.getDate("timerelease"));
                newsModel.setActive(rs.getInt("active"));
                newsModel.setPopular(rs.getInt("popular"));
                list.add(newsModel);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public NewsModel getDetails(int id) {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM news WHERE id= '" + id + "'";
        NewsModel newsModel = new NewsModel();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                newsModel.setId(rs.getInt("id"));
                newsModel.setTitle(rs.getString("title"));
                newsModel.setType(rs.getString("type"));
                newsModel.setDescription(rs.getString("description"));
                newsModel.setContent(rs.getString("content"));
                newsModel.setImg(rs.getString("img"));
                newsModel.setAuthor(rs.getString("author"));
                newsModel.setTimerelease(rs.getDate("timerelease"));
                newsModel.setActive(rs.getInt("active"));
                newsModel.setPopular(rs.getInt("popular"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newsModel;
    }

    @Override
    public NewsModel getNewsById(Integer id) {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM news WHERE id='" + id + "'";
        NewsModel newsModel = new NewsModel();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                newsModel.setTitle(rs.getString("title"));
                newsModel.setType(rs.getString("type"));
                newsModel.setDescription(rs.getString("description"));
                newsModel.setContent(rs.getString("content"));
                newsModel.setImg(rs.getString("img"));
                newsModel.setAuthor(rs.getString("author"));
                newsModel.setTimerelease(rs.getDate("timerelease"));
                newsModel.setPopular(rs.getInt("popular"));
                newsModel.setActive(rs.getInt("active"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newsModel;
    }

    @Override
    public ArrayList<NewsModel> findNews(String name, int a, int b) {
        ArrayList<NewsModel> list = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM news WHERE active = 1 and title LIKE '%" + name + "%' limit ?, ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, a);
            ps.setInt(2, b);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                NewsModel news = new NewsModel();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setType(rs.getString("type"));
                news.setDescription(rs.getString("description"));
                news.setContent(rs.getString("content"));
                news.setImg(rs.getString("img"));
                news.setAuthor(rs.getString("author"));
                news.setTimerelease(rs.getDate("timerelease"));
                news.setPopular(rs.getInt("popular"));
                news.setActive(rs.getInt("active"));
                list.add(news);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void updateNews(NewsModel newsModel) {
        Connection connection = DBConnection.getConnection();
        String sql = "UPDATE news SET title = ?, `type` = ?, description = ?, content = ?, img = ?, author = ?, timerelease = ?, popular = ?, active = ?";
        sql += " WHERE id = ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, newsModel.getTitle());
            ps.setString(2, newsModel.getType());
            ps.setString(3, newsModel.getDescription());
            ps.setString(4, newsModel.getContent());
            ps.setString(5, newsModel.getImg());
            ps.setString(6, newsModel.getAuthor());
            ps.setDate(7, newsModel.getTimerelease());
            ps.setInt(8, newsModel.getPopular());
            ps.setInt(9, newsModel.getActive());
            ps.setInt(10, newsModel.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteNews(Integer id) {
        Connection connection = DBConnection.getConnection();
        String sql = "DELETE FROM news WHERE id = '" + id + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertNews(NewsModel newsModel) {
        Connection connection = DBConnection.getConnection();
        String sql = "INSERT INTO news(title, `type`, description, content, img, author, timerelease, popular, active) VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newsModel.getTitle());
            ps.setString(2, newsModel.getType());
            ps.setString(3, newsModel.getDescription());
            ps.setString(4, newsModel.getContent());
            ps.setString(5, newsModel.getImg());
            ps.setString(6, newsModel.getAuthor());
            ps.setDate(7, newsModel.getTimerelease());
            ps.setInt(8, newsModel.getPopular());
            ps.setInt(9, newsModel.getActive());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}