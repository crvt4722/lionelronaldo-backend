package model;

public class UserProfile {
    private String fullname, email;

    public UserProfile(String fullname, String email) {
        this.fullname = fullname;
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public String getEmail() {
        return email;
    }
    
}
