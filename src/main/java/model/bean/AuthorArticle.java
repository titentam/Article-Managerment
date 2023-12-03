package model.bean;

public class AuthorArticle {
    private String username;
    private String articleID;

    // Constructors, getters, and setters

    public AuthorArticle(String username, String articleID) {
        this.username = username;
        this.articleID = articleID;
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
}