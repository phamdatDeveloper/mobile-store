package vn.com.dutmobile.DAO.Implement;

import vn.com.dutmobile.DAO.ProductDAO;
import vn.com.dutmobile.connection.DBConnection;
import vn.com.dutmobile.model.AccountModel;
import vn.com.dutmobile.model.ProductModel;

import java.sql.*;
import java.util.ArrayList;

public class ProductDAOimpl implements ProductDAO {
    @Override
    public ArrayList<ProductModel> getProduct(String type, int star, int maxProduct) {
        Connection con = DBConnection.getConnection();
        String sql = "select * from product where type = ? and active = 1 limit  ?,?";
        PreparedStatement statement = null;
        ArrayList<ProductModel> list = new ArrayList<>();
        try {
            statement = con.prepareStatement(sql);
            statement.setString(1, type);
            statement.setInt(2, star);
            statement.setInt(3, maxProduct);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ProductModel oneProduct = new ProductModel();
                oneProduct.setId(rs.getInt("id"));
                oneProduct.setProductName(rs.getString("productname"));
                oneProduct.setPrice(rs.getDouble("price"));
                oneProduct.setPricePromotion(rs.getDouble("pricepromotion"));
                oneProduct.setType(rs.getString("type"));
                oneProduct.setImage(rs.getString("image"));
                list.add(oneProduct);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public ProductModel getProductById(int id) {
        ProductModel product = new ProductModel();
        Connection con = DBConnection.getConnection();
        PreparedStatement statement = null;
        String sql = "Select * from product where id = ?";
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                product.setProductName(rs.getString("productname"));
                product.setPrice(rs.getDouble("price"));
                product.setPricePromotion(rs.getDouble("pricepromotion"));
                product.setImage(rs.getString("image"));
                product.setType(rs.getString("type"));
                product.setDescription(rs.getString("description"));
                product.setDetail(rs.getString("detail"));
                product.setImageDetail(rs.getString("imagedetail"));
                product.setActive(rs.getInt("active"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public ArrayList<ProductModel> getProductByType(String type, int i) {
        Connection con = DBConnection.getConnection();
        String sql = "select * from product where type = ? and active = 1 limit ?,12";
        PreparedStatement statement = null;
        ArrayList<ProductModel> list = new ArrayList<ProductModel>();
        try {
            statement = con.prepareStatement(sql);
            statement.setString(1, type);
            statement.setInt(2, i);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ProductModel oneProduct = new ProductModel();
                oneProduct.setId(rs.getInt("id"));
//                oneProduct.setProductName(rs.getString("productname"));
//                oneProduct.setPrice(rs.getDouble("price"));
//                oneProduct.setPricePromotion(rs.getDouble("pricepromotion"));
//                oneProduct.setType(rs.getString("type"));
//                oneProduct.setImage(rs.getString("image"));

                oneProduct.setProductName(rs.getString("productname"));
                oneProduct.setPrice(rs.getDouble("price"));
                oneProduct.setPricePromotion(rs.getDouble("pricepromotion"));
                oneProduct.setImage(rs.getString("image"));
                oneProduct.setType(rs.getString("type"));
                oneProduct.setDescription(rs.getString("description"));
                oneProduct.setDetail(rs.getString("detail"));
                oneProduct.setImageDetail(rs.getString("imagedetail"));
                oneProduct.setActive(rs.getInt("active"));
                list.add(oneProduct);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public int countProductByType(String type) {
        Connection con = DBConnection.getConnection();
        String sql = "select COUNT(id)  as number  from product where type = ? and active = 1 ";
        PreparedStatement statement = null;
        int count = 0;
        try {
            statement = con.prepareStatement(sql);
            statement.setString(1, String.valueOf(type));
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                count = rs.getInt("number");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    @Override
    public ArrayList<ProductModel> searchProduct(String name) {
        Connection con = DBConnection.getConnection();
        String sql = "select * from product where active =1 and productname like '%" + name + "%'";
        PreparedStatement statement = null;
        ArrayList<ProductModel> list = new ArrayList<>();
        try {
            statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ProductModel oneProduct = new ProductModel();
                oneProduct.setProductName(rs.getString("productname"));
                oneProduct.setPrice(rs.getDouble("price"));
                oneProduct.setPricePromotion(rs.getDouble("pricepromotion"));
                oneProduct.setImage(rs.getString("image"));
                oneProduct.setType(rs.getString("type"));
                oneProduct.setDescription(rs.getString("description"));
                oneProduct.setDetail(rs.getString("detail"));
                oneProduct.setImageDetail(rs.getString("imagedetail"));
                oneProduct.setActive(rs.getInt("active"));

                list.add(oneProduct);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public ArrayList<ProductModel> getAllProduct() {
        Connection con = DBConnection.getConnection();
        String sql = "select * from product ";
        PreparedStatement statement = null;
        ArrayList<ProductModel> list = new ArrayList<>();
        try {
            statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ProductModel oneProduct = new ProductModel();
                oneProduct.setProductName(rs.getString("productname"));
                oneProduct.setPrice(rs.getDouble("price"));
                oneProduct.setPricePromotion(rs.getDouble("pricepromotion"));
                oneProduct.setImage(rs.getString("image"));
                oneProduct.setType(rs.getString("type"));
                oneProduct.setActive(rs.getInt("active"));
                oneProduct.setId(rs.getInt("id"));
                list.add(oneProduct);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public ArrayList<ProductModel> getAllProductActive() {
        Connection con = DBConnection.getConnection();
        String sql = "select * from product where active = 1";
        PreparedStatement statement = null;
        ArrayList<ProductModel> list = new ArrayList<>();
        try {
            statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ProductModel oneProduct = new ProductModel();
                oneProduct.setProductName(rs.getString("productname"));
                oneProduct.setPrice(rs.getDouble("price"));
                oneProduct.setPricePromotion(rs.getDouble("pricepromotion"));
                oneProduct.setImage(rs.getString("image"));
                oneProduct.setType(rs.getString("type"));
                oneProduct.setActive(rs.getInt("active"));
                oneProduct.setId(rs.getInt("id"));
                list.add(oneProduct);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public ArrayList<ProductModel> productPromotion() {
        Connection con = DBConnection.getConnection();
        String sql = "select * from product where pricepromotion > 0 and active =1";
        PreparedStatement statement = null;
        ArrayList<ProductModel> list = new ArrayList<>();
        try {
            statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ProductModel oneProduct = new ProductModel();
//                oneProduct.setProductName(rs.getString("productname"));
//                oneProduct.setPrice(rs.getDouble("price"));
//                oneProduct.setPricePromotion(rs.getDouble("pricepromotion"));
//                oneProduct.setImage(rs.getString("image"));
//                oneProduct.setType(rs.getString("type"));
//                oneProduct.setPromotion(rs.getDouble("pricepromotion"));
                oneProduct.setId(rs.getInt("id"));


                oneProduct.setProductName(rs.getString("productname"));
                oneProduct.setPrice(rs.getInt("price"));
                oneProduct.setPricePromotion(rs.getInt("pricepromotion"));
                oneProduct.setImage(rs.getString("image"));
                oneProduct.setType(rs.getString("type"));
                oneProduct.setDescription(rs.getString("description"));
                oneProduct.setDetail(rs.getString("detail"));
                oneProduct.setImageDetail(rs.getString("imagedetail"));
                oneProduct.setActive(rs.getInt("active"));
                list.add(oneProduct);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    @Override
    public ArrayList<ProductModel> numberPageProduct(int i) {
        Connection con = DBConnection.getConnection();
        String sql = "select * from product where active =1 limit " + i + ",12";
        PreparedStatement statement = null;
        ArrayList<ProductModel> list = new ArrayList<>();
        try {
            statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ProductModel oneProduct = new ProductModel();
//                oneProduct.setProductName(rs.getString("productname"));
//                oneProduct.setPrice(rs.getDouble("price"));
//                oneProduct.setPricePromotion(rs.getDouble("pricepromotion"));
//                oneProduct.setImage(rs.getString("image"));
//                oneProduct.setType(rs.getString("type"));
//                oneProduct.setPromotion(rs.getDouble("pricepromotion"));
                oneProduct.setId(rs.getInt("id"));
                oneProduct.setProductName(rs.getString("productname"));
                oneProduct.setPrice(rs.getDouble("price"));
                oneProduct.setPricePromotion(rs.getDouble("pricepromotion"));
                oneProduct.setImage(rs.getString("image"));
                oneProduct.setType(rs.getString("type"));
                oneProduct.setDescription(rs.getString("description"));
                oneProduct.setDetail(rs.getString("detail"));
                oneProduct.setImageDetail(rs.getString("imagedetail"));
                oneProduct.setActive(rs.getInt("active"));
                list.add(oneProduct);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public ArrayList<ProductModel> searchPageProduct(String name, int i) {
        Connection con = DBConnection.getConnection();
        String sql = "select * from product where active =1 and productname like '%" + name + "%' limit " + i + ",12";
        PreparedStatement statement = null;
        ArrayList<ProductModel> list = new ArrayList<>();
        try {
            statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ProductModel oneProduct = new ProductModel();
//                oneProduct.setProductName(rs.getString("productname"));
//                oneProduct.setPrice(rs.getDouble("price"));
//                oneProduct.setPricePromotion(rs.getDouble("pricepromotion"));
//                oneProduct.setImage(rs.getString("image"));
//                oneProduct.setType(rs.getString("type"));
                oneProduct.setId(rs.getInt("id"));
                oneProduct.setProductName(rs.getString("productname"));
                oneProduct.setPrice(rs.getDouble("price"));
                oneProduct.setPricePromotion(rs.getDouble("pricepromotion"));
                oneProduct.setImage(rs.getString("image"));
                oneProduct.setType(rs.getString("type"));
                oneProduct.setDescription(rs.getString("description"));
                oneProduct.setDetail(rs.getString("detail"));
                oneProduct.setImageDetail(rs.getString("imagedetail"));
                oneProduct.setActive(rs.getInt("active"));
                list.add(oneProduct);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public int getCountProduct() {
        Connection con = DBConnection.getConnection();
        String sql = "select count(id) from product";
        PreparedStatement statement = null;
        int count = 0;
        try {
            statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    @Override
    public void insertToDB(ProductModel product) {
        Connection con = DBConnection.getConnection();
        String sql = "insert into product(productname,price,pricepromotion,image,imagedetail,type,description,detail,active) value(?,?,?,?,?,?,?,?,?)";
        PreparedStatement prs = null;
        try {
            prs = con.prepareStatement(sql);
            prs.setString(1, product.getProductName());
            prs.setDouble(2, product.getPrice());
            prs.setDouble(3, product.getPricePromotion());
            prs.setString(4, product.getImage());
            prs.setString(5, product.getImageDetail());
            prs.setString(6, product.getType());
            prs.setString(7, product.getDescription());
            prs.setString(8, product.getDetail());
            prs.setInt(9, product.getActive());
            int insert = prs.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateToDB(ProductModel product, int id) {
        Connection connection = DBConnection.getConnection();
        ProductDAOimpl productDAOimpl = new ProductDAOimpl();
        String sql = "UPDATE product set productname = ?, price=?,pricepromotion=?,image=?,imagedetail=?,type=?,active=?,description=?,detail=? WHERE id=?";
        PreparedStatement prs = null;
        try {
            prs = connection.prepareStatement(sql);
            prs.setString(1, product.getProductName());
            prs.setDouble(2, product.getPrice());
            prs.setDouble(3, product.getPricePromotion());
            prs.setString(4, product.getImage());
            prs.setString(5, product.getImageDetail());
            prs.setString(6, product.getType());
            prs.setInt(7, product.getActive());
            prs.setString(8, product.getDescription());
            prs.setString(9, product.getDetail());
            prs.setInt(10, id);
            prs.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public ArrayList<String> getTypeProduct() {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * from type_product WHERE active =1";
        PreparedStatement statement = null;
        ArrayList<String> list = new ArrayList<>();
        try {
            statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("type"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void deleteProduct(int id) {
        Connection con = DBConnection.getConnection();
        String sql = "DELETE FROM product WHERE id=?";
        PreparedStatement statement = null;
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            int rs = statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ProductModel find(int id) {
        try {
            PreparedStatement ps = DBConnection.getPreparedStatement("Select * from product where id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ProductModel p = new ProductModel();
                p.setId(rs.getInt("id"));
                p.setProductName(rs.getString("productname"));
                p.setPrice(rs.getDouble("price"));
                p.setImage(rs.getString("image"));
                p.setQuantity(1);
                return p;
            }
            return null;
        } catch (SQLException | ClassNotFoundException e) {
            return null;

        }
    }

    @Override
    public void insertToCart(ProductModel productModel, String id,String pay) {
        Connection con = DBConnection.getConnection();
        AccountModel acc = new AccountModel();
        String sql = "insert into cart(image,productname,price,quantity,totalprice,ngay_gio,trang_thai,id_product,id_khach_hang,thanh_toan) value(?,?,?,?,?,?,'Đang xử lí',?,?,?)";
        PreparedStatement prs = null;
        try {
            prs = con.prepareStatement(sql);
            prs.setString(1, productModel.getImage());
            prs.setString(2, productModel.getProductName());
            prs.setDouble(3, productModel.getPrice());
            prs.setInt(4, productModel.getQuantity());
            prs.setDouble(5, (productModel.getQuantity() * productModel.getPrice()));
            prs.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
            prs.setInt(7, productModel.getId());
            prs.setString(8, id);
            prs.setString(9,pay);

            prs.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void updateTypeActive(String type, int active) {
        Connection connection = DBConnection.getConnection();
        ProductDAOimpl productDAOimpl = new ProductDAOimpl();
        String sql = "UPDATE product set active=? WHERE type=?";
        PreparedStatement prs = null;
        try {
            prs = connection.prepareStatement(sql);
            prs.setInt(1,active);
            prs.setString(2,type);
            prs.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateTypeActive(String newType, String oldType) {
        Connection connection = DBConnection.getConnection();
        ProductDAOimpl productDAOimpl = new ProductDAOimpl();
        String sql = "UPDATE product set type=? WHERE type=?";
        PreparedStatement prs = null;
        try {
            prs = connection.prepareStatement(sql);
            prs.setString(1,newType);
            prs.setString(2,oldType);
            prs.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertToMyOders(ProductModel productModel, String id, String address) {
        Connection con = DBConnection.getConnection();
        String sql = "insert into orders(image,productname,price,quantity,totalprice,ngay_gio,id_product,id_khach_hang,address) value(?,?,?,?,?,?,?,?,?)";
        PreparedStatement prs = null;
        try {
            prs = con.prepareStatement(sql);
            prs.setString(1, productModel.getImage());
            prs.setString(2, productModel.getProductName());
            prs.setDouble(3, productModel.getPrice());
            prs.setInt(4, productModel.getQuantity());
            prs.setDouble(5, (productModel.getQuantity() * productModel.getPrice()));
            prs.setTimestamp(6,new Timestamp(System.currentTimeMillis()));
            prs.setInt(7, productModel.getId());
            prs.setString(8,id);
            prs.setString(9, address);

            prs.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void deleteOdersProduct(int id) {
        Connection con = DBConnection.getConnection();
        String sql = "DELETE FROM cart WHERE id=?";
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateOrders(int id, String done) {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE cart set trang_thai = ? WHERE id = ? ";
        try {
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1,done);
            statement.setInt(2,id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
