package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.DBConnection;

public class AuthorCategoryDAO {
	private Connection conn;
    public AuthorCategoryDAO(){
        this.conn = DBConnection.getConn();
    }
    
    public void deleteArticleCategory(String articleID){
        String sql = "Delete from authorarticle where (`ArticleID` = ?);";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, articleID);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
