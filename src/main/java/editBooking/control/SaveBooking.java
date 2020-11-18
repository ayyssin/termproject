package editBooking.control;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import booking.booking_model.Booking;
import editBooking.connectDB.EditBookingDB;

import java.io.IOException;

@WebServlet("/saveBooking")
public class SaveBooking extends HttpServlet{
    private static final long serialVersionUID = 1L;
    private EditBookingDB editBook;

    public void init() { editBook = new EditBookingDB(); }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String check_in = request.getParameter("check-in-date");
        String check_out = request.getParameter("check-out-date");
        String room_id = request.getParameter("room_id");
        Booking book = new Booking();
        book.setCheck_in(check_in);
        book.setCheck_out(check_out);
        book.setRoom_id(room_id);

        try {
            if (editBook.save(book)) {
                response.sendRedirect("desk_clerk.jsp");
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
