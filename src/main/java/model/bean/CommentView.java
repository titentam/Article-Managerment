package model.bean;

import java.sql.Timestamp;

public class CommentView {
    private int commentID;
    private String nameUser;
    private String articleID;
    private Timestamp time;
    private String content;

    public CommentView(int commentID, String nameUser, String articleID, Timestamp time, String content) {
        this.commentID = commentID;
        this.nameUser = nameUser;
        this.articleID = articleID;
        this.time = time;
        this.content = content;
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public String getNameUser() {
        return nameUser;
    }

    public void setNameUser(String nameUser) {
        this.nameUser = nameUser;
    }

    public String getArticleID() {
        return articleID;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
