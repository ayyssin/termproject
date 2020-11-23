package loginClerk.connectDB;

import java.sql.*;
import java.util.ArrayList;
import booking.booking_model.Booking;

import loginClerk.clerk_model.Clerk;

public class ClerkLoginDB {

    public static boolean validate(Clerk login) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false&allowPublicKeyRetrieval=true", "root", "Zhanmsoul123.")) {
            //
            //just insert your username in MySQLWorkbench instead of root
            //insert your password in MySQLWorkbench instead of 741852963Hesoyam
            //
            try(PreparedStatement preparedStatement = connection
                    .prepareStatement("select * from Employee where firstname = ? and EmployeeID = ?")){
                String clerkName = login.getFirstname();
                preparedStatement.setString(1, clerkName);
                preparedStatement.setString(2, login.getEmployeeID());
                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();

                status = rs.next();
                connection.close();

            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
            status=false;
        }

        return status;
    }

    public static ArrayList<Booking> getBookings(Clerk clerk) throws ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        ArrayList<Booking> bookingList = new ArrayList<>();

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false&allowPublicKeyRetrieval=true", "root", "741852963Hesoyam")) {
            //
            //just insert your username in MySQLWorkbench instead of root
            //insert your password in MySQLWorkbench instead of 741852963Hesoyam
            //

            PreparedStatement preparedStatement = connection
                    .prepareStatement("select * from Employee where EmployeeID = ?");
            preparedStatement.setString(1, clerk.getEmployeeID());
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            rs.next();
            String hotel_id = rs.getString("Hotel_id");
            System.out.println("Hotel id is: " + hotel_id);

            PreparedStatement preparedStatement1 = connection
                    .prepareStatement("select * from Booking where Hotel_id = ?");
            preparedStatement1.setString(1, hotel_id);
            System.out.println(preparedStatement1);
            ResultSet rs1 = preparedStatement1.executeQuery();
            while(rs1.next()){
                Booking book = new Booking();
                System.out.println(rs1);
                System.out.println("br");
                book.setBooking_id(rs1.getString("Booking_id"));
                book.setUser_email(rs1.getString("User_email"));
                book.setCheck_in(rs1.getString("Check_in"));
                book.setCheck_out(rs1.getString("Check_out"));
                book.setFinished(rs1.getString("Finished"));
                book.setRoom_id(rs1.getString("Room_id"));
                book.setHotel_id(hotel_id);
                book.setTotal_cost(rs1.getString("Total_cost"));
                System.out.println("User email: " + book.getUser_email() + " Book id " + book.getBooking_id());

                bookingList.add(book);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return bookingList;
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

