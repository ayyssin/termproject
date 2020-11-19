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
    private String Guest_email;

    public String getBooking_id() {
        return Booking_id;
    }

    public void setBooking_id(String booking_id) {
        Booking_id = booking_id;
    }

    public String getUser_email() {
        return User_email;
    }

    public void setUser_email(String user_email) {
        User_email = user_email;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String city) {
        City = city;
    }

    public String getCheck_in() {
        return Check_in;
    }

    public void setCheck_in(String check_in) {
        Check_in = check_in;
    }

    public String getCheck_out() {
        return Check_out;
    }

    public void setCheck_out(String check_out) {
        Check_out = check_out;
    }

    public String getGuests() {
        return Guests;
    }

    public void setGuests(String guests) {
        Guests = guests;
    }

    public String getFinished() {
        return Finished;
    }

    public void setFinished(String finished) {
        Finished = finished;
    }

    public String getRoom_id() {
        return Room_id;
    }

    public void setRoom_id(String room_id) {
        Room_id = room_id;
    }

    public String getHotel_id() {
        return Hotel_id;
    }

    public void setHotel_id(String hotel_id) {
        Hotel_id = hotel_id;
    }

    public String getTotal_cost() {
        return Total_cost;
    }

    public void setTotal_cost(String total_cost) {
        Total_cost = total_cost;
    }

    public String getGuest_email() {
        return Guest_email;
    }

    public void setGuest_email(String guest_email) {
        Guest_email = guest_email;
    }
}
