package model.dao;

import db.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
    private final Connection conn;
    public LoginDAO(){
        this.conn = DBConnection.getConn();
    }
    public  Object[] isValidUser(String username, String password) {
        boolean isValid = false;
        int roleID = -1;
        try {
            String query = "select * from user";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                if (username.equals(rs.getString("username")) && password.equals(rs.getString("password"))) {
                    isValid = true;
                    roleID = rs.getInt("RoleID");
                    break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new Object[]{isValid, roleID};
    }
    public String getRoleID(String username, String password){
        String query = "select RoleID from user where Username = ? and Password = ?";
        PreparedStatement stmt = null;
        String roleID = null;
        try {
            stmt = conn.prepareStatement(query);
            stmt.setString(1,username);
            stmt.setString(2,password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()){
                roleID = rs.getString(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return roleID;
    }
}
