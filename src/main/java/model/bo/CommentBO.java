package model.bo;

import model.bean.Comment;
import model.bean.CommentView;
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
    public void insert(Comment comment){
        dao.insert(comment);
    }

}

