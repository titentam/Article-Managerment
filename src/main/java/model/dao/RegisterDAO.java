package model.dao;

import db.DBConnection;
import model.bean.User;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RegisterDAO {
    private static Connection conn;
    public RegisterDAO(){
        conn = DBConnection.getConn();
    }
    public void register(String username, String password, String name, String email, Date dob, Integer gender) {
        try {
            String query = "insert into user(username, password, name, email, dob,gender, RoleID) values(?,?,?,?,?,?,?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, name);
            stmt.setString(4, email);
            stmt.setDate(5,  dob);
            stmt.setInt(6, gender);
            stmt.setString(7, "R2");
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public  List<String> getAllUserName(){
        List<String> listUserName = new ArrayList<>();;
        try {
            String query = "select user.Username from user";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                listUserName.add(rs.getString("Username"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listUserName;
    }
}
