package model.bo;

import java.util.ArrayList;

import model.bean.Role;
import model.dao.RoleDAO;

public class RoleBO {
	private final RoleDAO roleDAO =new RoleDAO();
	public ArrayList<Role> getAllRole() {
		return roleDAO.getAllRole();
	}
}
