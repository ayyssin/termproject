package editBooking.control;

import booking.booking_model.Booking;
import editBooking.connectDB.CheckGuestDB;
import editBooking.connectDB.EditBookingDB;
import registration.user_model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/checkRooms")
public class CheckBooking extends HttpServlet  {
    private static final long serialVersionUID = 1L;
    private EditBookingDB editBook;
    private CheckGuestDB GuestCheck;

    public void init() { editBook = new EditBookingDB();
                         GuestCheck = new CheckGuestDB(); }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("check") != null) {
            String check_in = request.getParameter("check-in-date");
            String check_out = request.getParameter("check-out-date");
            String room_id = request.getParameter("room-id");
            Booking book = new Booking();
            book.setCheck_in(check_in);
            book.setCheck_out(check_out);
            book.setRoom_id(room_id);

            String url = request.getParameter("url");

            try {
                if (editBook.validate(book)) {
                    System.out.println("booking is found");
                    response.sendRedirect(url);
                } else {
                    System.out.println("booking is not found");
                    response.sendRedirect(url);
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

        } else if (request.getParameter("save") != null) {

            String check_in = request.getParameter("check-in-date");
            String check_out = request.getParameter("check-out-date");
            String room_id = request.getParameter("room-id");
            Booking book = new Booking();
            book.setCheck_in(check_in);
            book.setCheck_out(check_out);
            book.setRoom_id(room_id);

            String booking_id = request.getParameter("info");
            String url = request.getParameter("url");

            try {
                if (editBook.save(book, booking_id )) {
                    System.out.println("booking is saved");
                    response.sendRedirect("desk_clerk.jsp");
                } else {
                    System.out.println("booking is not saved");
                    response.sendRedirect(url);
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        } else if (request.getParameter("guest") != null) {

            String email = request.getParameter("email");
            String first_name = request.getParameter("fName");
            String last_name = request.getParameter("lName");
            User guest = new User();
            guest.setEmail(email);
            guest.setFirst_name(first_name);
            guest.setLast_name(last_name);

            String url = request.getParameter("url");

            try {
                if (GuestCheck.validate(guest)) {
                    System.out.println("guest is found");
                    response.sendRedirect(url);

                } else {
                    System.out.println("guest is not found");
                    response.sendRedirect(url);
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

        } else if (request.getParameter("create") != null) {

            String EmployeeID = request.getParameter("info");
            System.out.println(EmployeeID);
            String email = request.getParameter("email");
            String check_in_date = request.getParameter("check-in-date");
            String check_out_date = request.getParameter("check-out-date");
            String room_id = request.getParameter("room-id");

            Booking book = new Booking();
            book.setUser_email(email);
            book.setCheck_in(check_in_date);
            book.setCheck_out(check_out_date);
            book.setRoom_id(room_id);

            String url = request.getParameter("url");

            try {
                if (editBook.create(book, EmployeeID)) {
                    System.out.println("booking is created");
                    response.sendRedirect("desk_clerk.jsp");

                } else {
                    System.out.println("booking is not created");
                    response.sendRedirect(url);
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        }
}
