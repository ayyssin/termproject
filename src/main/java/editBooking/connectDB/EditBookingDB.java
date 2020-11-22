package editBooking.connectDB;
import booking.booking_model.Booking;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


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
                    .prepareStatement("select * from Booking where Check-in = ? and Check-out = ? and Room_id = ? and occupied = '0';")){

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
    public boolean save(Booking book) throws ClassNotFoundException{
        boolean result = false;
        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false", "root", "741852963Hesoyam")) {
            //
            //just insert your username in MySQLWorkbench instead of root
            //insert your password in MySQLWorkbench instead of 741852963Hesoyam
            //
            String price;
            String booking_id;
            try(PreparedStatement preparedStatement = connection
                    .prepareStatement("select * from Room where Room_id = ? ;")){

                preparedStatement.setString(1, book.getRoom_id());

                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();
                price = rs.getString("Price");
                booking_id = rs.getString("Booking_id");
                System.out.println("Price for room is " + price);

                result = rs.next();
            }

            int room_price = Integer.parseInt(price);
            int num_days = Integer.parseInt(book.getCheck_out());
            num_days = num_days - Integer.parseInt(book.getCheck_in());
            room_price = room_price * num_days;
            System.out.println(room_price);

            try(PreparedStatement preparedStatement = connection
                    .prepareStatement("update Room set Total_cost = ?, Check-in = ?, Check-out = ? where Booking_id = ? ;")){

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

