package model.bo;

import model.bean.Category;
import model.dao.ArticleDAO;
import model.dao.CategoryDAO;

import java.util.ArrayList;
import java.util.UUID;

public class CategoryBO {
    private CategoryDAO dao;
    public CategoryBO(){
        dao = new CategoryDAO();
    }
    public ArrayList<Category> getList(){
        return dao.getList();
    }
    public void insert(String name){
        dao.insert(new Category("C" + generateID(5),name));
    }
    public void update(String id, String name){
        dao.update(new Category(id,name));
    }

    public Category getCategory(String id){
        return dao.getCategory(id);
    }

    private static String generateID(int length) {
        if (length <= 0) {
            throw new IllegalArgumentException("Length must be a positive integer.");
        }

        // Tạo UUID ngẫu nhiên
        UUID uuid = UUID.randomUUID();

        // Chuyển đổi UUID thành chuỗi
        String uuidString = uuid.toString().replace("-", "");

        // Trả về chuỗi con độ dài mong muốn
        return uuidString.substring(0, length);
    }

}

