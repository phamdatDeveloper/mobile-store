package vn.com.dutmobile.model;

public class TypeProductModel {
    private int id;
    private String type;
    private int active;



    public TypeProductModel(String type, int active,int id) {
        this.id =id;
        this.type = type;
        this.active = active;
    }

    public TypeProductModel() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }
}
