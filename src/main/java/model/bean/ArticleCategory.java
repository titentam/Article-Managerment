package model.bean;

public class ArticleCategory {
    private String articleID;
    private String categoryID;

    // Constructors, getters, and setters

    public ArticleCategory(String articleID, String categoryID) {
        this.articleID = articleID;
        this.categoryID = categoryID;
    }

    public String getArticleID() {
        return articleID;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }
}