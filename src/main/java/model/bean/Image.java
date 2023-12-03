package model.bean;

public class Image {
    private String imageID;
    private String articleID;
    private String path;

    // Constructors, getters, and setters

    public Image(String imageID, String articleID, String path) {
        this.imageID = imageID;
        this.articleID = articleID;
        this.path = path;
    }

    public String getImageID() {
        return imageID;
    }

    public void setImageID(String imageID) {
        this.imageID = imageID;
    }

    public String getArticleID() {
        return articleID;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
