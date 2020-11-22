package editBooking.connectDB;
import booking.booking_model.Booking;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;


public class EditBookingDB {

    public boolean validate(Booking book) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false&allowPublicKeyRetrieval=true", "root", "Zhanmsoul123.")) {
            //
            //just insert your username in MySQLWorkbench instead of root
            //insert your password in MySQLWorkbench instead of 741852963Hesoyam
            //
            try(PreparedStatement preparedStatement = connection
                    .prepareStatement("select * from Booking where Check_in = ? and Check_out = ? and Room_id = ?;")){

                preparedStatement.setString(1, book.getCheck_in());
                preparedStatement.setString(2, book.getCheck_out());
                preparedStatement.setString(3, book.getRoom_id());

                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();

                status = rs.next();
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return status;
    }


    public boolean save(Booking book, String booking_id) throws ClassNotFoundException{
        boolean result = false;
        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false", "root", "741852963Hesoyam")) {
            //
            //just insert your username in MySQLWorkbench instead of root
            //insert your password in MySQLWorkbench instead of 741852963Hesoyam
            //
            String price;
            try(PreparedStatement preparedStatement = connection
                    .prepareStatement("select * from Room where Room_id = ? ;")){

                preparedStatement.setString(1, book.getRoom_id());

                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();
                rs.next();
                price = rs.getString("Price");
//                booking_id = rs.getString("Booking_id");
                System.out.println("Price for room is " + price);

            }

            int room_price = Integer.parseInt(price);
            int num_days = Integer.parseInt(book.getCheck_out());
            num_days = num_days - Integer.parseInt(book.getCheck_in());
            room_price = room_price * num_days;
            System.out.println("Total booking price is " + room_price);

            try(PreparedStatement preparedStatement = connection
                    .prepareStatement("update Booking set Total_cost = ?, Check_in = ?, Check_out = ? where Booking_id = ? ;")){

                preparedStatement.setString(1, Integer.toString(room_price));
                preparedStatement.setString(2, book.getCheck_in());
                preparedStatement.setString(3, book.getCheck_out());
                preparedStatement.setString(4, booking_id);

                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();

                result = rs.next();
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return result;
    }

    public boolean create(Booking book, String id) throws ClassNotFoundException {
        boolean status = false;
        String hotel_id;
        String price;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false&allowPublicKeyRetrieval=true", "root", "741852963Hesoyam")) {
            //
            //just insert your username in MySQLWorkbench instead of root
            //insert your password in MySQLWorkbench instead of 741852963Hesoyam
            //

            // Get Hotel id
            PreparedStatement preparedStatement = connection
                    .prepareStatement("select * from Employee where EmployeeID = ? ;");

                preparedStatement.setString(1, id);

                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();
                rs.next();
                hotel_id = rs.getString("Hotel_id");
                System.out.println("Hotel id is: " + hotel_id);



            // Get the room price
            PreparedStatement preparedStatement1 = connection
                    .prepareStatement("select * from Room where Room_id = ? ;");

                preparedStatement1.setString(1, book.getRoom_id());

                System.out.println(preparedStatement1);
                ResultSet rs1 = preparedStatement1.executeQuery();
                status = rs1.next();
                price = rs1.getString("Price");
                System.out.println("Price for room is " + price);



            //insert into booking
            PreparedStatement preparedStatement2 = connection
                    .prepareStatement("INSERT INTO Booking " +
                            "VALUES (?,?,?,?,?,?,?,?); ");

                Random rnd = new Random();
                String booking_id = hotel_id + book.getRoom_id().charAt(1) + Integer.toString(rnd.nextInt(5) + 5);
                System.out.println("Booking id is: " + booking_id);
                String check_in = null, check_out = null;
                int slash_in = book.getCheck_in().indexOf("/");
                int slash_out = book.getCheck_out().indexOf("/");
                if (slash_in != -1){
                    check_in = book.getCheck_in().substring(0, slash_in);
                }
                if (slash_out != -1){
                    check_out = book.getCheck_out().substring(0, slash_out);
                }
                slash_in = Integer.parseInt(check_in);
                slash_out = Integer.parseInt(check_out);
                System.out.println("check in day: " + slash_in + " check out day: " +slash_out );

                int total_cost = (slash_out - slash_out) * Integer.parseInt(price);
                System.out.println("Total price for booking is " + total_cost);

                preparedStatement2.setString(1, booking_id);
                preparedStatement2.setString(2, book.getUser_email());
                preparedStatement2.setString(3, book.getCheck_in());
                preparedStatement2.setString(4, book.getCheck_out());
                preparedStatement2.setString(5, "0");
                preparedStatement2.setString(6, book.getRoom_id());
                preparedStatement2.setString(7, hotel_id);
                preparedStatement2.setString(8, Integer.toString(total_cost));

                System.out.println(preparedStatement2);
                int rs2 = preparedStatement2.executeUpdate();
                System.out.println("execute update is " + rs2);


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return status;
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

