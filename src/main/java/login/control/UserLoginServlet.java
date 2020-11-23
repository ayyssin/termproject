package login.control;
import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.RequestDispatcher;
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
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User loginB = new User();
        loginB.setEmail(email);
        loginB.setPassword(password);
        HttpSession session = request.getSession();

        try {
            if (login.validate(loginB)) {
                String userEmail = loginB.getEmail();

                //HttpSession session = request.getSession();
                //String username = (String)request.getAttribute("email");
                session.setAttribute("userLogin", email);
                System.out.println(session.getAttribute("userLogin"));
                response.sendRedirect("index2.jsp");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User or password incorrect');");
                out.println("location='login.jsp';");
                out.println("</script>");
            	//response.sendRedirect("login.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}