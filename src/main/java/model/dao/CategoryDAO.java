package model.dao;

import db.DBConnection;
import model.bean.Article;
import model.bean.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CategoryDAO {
    private Connection conn;
    public CategoryDAO(){
        this.conn = DBConnection.getConn();
    }
    public ArrayList<Category> getList(){
        ArrayList<Category> list = new ArrayList<>();

        try {
            String sql = "select * from Category";
            PreparedStatement stmt = conn.prepareStatement(sql);
            System.out.println(sql);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()){

                list.add(new Category(rs.getString(1),rs.getString(2)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return list;
    }
}
