package vn.com.dutmobile.model;

import java.util.Collection;
import java.util.HashMap;

public class Cart {
    private ProductModel p;

    public Cart(ProductModel p) {
        this.p = p;
    }

    public ProductModel getP() {
        return p;
    }

    public void setP(ProductModel p) {
        this.p = p;
    }

    HashMap<Integer, ProductModel> data;

    public Cart(){
        this.data = new HashMap<>();
    }
    public ProductModel get(int id) {
        return data.get(id);
    }
    public int put(ProductModel item){
        if(data.containsKey(item.getId()))
            data.get(item.getId()).quantityUp();
        else data.put(item.getId(),item);
        return data.get(item.getId()).getQuantity();

    }
    public int put(int id , int quantity){
        if(data.containsKey(id))
            data.get(id).quantityUp(quantity);
        return data.get(id).getQuantity();
    }
    public boolean remove(int id) {
        return data.remove(id) == null;
    }
    public double total(){
        double sum = 0;
        for (ProductModel p : data.values())
            sum +=(p.getQuantity() * p.getPrice());
        return sum;
    }
    public Collection<ProductModel> list() {
        return data.values();
    }
}
