package vn.com.dutmobile.DAO;

import vn.com.dutmobile.model.TypeProductModel;

import java.util.ArrayList;

public interface TypeProductDAO {
    // lấy tất cả các loại trong đb
    public ArrayList<TypeProductModel> getAllType();

    //lấy type bằng id
    public TypeProductModel getTypeById(int id);

    //update dữ liệu type
    public void updateType(int id, String type, int active);

    //xóa phân loại
    public void deleteType(int id);

    //thêm phân loại
    public void insertType(String type, int active);
}
