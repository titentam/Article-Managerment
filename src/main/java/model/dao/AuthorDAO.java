package model.dao;

import db.DBConnection;

import java.sql.*;

public class AuthorDAO {
    private Connection conn;
    public AuthorDAO () {
        this.conn = DBConnection.getConn();
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
}
