package booking.connectDB;

import booking.booking_model.Booking;

import java.sql.*;
import java.util.Random;

public class ConfirmBookingDB {

    public boolean confirm(Booking book) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false&allowPublicKeyRetrieval=true", "root", "741852963Hesoyam")) {
            //
            //just insert your username in MySQLWorkbench instead of root
            //insert your password in MySQLWorkbench instead of 741852963Hesoyam
            //
            PreparedStatement preparedStatement = connection
                    .prepareStatement("select * from Hotel where City = ?");

            preparedStatement.setString(1, book.getCity());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            rs.next();
            String hotel_id = rs.getString("Hotel_id");
            System.out.println("Hotel id: " + hotel_id);

            PreparedStatement preparedStatement1 = connection
                    .prepareStatement("select * from Room where Capacity = ? and Hotel_id = ? and occupied = 0");

            preparedStatement1.setString(1, book.getGuests());
            preparedStatement1.setString(2, hotel_id);

            System.out.println(preparedStatement);
            ResultSet rs1 = preparedStatement1.executeQuery();
            rs1.next();
            String room_id = rs1.getString("Room_id");
            System.out.println("Room id: " + room_id);

            PreparedStatement preparedStatement2 = connection
                    .prepareStatement("INSERT INTO Booking " + "VALUES (?,?,?,?,?,?,?,?); ");

            Random rnd = new Random();
            preparedStatement2.setString(1, hotel_id + book.getGuests() + Integer.toString(rnd.nextInt(5) + 5));
            preparedStatement2.setString(2, book.getUser_email());
            preparedStatement2.setString(3, book.getCheck_in());
            preparedStatement2.setString(4, book.getCheck_out());
            preparedStatement2.setString(5, "0");
            preparedStatement2.setString(6, room_id);
            preparedStatement2.setString(7, hotel_id);
            preparedStatement2.setString(8, book.getTotal_cost());

            System.out.println(preparedStatement2);
            int res = preparedStatement2.executeUpdate();
            System.out.println("execute update is: " + res);

            if (res != 0){
                status = true;
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return status;
    }

}
