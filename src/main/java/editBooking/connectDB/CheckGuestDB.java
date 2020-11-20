package editBooking.connectDB;

import registration.user_model.User;

import java.sql.*;

public class CheckGuestDB {
    public boolean validate(User guest) throws ClassNotFoundException{
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false&allowPublicKeyRetrieval=true", "root", "icexo123456")) {
            //
            //just insert your username in MySQLWorkbench instead of root
            //insert your password in MySQLWorkbench instead of 741852963Hesoyam
            //
            try(PreparedStatement preparedStatement = connection
                    .prepareStatement("select * from User where email = ? and first_name = ? and last_name = ?")){

                preparedStatement.setString(1, guest.getEmail());
                preparedStatement.setString(2, guest.getFirst_name());
                preparedStatement.setString(3, guest.getLast_name());

                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();
                status = rs.next();

                if(rs.next()){
                    return status;
                }
                else{
                    try(PreparedStatement Statement = connection.prepareStatement("INSERT INTO User" +
                            "      (email, first_name, last_name, password, date_of_birth) VALUES" + " (?, ?, ?, ?, ?) ")){
                        preparedStatement.setString(1, guest.getEmail());
                        preparedStatement.setString(2, guest.getFirst_name());
                        preparedStatement.setString(3, guest.getLast_name());
                        preparedStatement.setString(4, "root");
                        preparedStatement.setString(5, "NULL");

                        System.out.println(preparedStatement);
                        ResultSet resSet = preparedStatement.executeQuery();

                        status = resSet.next();
                    } catch (SQLException e) {
                        printSQLException(e);
                    }
                }

            }

            return status;

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
