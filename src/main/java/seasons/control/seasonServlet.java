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

@WebServlet("/seasonalRates")

public class seasonServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;
    private seasonsDB season;

    public void init() {
        season = new seasonsDB();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        String hotelID=(String)session.getAttribute("Hotel_id");

        try {
            if(season.validate(hotelID)){
                ArrayList<season> seasonsList = new ArrayList<>();
                seasonsList = seasonsDB.getAllSeasons();


                String url = "/seasons.jsp";
                request.setAttribute("seasonList", seasonsList);
                response.setContentType("text/html;charset=UTF-8");
                RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                dispatcher.forward(request, response);
            }

        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
