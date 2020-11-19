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

import java.io.IOException;

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
                String userName = loginB.getFirstname();

                //HttpSession session = request.getSession();
                //String username = (String)request.getAttribute("email");
                session.setAttribute("userLogin", userName);
                System.out.println(session.getAttribute("userLogin"));
                response.sendRedirect("desk_clerk.jsp");
            } else {
                response.sendRedirect("login-desk-clerk.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
