package editBooking.connectDB;
import booking.booking_model.Booking;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
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

            LocalDate check_in = LocalDate.parse(book.getCheck_in());
            LocalDate check_out = LocalDate.parse(book.getCheck_out());
            System.out.println("check in day: " + check_in + " check out day: " + check_out);

            int num_of_days = (int) ChronoUnit.DAYS.between(check_in, check_out);
            int total_cost = Integer.parseInt(price) * num_of_days;
            System.out.println("Total price for booking is " + total_cost);

            try(PreparedStatement preparedStatement = connection
                    .prepareStatement("update Booking set Total_cost = ?, Check_in = ?, Check_out = ? where Booking_id = ? ;")){

                preparedStatement.setString(1, Integer.toString(total_cost));
                preparedStatement.setString(2, book.getCheck_in());
                preparedStatement.setString(3, book.getCheck_out());
                preparedStatement.setString(4, booking_id);

                System.out.println(preparedStatement);
                int rs = preparedStatement.executeUpdate();

                if( rs != 0){
                    result = true;
                }
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
                LocalDate check_in = LocalDate.parse(book.getCheck_in());
                LocalDate check_out = LocalDate.parse(book.getCheck_out());
                System.out.println("check in day: " + check_in + " check out day: " + check_out);

                int num_of_days = (int) ChronoUnit.DAYS.between(check_in, check_out);
                int total_cost = Integer.parseInt(price) * num_of_days;
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

