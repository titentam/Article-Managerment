package model.bean;

public class Article {
    private String articleID;
    private String title;
    private String content;

    // Constructors, getters, and setters

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
}