package dto;

public class AccountDTO {
    private int id;
    private String username;
    private String email;
    private String password;
    private boolean ban;
    private int role;
    private int subscriptionID;

    public AccountDTO() {
    }

    public AccountDTO(int id, String username, String email, String password, boolean ban, int role, int subscriptionID) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.ban = ban;
        this.role = role;
        this.subscriptionID = subscriptionID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public boolean isBan() {
        return ban;
    }

    public void setBan(boolean ban) {
        this.ban = ban;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getSubscriptionID() {
        return subscriptionID;
    }

    public void setSubscriptionID(int subscriptionID) {
        this.subscriptionID = subscriptionID;
    }
    
    // Thêm phương thức getUserID() để có thể sử dụng userID
    public int getUserID() {
        return id;
    }
}
