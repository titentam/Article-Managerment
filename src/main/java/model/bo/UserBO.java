package model.bo;

import java.util.ArrayList;
import java.util.Iterator;

import model.bean.User;
import model.dao.CommentDAO;
import model.dao.UserDAO;

public class UserBO {
    private final UserDAO userDAO = new UserDAO();
    public Object[] getAllUser(String categoryRole, String searchText, int page, int pageSize) {
    	ArrayList<User> list = userDAO.getAllUser(categoryRole, searchText);
    	int offset = (page - 1) * pageSize;
    	int numberOfPages = (int) Math.ceil(list.size() * 1.0 / pageSize);

    	ArrayList<User> res = new ArrayList<>(list.subList(offset, Math.min(offset + pageSize, list.size())));
    	return new Object[] { res, numberOfPages };
    }
    public User getUserDetail(String username) {
    	return userDAO.getUserDetail(username);
    }
    
    public void updateRole(String username, String roleID) {
    	User user = new User();
    	user.setUsername(username);
    	user.setRoleID(roleID);
    	userDAO.updateUser(user, "update-role");
    }
    
    public void updateUser(User user) {
    	userDAO.updateUser(user, null);
    }
    
    public void deleteUser(String username) {
    	CommentDAO commentDAO = new CommentDAO();
    	commentDAO.deleteCommentOfUser(username);
    	userDAO.deleteUser(username);
    }
}
