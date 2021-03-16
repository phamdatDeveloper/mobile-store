package vn.com.dutmobile.DAO;

import vn.com.dutmobile.model.ProductModel;

import java.util.ArrayList;

public interface ProductDAO {
    // lấy sản phẩm theo loại với limit
    ArrayList<ProductModel> getProduct(String type, int star, int maxProduct);

    // lấy sản phẩm theo id
    ProductModel getProductById(int id);

    //Lấy sản phẩm theo loại;
    ArrayList<ProductModel> getProductByType(String type, int i);

    //đếm số lượng loại sản phẩm
    int countProductByType(String type);

    //tìm kiếm sản phẩm theo tên
    ArrayList<ProductModel> searchProduct(String name);

    // lấy tất cả các sản phẩm
    ArrayList<ProductModel> getAllProduct();

    //lấy tất cả các sản phẩm cho phép hiện
    ArrayList<ProductModel> getAllProductActive();

    // lấy các sản phẩm khuyến mãi
    ArrayList<ProductModel> productPromotion();

    //Số trang tất cả sản phẩm
    ArrayList<ProductModel> numberPageProduct(int i);

    //số trang theo tìm kiếm
    ArrayList<ProductModel> searchPageProduct(String name, int i);

    //đếm số lượng sản phẩm
    public int getCountProduct();

    //thêm data to database
    public void insertToDB(ProductModel product);

    //update sản phẩm
    public void updateToDB(ProductModel product, int id);

//    public void updateProduct(int id);

    //lấy ra tất cả các loại điện thoại đang có trong hệ thống
    public ArrayList<String> getTypeProduct();

    public void deleteProduct(int id);

    ProductModel find(int id);

    // insert vao cart
    public void insertToCart(ProductModel productModel, String id , String pay);

    public void updateTypeActive(String type,int active);

    public void updateTypeActive(String newType, String oldType);

    public void insertToMyOders(ProductModel productModel, String id, String address);

    public void deleteOdersProduct(int id);

    public void updateOrders(int id, String done);
}
