package model.bo;

import model.bean.Category;
import model.bean.CommentView;
import model.dao.CategoryDAO;
import model.dao.CommentDAO;

import java.util.ArrayList;

public class CommentBO {
    private CommentDAO dao;
    public CommentBO(){
        dao = new CommentDAO();
    }
    public ArrayList<CommentView> getCommentsArticle(String articleID){
        return dao.getCommentsArticle(articleID);
    }

}

