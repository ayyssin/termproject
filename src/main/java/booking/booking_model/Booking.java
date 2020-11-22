package booking.booking_model;

public class Booking {
    private String Booking_id;
    private String User_email;
    private String City;
    private String Check_in;
    private String Check_out;
    private String Guests;
    private String Finished;
    private String Room_id;
    private String Hotel_id;
    private String Total_cost;
    private String Room_type;

    public String getRoom_type(){return Room_type;}
    public void setRoom_type(String Room_type){this.Room_type=Room_type;}


    public String getBooking_id() {
        return Booking_id;
    }

    public void setBooking_id(String booking_id) {
        this.Booking_id = booking_id;
    }

    public String getUser_email() {
        return User_email;
    }

    public void setUser_email(String user_email) {
        this.User_email = user_email;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String city) {
        this.City = city;
    }

    public String getCheck_in() {
        return Check_in;
    }

    public void setCheck_in(String check_in) {
        this.Check_in = check_in;
    }

    public String getCheck_out() {
        return Check_out;
    }

    public void setCheck_out(String check_out) {
        this.Check_out = check_out;
    }

    public String getGuests() {
        return Guests;
    }

    public void setGuests(String guests) {
        this.Guests = guests;
    }

    public String getFinished() {
        return Finished;
    }

    public void setFinished(String finished) {
        this.Finished = finished;
    }

    public String getRoom_id() {
        return Room_id;
    }

    public void setRoom_id(String room_id) {
        this.Room_id = room_id;
    }

    public String getHotel_id() {
        return Hotel_id;
    }

    public void setHotel_id(String hotel_id) {
        this.Hotel_id = hotel_id;
    }

    public String getTotal_cost() {
        return Total_cost;
    }

    public void setTotal_cost(String total_cost) {
        this.Total_cost = total_cost;
    }

}
