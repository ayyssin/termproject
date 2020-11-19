package search.control;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import search.connectDB.searchDB;
import search.hotel_model.searchHotel;
import search.hotel_model.searchRoom;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/search")

public class searchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private searchDB search;

    public void init() {
        search = new searchDB();
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String city = request.getParameter("City");
        String guests = request.getParameter("guests");
        /*
        SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy");
        Date date_in = null;
        Date date_out = null;
        try {
            date_in = format.parse(request.getParameter("date_in"));
            date_out = format.parse(request.getParameter("date_out"));
        } catch (ParseException e) {
            e.printStackTrace();
        }

         */


        searchHotel hotel = new searchHotel();
        hotel.setCity(city);
        hotel.setGuests(guests);
        /*
        hotel.setDate_in(date_in);
        hotel.setDate_out(date_out);

         */
        //hotel.setPrice();

        System.out.println(guests);


        try {
            if (search.validate(hotel)) {
                //searchRoom room = new searchRoom();
                ArrayList<searchRoom> roomList = new ArrayList<>();
                roomList = searchDB.getAllCustomer();
//                for(searchRoom room : roomList){
//                    System.out.println(room.getRoom_id());
//                }

                String url = "/search.jsp";
                request.setAttribute("roomlist", roomList);
                HttpSession session=request.getSession(false);
                String userLogin=(String)session.getAttribute("userLogin");
                System.out.println("email: "+userLogin);

                session.setAttribute("listRoom", roomList);
                response.setContentType("text/html;charset=UTF-8");
                RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                dispatcher.forward(request, response);

                //HttpSession session = request.getSession();
            } else {

                response.sendRedirect("index.jsp");
                HttpSession session = request.getSession();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
