package seasons.connectDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import seasons.season_model.season;

public class seasonsDB {
    private static ArrayList<season> seasonlist = new ArrayList<season>();

    public boolean validate(String hotelID) throws ClassNotFoundException {
        boolean status = false;
        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false&allowPublicKeyRetrieval=true", "root", "741852963Hesoyam")) {
            try(PreparedStatement preparedStatement = connection
                    .prepareStatement("select * from seasonal_rate where Hotel_id = ?")){
                preparedStatement.setString(1, hotelID);
                System.out.println(preparedStatement);

                ResultSet rs = preparedStatement.executeQuery();
                while(rs.next()){
                    season new_season = new season();
                    String name = rs.getString("season_name");
                    boolean exist = seasonlist.stream().anyMatch(o -> o.getSeason_name().equals(name));
                    if(!exist){
                        new_season.setSeason_name(name);
                        new_season.setDiscount(rs.getString("discount"));
                        new_season.setWeekend_rate(rs.getString("weekend_rate"));
                        seasonlist.add(new_season);
                    }
                    status = true;
                }
                connection.close();

            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
            status = false;
        }
        return status;

    }
    public static ArrayList<season> getAllSeasons(){

        return seasonlist;
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
