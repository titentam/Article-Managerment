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

            ResultSet rs = stmt.executeQuery();
            while (rs.next()){

                list.add(new Category(rs.getString(1),rs.getString(2)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return list;
    }

    public Category getCategory(String id){
        Category category = null;
        try {
            String sql = "select * from Category where CategoryID = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()){
                category = new Category(rs.getString(1),rs.getString(2));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return category;
    }
    public ArrayList<Category> getListCategory(String articleID){
    	ArrayList<Category> list = new ArrayList<Category>();
        try {
        	String sql = "select * from articlecategory "
            		+ "inner join category "
            		+ "on articlecategory.CategoryID = category.CategoryID "
            		+ "where ArticleID=?";
        	
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, articleID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()){
            	list.add(new Category(rs.getString("category.CategoryID"), 
            					rs.getString("category.Name")));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public void insert(Category category){
        String sql = "Insert into category(`CategoryID`, `Name`) values(?,?)";

        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1,category.getCategoryID());
            stmt.setString(2,category.getName());
            int rs = stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void update(Category category){
        String sql = "UPDATE category SET `Name` = ? WHERE (`CategoryID` = ?);";

        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(2,category.getCategoryID());
            stmt.setString(1,category.getName());
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
    public void deleteCategory(String articleID, String categoryOld){
        String sqlDelete = "DELETE FROM articlecategory WHERE (ArticleID = ?) and (CategoryID = ?);";
        try {
            PreparedStatement stmt = conn.prepareStatement(sqlDelete);
            stmt.setString(1,articleID);
            stmt.setString(2,categoryOld);
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