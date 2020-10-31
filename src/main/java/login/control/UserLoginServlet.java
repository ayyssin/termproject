package login.control;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.connectDB.UserLoginDB;
import registration.user_model.User;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserLoginDB login;

    public void init() {
        login = new UserLoginDB();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User loginB = new User();
        loginB.setEmail(email);
        loginB.setPassword(password);

        try {
            if (login.validate(loginB)) {
                response.sendRedirect("index2.jsp");
            } else {
            	response.sendRedirect("login.jsp");
                HttpSession session = request.getSession();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}