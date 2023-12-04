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

}
