package loginClerk.connectDB;

import java.sql.*;

import loginClerk.clerk_model.Clerk;

public class ClerkLoginDB {

    public static boolean validate(Clerk login) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false", "root", "intComm75")) {
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

