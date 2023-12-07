package model.bo;

import model.bean.Article;
import model.bean.Category;
import model.dao.AuthorArticleDAO;
import model.dao.ArticleDAO;
import model.dao.AuthorCategoryDAO;
import model.dao.CategoryDAO;
import model.dao.CommentDAO;
import model.dao.SavedDAO;

import java.util.ArrayList;
import java.util.UUID;

public class ArticleBO {
    private ArticleDAO dao;
    public ArticleBO(){
        dao = new ArticleDAO();
    }
    public Object[] getList(String category, String sortBy, String searchText, int page, int pageSize){
    	ArrayList<Article> list = dao.getList(category, sortBy, searchText);
    	for (Article article : list) {
			ArrayList<Category> categories = new CategoryDAO().getListCategory(article.getArticleID());
			article.setCategories(categories);
		}
    	
    	int offset = (page - 1) * pageSize;
    	int numberOfPages = (int) Math.ceil(list.size() * 1.0 / pageSize);
    	ArrayList<Article> res = new ArrayList<>(list.subList(offset, Math.min(offset + pageSize, list.size())));
    	return new Object[] { res, numberOfPages };
    }
    public ArrayList<String> getAuthors(String id){
        return dao.getAuthors(id);
    }
    public Article getArticle(String id){
        Article article = dao.getArticle(id);
		ArrayList<Category> categories = new CategoryDAO().getListCategory(article.getArticleID());
		article.setCategories(categories);
		return article;
    }

    public void insert(String title, String content, String categoryID){
        String id = generateID(10);
        var record = new Article(id,title,content);
        dao.insert(record);
        new CategoryDAO().insertCategory(id,categoryID);
    }
    public void update(Article article, String categoryID, String categoryOld){
        dao.update(article);
        new CategoryDAO().updateCategory(article.getArticleID(),categoryID,categoryOld);
    }
    
    public void updateLock(String articleID, boolean locked){
        dao.updateLock(articleID, locked);
    }

    public void deleteArticle (String articleID) {
    	AuthorArticleDAO articleCategoryDAO = new AuthorArticleDAO();
    	AuthorCategoryDAO authorCategoryDAO = new AuthorCategoryDAO();
    	CommentDAO commentDAO = new CommentDAO();
    	SavedDAO savedDAO = new SavedDAO();
    	
    	articleCategoryDAO.deleteArticleCategory(articleID);
    	authorCategoryDAO.deleteArticleCategory(articleID);
    	commentDAO.deleteCommentOfArticle(articleID);
    	savedDAO.deleteArticleCategory(articleID);
    	dao.deleteArticle(articleID);
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
