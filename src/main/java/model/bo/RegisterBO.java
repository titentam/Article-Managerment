package model.bo;


import model.dao.RegisterDAO;

import java.sql.Date;
import java.util.Objects;

public class RegisterBO {
    private final RegisterDAO RegisterDAO=new RegisterDAO();
    public void register(String username, String password, String name, String email, Date dob, String stringGender) {
        // Additional business logic can be added here if needed
         int gender= Objects.equals(stringGender, "male") ?1:0;
        //check exist username
        if(RegisterDAO.getAllUserName().contains(username)){
            throw new RuntimeException("Username is already exist");
        }
        RegisterDAO.register(username, password, name,email,dob,gender);
    }
}
