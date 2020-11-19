package editBooking.control;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import booking.booking_model.Booking;
import editBooking.connectDB.EditBookingDB;
import registration.user_model.User;
import editBooking.connectDB.CheckGuestDB;

import java.io.IOException;

public class CheckGuest extends HttpServlet  {
    private static final long serialVersionUID = 1L;
    private CheckGuestDB GuestCheck;

    public void init() { GuestCheck = new CheckGuestDB(); }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String first_name = request.getParameter("firstname");
        String last_name = request.getParameter("lastname");
        User guest = new User();
        guest.setEmail(email);
        guest.setFirst_name(first_name);
        guest.setLast_name(last_name);

        try {
            if (GuestCheck.validate(guest)) {

            } else {

            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
