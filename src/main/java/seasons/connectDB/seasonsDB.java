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
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false&allowPublicKeyRetrieval=true", "root", "Zhanmsoul123.")) {
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

    public boolean save(String[] discounts, String hotelID) throws ClassNotFoundException {
        boolean status = false;
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("hotel id: " + hotelID);

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false&allowPublicKeyRetrieval=true", "root", "741852963Hesoyam")) {

            PreparedStatement preparedStatement = connection
                    .prepareStatement("update seasonal_rate set discount = ? where Hotel_id = ? and season_name = 'Autumn' ;");
            preparedStatement.setString(1, discounts[0]);
            preparedStatement.setString(2, hotelID);
            System.out.println(preparedStatement);
            int rs = preparedStatement.executeUpdate();

            PreparedStatement preparedStatement1 = connection
                    .prepareStatement("update seasonal_rate set discount = ? where Hotel_id = ? and season_name = 'Spring' ;");
            preparedStatement1.setString(1, discounts[1]);
            preparedStatement1.setString(2, hotelID);
            System.out.println(preparedStatement1);
            int rs1 = preparedStatement1.executeUpdate();

            PreparedStatement preparedStatement2 = connection
                    .prepareStatement("update seasonal_rate set discount = ? where Hotel_id = ? and season_name = 'Summer' ;");
            preparedStatement2.setString(1, discounts[2]);
            preparedStatement2.setString(2, hotelID);
            System.out.println(preparedStatement2);
            int rs2 = preparedStatement2.executeUpdate();

            PreparedStatement preparedStatement3 = connection
                    .prepareStatement("update seasonal_rate set discount = ? where Hotel_id = ? and season_name = 'Summer' ;");
            preparedStatement3.setString(1, discounts[3]);
            preparedStatement3.setString(2, hotelID);
            System.out.println(preparedStatement3);
            int rs3 = preparedStatement3.executeUpdate();

            if(rs3 != 0) {
                status = true;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            status = false;
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
