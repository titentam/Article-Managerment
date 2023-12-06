package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import db.DBConnection;
import model.bean.User;

public class UserDAO {
	private final Connection conn;

	public UserDAO() {
		this.conn = DBConnection.getConn();
	}

	public ArrayList<User> getAllUser(String categoryRole, String searchText) {
		ArrayList<User> list = new ArrayList<User>();
		
		try {
			String query = "select * from user inner join role where user.RoleID = role.RoleID and locked=0";
			if (!categoryRole.equals("all")) {
				query += " and user.RoleID = '" + categoryRole + "'";
			}
			if (searchText != null) {
				query += " and (username like '%" + searchText 
						+ "%' or user.name like '%" + searchText + "%' or email like '%" + searchText + "%')";
			}
			
			PreparedStatement stmt = conn.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				String username = rs.getString("username");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date dob = rs.getDate("dob");
				int gender = rs.getInt("gender");
				String roleID = rs.getString("RoleID");

				User user = new User(username, null, name, email, dob, gender, roleID);
				user.setRoleName(rs.getString("Role.Name"));
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public User getUserDetail(String username) {
		User user = null;
		try {
			String query = "select * from user inner join role where user.RoleID = role.RoleID and username=?";
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date dob = rs.getDate("dob");
				int gender = rs.getInt("gender");
				String roleID = rs.getString("RoleID");

				user = new User(username, null, name, email, dob, gender, roleID);
				user.setRoleName(rs.getString("Role.Name"));
				user.setLocked(rs.getInt("Locked"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public void updateUser(User user, String action) {
		try {
			String query;
			if (action.equals("update-role"))
				query = "update user set RoleID=? where username=?";
			else if (action.equals("delete-user"))
				query = "update user set Locked=1 where username=?";
			else
				query = "update user set name=?, email=?, dob=?,gender=?, RoleID=? where username=?";

			PreparedStatement stmt = conn.prepareStatement(query);
			if (action.equals("update-role")) {
				stmt.setString(1, user.getRoleID());
				stmt.setString(2, user.getUsername());
			} else if (action.equals("delete-user")) {
				stmt.setString(1, user.getUsername());
			} else {
				stmt.setString(1, user.getName());
				stmt.setString(2, user.getEmail());
				stmt.setDate(3, (java.sql.Date) user.getDob());
				stmt.setInt(4, user.getGender());
				stmt.setString(6, user.getRoleID());
				stmt.setString(7, user.getUsername());
			}
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
