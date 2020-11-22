package booking.control;

import booking.connectDB.bookingDB;
import booking.booking_model.Booking;
import search.connectDB.searchDB;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/bookingServlet")
public class bookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private bookingDB booking;
    public void init() {
        booking = new bookingDB();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookedRooms = request.getParameter("nBooked");
        System.out.println("booked: "+bookedRooms);
        System.out.println("success");

        HttpSession session=request.getSession(false);
        String userLogin=(String)session.getAttribute("userLogin");

        try{
            if(booking.validate(userLogin)){
                ArrayList<Booking> bookingList = new ArrayList<>();
                bookingList = bookingDB.getAllBookings();
                JSONArray arr = new JSONArray();
                JSONObject tmp;
                try {
                    for(int i = 0; i < bookingList.size(); i++) {
                        tmp = new JSONObject();
                        tmp.put("bookingID", bookingList.get(i).getBooking_id());
                        tmp.put("city", bookingList.get(i).getCity());
                        tmp.put("room_type", bookingList.get(i).getRoom_type());
                        tmp.put("room_id", bookingList.get(i).getRoom_id());
                        tmp.put("check_in", bookingList.get(i).getCheck_in());
                        tmp.put("check_out", bookingList.get(i).getCheck_out());
                        tmp.put("price", bookingList.get(i).getTotal_cost());
                        tmp.put("capacity", bookingList.get(i).getGuests());
                        arr.put(tmp);
                    }

                } catch(JSONException e){
                    //error handling
                }
                request.setAttribute("bookingList", bookingList);
                String s = arr.toString();
                //System.out.println(s);
                request.setAttribute("jsonBooking", s);
                session.setAttribute("jsonBooking", s);
                RequestDispatcher dispatcher = request.getRequestDispatcher("bookings.jsp");
                dispatcher.forward(request, response);
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookedRooms = request.getParameter("nBooked");
        System.out.println("booked: "+bookedRooms);
        System.out.println("success");

        RequestDispatcher dispatcher = request.getRequestDispatcher("bookings.jsp");
        dispatcher.forward(request, response);


    }
}
