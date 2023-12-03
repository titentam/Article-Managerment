package model.dao;

import db.DBConnection;
import model.bean.Article;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ArticleDAO {
    private Connection conn;
    public ArticleDAO(){
        this.conn = DBConnection.getConn();
    }
    public ArrayList<Article> getList(){
        ArrayList<Article> list = new ArrayList<>();

        try {
            String sql = "select * from article order by ArticleID desc";
            PreparedStatement stmt = conn.prepareStatement(sql);
            System.out.println(sql);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()){
                list.add(new Article(rs.getString(1),rs.getString(2),rs.getString(3)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return list;
    }

}
