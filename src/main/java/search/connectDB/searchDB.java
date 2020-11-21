package search.connectDB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import search.hotel_model.searchHotel;
import search.hotel_model.searchRoom;

public class searchDB {
    private static ArrayList<searchRoom> roomlist = new ArrayList<searchRoom>();;
    //ArrayList<searchRoom> roomlist = new ArrayList<searchRoom>();

    public boolean validate(searchHotel hotel) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/swe_hotel?useSSL=false&allowPublicKeyRetrieval=true", "root", "icexo123456")){

            try (PreparedStatement preparedStatement = connection
                    .prepareStatement("select Hotel_id from Hotel where City = ?")){
                preparedStatement.setString(1, hotel.getCity());

                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next())
                {
                    String hotel_id = rs.getString("Hotel_id");
                    hotel.setHotel_id(hotel_id);
                }
                status = rs.next();
            }
            try (PreparedStatement preparedStatement = connection
                    .prepareStatement("select * from Room where Hotel_id = ?")){
                preparedStatement.setString(1, hotel.getHotel_id());
                System.out.println(preparedStatement);

                ResultSet rs = preparedStatement.executeQuery();

                int count = 0;
                while(rs.next()){
                    searchRoom room = new searchRoom();
                    String room_id = rs.getString("Room_id");
                    boolean exist = roomlist.stream().anyMatch(o -> o.getRoom_id().equals(room_id));
                    if(!exist){
                        room.setRoom_type(rs.getString("Room_type"));
                        room.setRoom_id(room_id);
                        room.setPrice(rs.getString("Price"));
                        room.setBeds(rs.getString("beds"));
                        room.setOccupied(rs.getString("occupied"));
                        roomlist.add(room);
                    }
                    status = true;
                }

                //status = rs.next();
                connection.close();
            }



        } catch (SQLException throwables) {
            status = false;
            throwables.printStackTrace();
        }
        return status;
    }

    public static ArrayList<searchRoom> getAllCustomer(){

        return roomlist;
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