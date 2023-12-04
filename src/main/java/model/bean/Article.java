package model.bean;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class Article {
    private String articleID;
    private String title;
    private String content;
    private boolean locked;
    private Timestamp time;

    // Constructors, getters, and setters


    public Article(String articleID, String title, String content, boolean locked, Timestamp time) {
        this.articleID = articleID;
        this.title = title;
        this.content = content;
        this.locked = locked;
        this.time = time;
    }

    public String getArticleID() {
        return articleID;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean isLocked() {
        return locked;
    }

    public void setLocked(boolean locked) {
        this.locked = locked;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }
}