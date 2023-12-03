package model.dao;

import db.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
}
