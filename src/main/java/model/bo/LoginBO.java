package model.bo;

import model.dao.LoginDAO;

public class LoginBO {
    private final LoginDAO LoginDAO=new LoginDAO();
    public  Object[] isValidUser(String username, String password) {
        // Additional business logic can be added here if needed
        return LoginDAO.isValidUser(username, password);
    }
    public String getRoleID(String username, String password){
        return LoginDAO.getRoleID(username, password);
    }
}
