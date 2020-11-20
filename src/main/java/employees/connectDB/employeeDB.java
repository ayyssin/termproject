package employees.connectDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import employees.employee_model.employee;
import loginManager.manager_model.Manager;
import search.hotel_model.searchRoom;

import javax.servlet.http.HttpSession;

public class employeeDB {
    private static ArrayList<employee> employeelist = new ArrayList<employee>();

    public boolean validate(String managerID) throws ClassNotFoundException {
        boolean status = false;


        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
<<<<<<< HEAD
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false", "root", "intComm75")) {
=======
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false&allowPublicKeyRetrieval=true", "root", "icexo123456")) {
>>>>>>> main
            //
            //just insert your username in MySQLWorkbench instead of root
            //insert your password in MySQLWorkbench instead of 741852963Hesoyam
            //
            try(PreparedStatement preparedStatement = connection
                    .prepareStatement("select * from Employee where ManagerID = ?")){
                preparedStatement.setString(1, managerID);
                System.out.println(preparedStatement);

                ResultSet rs = preparedStatement.executeQuery();
                while(rs.next()){
                    employee Employee = new employee();
                    String ID = rs.getString("EmployeeID");
                    boolean exist = employeelist.stream().anyMatch(o -> o.getEmployeeID().equals(ID));
                    if(!exist){
                        Employee.setEmployeeID(ID);
                        Employee.setFirstname(rs.getString("firstname"));
                        Employee.setLastname(rs.getString("lastname"));
                        Employee.setHotel_id(rs.getString("Hotel_id"));
                        Employee.setPosition(rs.getString("position"));
                        Employee.setPayroll(rs.getString("payroll"));
                        Employee.setSalary(rs.getString("salary"));
                        Employee.setWorking_days(rs.getString("working_days"));
                        Employee.setWorking_hour(rs.getString("working_hours"));
                        employeelist.add(Employee);
                    }
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

    public static ArrayList<employee> getAllEmployees(){

        return employeelist;
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
