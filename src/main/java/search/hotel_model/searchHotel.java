package search.hotel_model;

import java.util.Date;

public class searchHotel {
    private String city;
    private String guests;
    private String hotel_id;
    public String price;
    public String beds;
    public String room_id;
    public Date date_in;
    public Date date_out;


    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }
    public String getGuests(){ return guests;}
    public void setGuests(String guests){this.guests=guests;}
    public String getHotel_id(){return hotel_id;}
    public void setHotel_id(String hotel_id){this.hotel_id=hotel_id;}
    /*
    public String getPrice(){return price;}
    public void setPrice(String price){this.price=price;}
    public String getBeds(){return beds;}
    public void setBeds(String beds){this.beds=beds;}
    public String getRoom_id(){return room_id;}
    public void setRoom_id(String room_id){this.room_id=room_id;}

     */
    public Date getDate_in(){return date_in;}
    public void setDate_in(Date date_in){this.date_in=date_in;}
    public Date getDate_out(){return date_out;}
    public void setDate_out(Date date_out){this.date_out=date_out;}




}
