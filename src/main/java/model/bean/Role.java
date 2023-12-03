package model.bean;

public class Role {
    private String roleID;
    private String name;

    // Constructors, getters, and setters

    public Role(String roleID, String name) {
        this.roleID = roleID;
        this.name = name;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
