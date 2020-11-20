package registration.control;

import registration.connectDB.UserDB;
import registration.user_model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/register")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserDB userDB = new UserDB();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/hotel_front/signup.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String password = request.getParameter("password");
		String date_of_birth = request.getParameter("date_of_birth");
		
		User user = new User();
		user.setEmail(email);
		user.setFirst_name(first_name);
		user.setLast_name(last_name);
		user.setPassword(password);
		user.setDate_of_birth(date_of_birth);

		HttpSession session = request.getSession();
		try {
			userDB.registerUser(user);
			session.setAttribute("userLogin", email);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("index2.jsp");
		dispatcher.forward(request, response);
	}

}
