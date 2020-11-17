package loginManager.manager_model;

public class Manager {
    private String ManagerID;
    private String email;
    private String password;
    private String Hotel_id;
    private String firstname;
    private String lastname;

    public String getManagerID(){return ManagerID;}
    public void setManagerID(String ManagerID){this.ManagerID=ManagerID;}
    public String getEmail(){return email;}
    public void setEmail(String email){this.email=email;}
    public String getPassword(){return password;}
    public void setPassword(String password){this.password=password;}
    public String getHotel_id(){return Hotel_id;}
    public void setHotel_id(String Hotel_id){this.Hotel_id=Hotel_id;}
    public String getFirstname(){return firstname;}
    public void setFirstname(String firstname){this.firstname=firstname;}
    public String getLastname(){return lastname;}
    public void setLastname(String lastname){this.lastname=lastname;}
}
