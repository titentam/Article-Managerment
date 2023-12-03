package model.bean;

public class Comment {
    private String username;
    private String articleID;
    private String content;

    // Constructors, getters, and setters

    public Comment(String username, String articleID, String content) {
        this.username = username;
        this.articleID = articleID;
        this.content = content;
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
}
