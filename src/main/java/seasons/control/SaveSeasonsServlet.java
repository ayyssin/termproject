package seasons.control;

import seasons.connectDB.seasonsDB;
import seasons.season_model.season;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/saveSeasons")
public class SaveSeasonsServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;
    private seasonsDB season;

    public void init() {
        season = new seasonsDB();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        String hotelID=(String)session.getAttribute("Hotel_id");

        System.out.println("hotel id in servlet is: " + hotelID);


        String autumn_rate = request.getParameter("input-Autumn-rate");
        String spring_rate = request.getParameter("input-Spring-rate");
        String summer_rate = request.getParameter("input-Summer-rate");
        String winter_rate = request.getParameter("input-Winter-rate");

        System.out.println(autumn_rate + spring_rate + summer_rate + winter_rate);

        String[] Discounts = new String[]{autumn_rate, spring_rate, summer_rate, winter_rate};

        try {
            if(season.save(Discounts, hotelID)){
                System.out.println("seasons changed");
                String url = "manager-profile.jsp";
                response.sendRedirect(url);
            }
            else{
                System.out.println("seasons not changed");
                String url = "manager-profile.jsp";
                response.sendRedirect(url);
            }
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

}
