package loginManager.connectDB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import loginManager.manager_model.Manager;

public class ManagerLoginDB {

    public boolean validate(Manager login) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false", "root", "intComm75")) {
            //
            //just insert your username in MySQLWorkbench instead of root
            //insert your password in MySQLWorkbench instead of 741852963Hesoyam
            //
            try(PreparedStatement preparedStatement = connection
                    .prepareStatement("select * from Manager where email = ? and password = ? ")){
                String userEmail = login.getEmail();
                preparedStatement.setString(1, userEmail);
                preparedStatement.setString(2, login.getPassword());
                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();

                while (rs.next()){
                    String firstName = rs.getString("firstname");
                    login.setFirstname(firstName);
                    login.setLastname(rs.getString("lastname"));
                    login.setHotel_id(rs.getString("Hotel_id"));
                    login.setManagerID(rs.getString("ManagerID"));
                    System.out.println(firstName);
                    status = true;
                }
                connection.close();

            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
            status=false;
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