package loginClerk.control;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import loginClerk.clerk_model.Clerk;
import loginClerk.connectDB.ClerkLoginDB;
import seasons.season_model.season;
import booking.booking_model.Booking;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/clerkLogin")
public class ClerkLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ClerkLoginDB login;

    public void init() {
        login = new ClerkLoginDB();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String first_name = request.getParameter("firstname");
        String employee_id = request.getParameter("employee_id");
        Clerk loginB = new Clerk();
        loginB.setFirstname(first_name);
        loginB.setEmployeeID(employee_id);
        HttpSession session = request.getSession();

        try {
            if (ClerkLoginDB.validate(loginB)) {
                ArrayList<Booking> bookingList;
                bookingList = ClerkLoginDB.getBookings(loginB);

                for(Booking i: bookingList){
                    System.out.println("Email: " + i.getUser_email());
                }

                session.setAttribute("userLogin", employee_id);

                String url = "/desk_clerk.jsp";
                request.setAttribute("bookingList", bookingList);
                response.setContentType("text/html;charset=UTF-8");
                RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                dispatcher.forward(request, response);
                System.out.println("desk clerk is validated");
            } else {
                response.sendRedirect("login-desk-clerk.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
