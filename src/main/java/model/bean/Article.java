package model.bean;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.ArrayList;

public class Article {
    private String articleID;
    private String title;
    private String content;
    private boolean locked;
    private Timestamp time;
    private int viewers;
    private ArrayList<Category> categories;

    // Constructors, getters, and setters


    public Article(String articleID, String title, String content, boolean locked, Timestamp time) {
        this.articleID = articleID;
        this.title = title;
        this.content = content;
        this.locked = locked;
        this.time = time;
    }
    
    public Article(String articleID, String title, String content, boolean locked,  Timestamp time, int viewers) {
		super();
		this.articleID = articleID;
		this.title = title;
		this.content = content;
		this.time = time;
		this.locked = locked;
		this.setViewers(viewers);
	}
	public Article(String articleID, String title, String content) {
        this.articleID = articleID;
        this.title = title;
        this.content = content;
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

	public int getViewers() {
		return viewers;
	}

	public void setViewers(int viewers) {
		this.viewers = viewers;
	}

	public ArrayList<Category> getCategories() {
		return categories;
	}

	public void setCategories(ArrayList<Category> categories) {
		this.categories = categories;
	}
}