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
        //hotel.setCity(city);
        //hotel.setGuests(guests);

        System.out.println(guests);


        try {
            if (search.validate(city)) {
                ArrayList<searchRoom> roomList = new ArrayList<>();
                roomList = searchDB.getAllCustomer();
                String[][] allRoom = new String[5][4];
                int emptyS = 0, emptyD=0, emptyT=0, emptyQ=0, emptyP = 0;
                for(searchRoom room: roomList){
                    if(room.getRoom_type().equals("single") && room.getOccupied().equals("0")){
                        emptyS++;
                        allRoom[0][0] = "single";
                        allRoom[0][1] = String.valueOf(emptyS);
                        allRoom[0][2] = room.getPrice();
                        allRoom[0][3] = room.getBeds();
                    }
                    else if(room.getRoom_type().equals("double") && room.getOccupied().equals("0")){
                        emptyD++;
                        allRoom[1][0] = "double";
                        allRoom[1][1] = String.valueOf(emptyD);
                        allRoom[1][2] = room.getPrice();
                        allRoom[1][3] = room.getBeds();
                    }
                    else if(room.getRoom_type().equals("triple") && room.getOccupied().equals("0")){
                        emptyT++;
                        allRoom[2][0] = "triple";
                        allRoom[2][1] = String.valueOf(emptyT);
                        allRoom[2][2] = room.getPrice();
                        allRoom[2][3] = room.getBeds();
                    }
                    else if(room.getRoom_type().equals("quad") && room.getOccupied().equals("0")){
                        emptyQ++;
                        allRoom[3][0] = "quad";
                        allRoom[3][1] = String.valueOf(emptyQ);
                        allRoom[3][2] = room.getPrice();
                        allRoom[3][3] = room.getBeds();
                    }
                    else if(room.getRoom_type().equals("president") && room.getOccupied().equals("0")){
                        emptyP++;
                        allRoom[4][0] = "president";
                        allRoom[4][1] = String.valueOf(emptyP);
                        allRoom[4][2] = room.getPrice();
                        allRoom[4][3] = room.getBeds();
                    }
                }

                String url = "/search.jsp";
                request.setAttribute("allRoom", allRoom);
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
