package model.dao;

import db.DBConnection;
import model.bean.Article;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class ArticleDAO {
    private Connection conn;
    public ArticleDAO(){
        this.conn = DBConnection.getConn();
    }
    public ArrayList<Article> getList(){
        ArrayList<Article> list = new ArrayList<>();

        try {
            String sql = "select * from article order by Time desc";
            PreparedStatement stmt = conn.prepareStatement(sql);
            System.out.println(sql);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()){

                list.add(new Article(rs.getString(1),rs.getString(2),
                        rs.getString(3),rs.getBoolean(4),rs.getTimestamp(5)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return list;
    }
    public ArrayList<String> getAuthors(String id){
        ArrayList<String> list = new ArrayList<>();
        try {
            String sql = "SELECT u.Name\n" +
                        "FROM `user` u\n" +
                        "JOIN `authorarticle` aa ON u.Username = aa.Username\n" +
                        "WHERE aa.ArticleID = ?;";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1,id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()){
                list.add(rs.getString(1));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return list;
    }
    public Article getArticle(String id){
        String sql = "select * from article where ArticleID=?";

        Article record = null;
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1,id);
            ResultSet rs = stmt.executeQuery();
            System.out.println(stmt);
            if(rs.next()){
                record =  new Article(rs.getString(1),rs.getString(2),
                        rs.getString(3),rs.getBoolean(4),rs.getTimestamp(5));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return record;
    }
    public String getCategory(String id){
        String sql = "select CategoryID from articlecategory where ArticleID=?";

        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1,id);
            ResultSet rs = stmt.executeQuery();
            System.out.println(stmt);
            if(rs.next()){
                return rs.getString(1);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
    public void insert(Article article){
        String sql = "Insert into article(`ArticleID`, `Title`, `Content`) values(?,?,?)";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1,article.getArticleID());
            stmt.setString(2,article.getTitle());
            stmt.setString(3,article.getContent());
            int rs = stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void update(Article article){
        String sql = "UPDATE article SET `Title` = ?, `Content` = ? WHERE (`ArticleID` = ?);";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1,article.getTitle());
            stmt.setString(2,article.getContent());
            stmt.setString(3,article.getArticleID());
            int rs = stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void insertAuthors(String articleID, String authorID){
        String sql = "Insert into authorarticle(`Username`, `ArticleID`) values(?,?)";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1,authorID);
            stmt.setString(2,articleID);
            int rs = stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void insertCategory(String articleID, String categoryID){
        String sql = "Insert into articlecategory(`ArticleID`, `CategoryID`) values(?,?)";

        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1,articleID);
            stmt.setString(2,categoryID);
            int rs = stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void updateCategory(String articleID, String categoryID,String categoryOld){
        String sqlDelete = "DELETE FROM articlecategory WHERE (ArticleID = ?) and (CategoryID = ?);";
        String sqlInsert = "Insert into articlecategory(`ArticleID`, `CategoryID`) values(?,?)";
        try {
            PreparedStatement stmt = conn.prepareStatement(sqlDelete);
            stmt.setString(1,articleID);
            stmt.setString(2,categoryOld);
            int rs = stmt.executeUpdate();

            stmt = conn.prepareStatement(sqlInsert);
            stmt.setString(1,articleID);
            stmt.setString(2,categoryID);
            rs = stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
