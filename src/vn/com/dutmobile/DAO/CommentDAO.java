package vn.com.dutmobile.DAO;

import javax.servlet.jsp.jstl.sql.Result;
import java.sql.ResultSet;

public interface CommentDAO {
    //them comment product vao db
    public void insertComment(int id,String name,String email,String comment);
    //lay comment theo id
    public ResultSet getCommentProduct(String id);
}
