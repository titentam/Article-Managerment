package model.bo;

import model.bean.Article;
import model.dao.ArticleDAO;

import java.util.ArrayList;

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

}
