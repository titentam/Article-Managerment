package model.bo;

import model.bean.Article;
import model.dao.ArticleDAO;

import java.util.ArrayList;
import java.util.UUID;

public class ArticleBO {
    private ArticleDAO dao;
    public ArticleBO(){
        dao = new ArticleDAO();
    }
    public ArrayList<Article> getList(){
        return dao.getList();
    }
    public ArrayList<String> getAuthors(String id){
        return dao.getAuthors(id);
    }
    public Article getArticle(String id){
        return dao.getArticle(id);
    }

    public void insert(String title, String content, String categoryID){
        String id = generateID(10);
        var record = new Article(id,title,content);
        dao.insert(record);
        dao.insertCategory(id,categoryID);
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
