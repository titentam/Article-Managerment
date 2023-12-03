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

}
