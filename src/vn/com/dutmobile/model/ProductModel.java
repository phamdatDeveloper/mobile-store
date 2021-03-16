package vn.com.dutmobile.model;

import java.io.InputStream;

public class ProductModel {
    private int id;
    private String productName;
    private double price;
    private double pricePromotion;
    private String type;
    private String image;
    private String imageDetail;
    private double promotion;
    private String description;
    private String detail;
    private int active;
    private int quantity;


    public ProductModel(int id, String productName, double price, double pricePromotion, String type, String image, String imageDetail, double promotion, String description, String detail, int active) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.pricePromotion = pricePromotion;
        this.type = type;
        this.image = image;
        this.imageDetail = imageDetail;
        this.promotion = promotion;
        this.description = description;
        this.detail = detail;
        this.active = active;
    }

    public ProductModel(int id, String productName, double price, double pricePromotion, String type, String image, double promotion) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.pricePromotion = pricePromotion;
        this.type = type;
        this.image = image;
        this.promotion = promotion;
    }
    public ProductModel(int id, String productName, double price, String type, String image, int quantity) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.type = type;
        this.image = image;
        this.quantity = quantity;
    }

    public ProductModel(int id, String productName, double price, double pricePromotion, String type, String image) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.pricePromotion = pricePromotion;
        this.type = type;
        this.image = image;
    }

    public ProductModel() {

    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getPricePromotion() {
        return pricePromotion;
    }

    public void setPricePromotion(double pricePromotion) {
        this.pricePromotion = pricePromotion;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getPromotion() {
        return promotion;
    }

    public void setPromotion(double promotion) {
        this.promotion = promotion;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getImageDetail() {
        return imageDetail;
    }

    public void setImageDetail(String imageDetail) {
        this.imageDetail = imageDetail;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public int getQuantity() {
        return quantity;
    }


    public void setQuantity(int quantity) {
        if (quantity < 1) quantity = 1;
        this.quantity = quantity;
    }

    public void quantityUp() {
        this.quantity++;
    }

    public void quantityUp(int quantity) {
        setQuantity(quantity);
    }

    public double totalSum() {
        return   (price * quantity);
    }

}
