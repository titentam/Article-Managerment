package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.DBConnection;

public class AuthorArticleDAO {
	private Connection conn;
    public AuthorArticleDAO(){
        this.conn = DBConnection.getConn();
    }
    
    public void deleteArticleCategory(String articleID){
        String sql = "Delete from articlecategory where (`ArticleID` = ?);";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, articleID);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
