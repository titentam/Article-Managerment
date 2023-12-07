package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DBConnection;
import model.bean.Role;

public class RoleDAO {
	private final Connection conn;

	public RoleDAO() {
		this.conn = DBConnection.getConn();
	}

	public ArrayList<Role> getAllRole() {
		ArrayList<Role> list = new ArrayList<Role>();
		
		try {
			String query = "select * from role";
			
			PreparedStatement stmt = conn.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				String roleID = rs.getString(1);
				String roleName = rs.getString(2);

				Role role = new Role(roleID, roleName);
				list.add(role);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
