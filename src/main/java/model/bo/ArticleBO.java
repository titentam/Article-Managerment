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
    public ArrayList<String> getCategoris(String id){
        return dao.getCategories(id);
    }

    public void insert(String title, String content, String[] categories){
        String id = generateID(10);
        var record = new Article(id,title,content);
        dao.insert(record);

        for (var categoryID:categories) {

            dao.insertCategory(id,categoryID);
        }
    }
    public void update(Article article, ArrayList<String> categoriesNew){
        dao.update(article);
        var id = article.getArticleID();
        var categoriesOld =dao.getCategories(id);

        for (var categoryID:categoriesNew) {
            if(!categoriesOld.contains(categoryID)){
                dao.insertCategory(id,categoryID);
            }
        }
        for (var categoryID:categoriesOld) {
            if(!categoriesNew.contains(categoryID)){
                dao.deleteCategory(id,categoryID);
            }
        }
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
