package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.DBConnection;

public class SavedDAO {
	private Connection conn;
    public SavedDAO(){
        this.conn = DBConnection.getConn();
    }
    
    public void deleteArticleCategory(String articleID){
        String sql = "Delete from saved where (`ArticleID` = ?);";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, articleID);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
