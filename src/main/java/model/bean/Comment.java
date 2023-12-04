package model.bean;

import java.text.DateFormat;
import java.util.Date;

public class Comment {
    private String username;
    private String articleID;
    private String content;
    private Date time;

    // Constructors, getters, and setters

    public Comment(String username, String articleID, String content, Date time) {
        this.username = username;
        this.articleID = articleID;
        this.content = content;
        this.time = time;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
