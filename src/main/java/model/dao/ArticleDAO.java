package model.dao;

import db.DBConnection;
import model.bean.Article;
import model.bean.Category;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class ArticleDAO {
    private Connection conn;
    public ArticleDAO(){
        this.conn = DBConnection.getConn();
    }
    public ArrayList<Article> getList(String category, String sortBy, String searchText){
        ArrayList<Article> list = new ArrayList<>();
        String sql;
        try {
        	if (searchText != null) {
        		sql = "SELECT DISTINCT article.ArticleID, Title, Content, article.Locked, Time, Viewers "
        		+ "FROM article "
        		+ "LEFT JOIN articlecategory ON article.ArticleID = articlecategory.ArticleID "
   				+ "LEFT JOIN authorarticle ON article.ArticleID = authorarticle.ArticleID "     				
        		+ "LEFT JOIN user ON user.Username = authorarticle.Username "
        		+ "WHERE (article.Title LIKE '%" + searchText + "%' OR user.Name LIKE '%" + searchText + "%')";
        	} else {
        		sql = "SELECT DISTINCT article.ArticleID, Title, Content, article.Locked, Time, Viewers  "
        			+ "FROM article "
        			+ "INNER JOIN articlecategory "
        			+ "WHERE article.ArticleID = articlecategory.ArticleID";
        	}
        	
        	// Xu ly tung truong sort & filter
        	if (!category.equals("all")) {
        		sql += " AND CategoryID = '" + category + "'";
        	}
        	System.out.println(sql);
        	
        	switch (sortBy) {
			case "none":
				sql += " order by Time desc";
				break;
			case "most-viewers":
				sql += " order by Viewers desc";
				break;
			case "less-viewers":
				sql += " order by Viewers";
				break;
			case "a-z":
				sql += " order by Title";
				break;
			case "z-a":
				sql += " order by Title desc";
				break;
			default:
				break;
			}

        	PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()){
                list.add(new Article(rs.getString(1),rs.getString(2),
                        rs.getString(3), rs.getBoolean(4), rs.getTimestamp(5), rs.getInt(6)));
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
            if(rs.next()){
                record =  new Article(rs.getString(1),rs.getString(2),
                        rs.getString(3),rs.getBoolean(4),rs.getTimestamp(5));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return record;
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
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    // Thuc hien buoc xoa cac bang chua articleID la khoa ngoai trong ArticleBO
    public void deleteArticle(String articleID){
        String sql = "Delete from article where (`ArticleID` = ?);";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, articleID);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public void updateLock(String articleID, boolean locked){
        String sql = "UPDATE article SET `Locked` = ? WHERE (`ArticleID` = ? AND `LOCKED` = ?);";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setBoolean(1, locked);
            stmt.setString(2, articleID);
            stmt.setBoolean(3, !locked);
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
