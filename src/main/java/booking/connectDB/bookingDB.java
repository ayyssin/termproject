package booking.connectDB;

//import search.hotel_model.searchHotel;
import booking.booking_model.Booking;
import search.hotel_model.searchRoom;


import java.sql.*;
import java.util.ArrayList;

public class bookingDB {
    private static ArrayList<Booking> bookinglist = new ArrayList<Booking>();
    public boolean validate(String login) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false&allowPublicKeyRetrieval=true", "root", "741852963Hesoyam")){
             //
             //just insert your username in MySQLWorkbench instead of root
             //insert your password in MySQLWorkbench instead of 741852963Hesoyam
             //
             //Booking booking = new Booking();
             //booking.setUser_email(login);
            try (PreparedStatement preparedStatement = connection
                    .prepareStatement("select * from Booking where User_email = ?")){
                preparedStatement.setString(1, login);

                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();
                while(rs.next()){
                    Booking booking = new Booking();
                    String room_id = rs.getString("Room_id");
                    boolean exist = bookinglist.stream().anyMatch(o -> o.getRoom_id().equals(room_id));
                    if(!exist){
                        booking.setUser_email(login);
                        booking.setBooking_id(rs.getString("Booking_id"));
                        booking.setCheck_in(rs.getString("Check_in"));
                        booking.setCheck_out(rs.getString("Check_out"));
                        booking.setRoom_id(room_id);
                        booking.setFinished(rs.getString("Finished"));
                        booking.setTotal_cost(rs.getString("Total_cost"));
                        int hotel_id = rs.getInt("Hotel_id");
                        booking.setCity(city(hotel_id));
                        booking.setRoom_type(room_type(room_id));
                        booking.setGuests(capacity(room_id));
                        bookinglist.add(booking);
                    }
                    status = true;
                }
            }
             }
             catch (SQLException throwables) {
                throwables.printStackTrace();
        }
        return status;
    }
    public String city(int hotel_id) throws ClassNotFoundException {
        boolean status = false;
        String city = null;
        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false&allowPublicKeyRetrieval=true", "root", "741852963Hesoyam")){
            try (PreparedStatement preparedStatement = connection
                    .prepareStatement("select City from Hotel where Hotel_id = ?")){
                preparedStatement.setInt(1, hotel_id);
                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next())
                {
                    city = rs.getString("City");
                }
                status = rs.next();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return city;
    }

    public String room_type(String room_id) throws ClassNotFoundException {
        boolean status = false;
        String room_type = null;
        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false&allowPublicKeyRetrieval=true", "root", "741852963Hesoyam")){
            try (PreparedStatement preparedStatement = connection
                    .prepareStatement("select Room_type from Room where Room_id = ?")){
                preparedStatement.setString(1, room_id);
                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next())
                {
                    room_type = rs.getString("Room_type");
                }
                status = rs.next();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return room_type;
    }
    public String capacity(String room_id) throws ClassNotFoundException {
        boolean status = false;
        String capacity = null;
        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false&allowPublicKeyRetrieval=true", "root", "741852963Hesoyam")){
            try (PreparedStatement preparedStatement = connection
                    .prepareStatement("select Capacity from Room where Room_id = ?")){
                preparedStatement.setString(1, room_id);
                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next())
                {
                    capacity = rs.getString("Capacity");
                }
                status = rs.next();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return capacity;
    }
    public static ArrayList<Booking> getAllBookings(){

        return bookinglist;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
