package model.bean;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Date;

public class Comment {
    private int commentID;
    private String username;
    private String articleID;
    private Timestamp time;
    private String content;

    public Comment(int commentID, String username, String articleID, Timestamp time, String content) {
        this.commentID = commentID;
        this.username = username;
        this.articleID = articleID;
        this.time = time;
        this.content = content;
    }
    public Comment(String username, String articleID,String content) {
        this.username = username;
        this.articleID = articleID;
        this.content = content;
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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
