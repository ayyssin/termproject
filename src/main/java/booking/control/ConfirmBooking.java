package booking.control;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import booking.booking_model.Booking;
import editBooking.connectDB.CheckGuestDB;
import editBooking.connectDB.EditBookingDB;
import registration.user_model.User;
import booking.connectDB.ConfirmBookingDB;

@WebServlet("/confirm")
public class ConfirmBooking extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ConfirmBookingDB book_confirm;

    public void init() { book_confirm = new ConfirmBookingDB(); }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Booking book = new Booking();
        book.setUser_email(request.getParameter("user_email"));
        book.setCheck_in(request.getParameter("check_in"));
        book.setCheck_out(request.getParameter("check_out"));
        book.setGuests(request.getParameter("guests"));
        book.setTotal_cost(request.getParameter("cost"));
        book.setCity(request.getParameter("city"));

        System.out.println(book.getUser_email() + book.getCheck_in() + " " + book.getCheck_out() + book.getGuests() + book.getCity());

        String url =request.getParameter("url");

        try {
            if (book_confirm.confirm(book)) {
                System.out.println("booking is confirmed & created ");
                response.sendRedirect("index2.jsp");

            } else {
                System.out.println("booking is not created");
                response.sendRedirect("index2.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
