package booking.connectDB;

import registration.user_model.User;

import java.sql.*;

public class bookingDB {
    public boolean validate(User login) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false", "root", "Qwerty1!");
             //
             //just insert your username in MySQLWorkbench instead of root
             //insert your password in MySQLWorkbench instead of 741852963Hesoyam
             //
             PreparedStatement preparedStatement = connection
                     .prepareStatement("select * from User where email = ? and password = ? ")) {
            String userEmail = login.getEmail();
            preparedStatement.setString(1, userEmail);
            preparedStatement.setString(2, login.getPassword());


            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();

        } catch (SQLException e) {

            printSQLException(e);
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
