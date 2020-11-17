package booking.control;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/bookingServlet")
public class bookingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookedRooms = request.getParameter("nBooked");
        System.out.println("booked: "+bookedRooms);
        System.out.println("success");
        RequestDispatcher dispatcher = request.getRequestDispatcher("bookings.jsp");
        dispatcher.forward(request, response);
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
