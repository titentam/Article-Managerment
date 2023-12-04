package model.bean;

import java.text.DateFormat;
import java.util.Date;

public class Saved {
    private String username;
    private String articleID;
    private Date time;

    // Constructors, getters, and setters

    public Saved(String username, String articleID, Date time) {
        this.username = username;
        this.articleID = articleID;
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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}