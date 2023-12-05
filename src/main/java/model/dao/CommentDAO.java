package model.dao;

import db.DBConnection;
import model.bean.Category;
import model.bean.CommentView;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentDAO {
    private Connection conn;
    public CommentDAO(){
        this.conn = DBConnection.getConn();
    }
    public ArrayList<CommentView> getCommentsArticle(String articleID){
        ArrayList<CommentView> list = new ArrayList<>();

        try {
            String sql = "SELECT c.CommentID, u.Name, c.ArticleID, c.Time, c.Content\n" +
                    "FROM comment c\n" +
                    "JOIN user u ON c.Username = u.Username\n" +
                    "WHERE c.ArticleID = ?;";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1,articleID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()){

                list.add(new CommentView(rs.getInt(1),rs.getString(2),
                        rs.getString(3),rs.getTimestamp(4),
                        rs.getString(5)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}
