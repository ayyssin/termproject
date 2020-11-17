
package loginManager.control;
import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.connectDB.UserLoginDB;
import loginManager.connectDB.ManagerLoginDB;
import loginManager.manager_model.Manager;

@WebServlet("/managerLogin")
public class ManagerLoginServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;
    private ManagerLoginDB login;

    public void init() {
        login = new ManagerLoginDB();
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Manager loginB = new Manager();
        loginB.setEmail(email);
        loginB.setPassword(password);

        try {
            if (login.validate(loginB)) {
                String managerEmail = loginB.getEmail();
                String managerName = loginB.getFirstname();
                System.out.println("Manager:"+ managerName);

                //HttpSession session = request.getSession();
                //String username = (String)request.getAttribute("email");
                //session.setAttribute("managerLogin", email);
                response.sendRedirect("manager-profile.jsp");
            } else {
                response.sendRedirect("login-manager.jsp");
                HttpSession session = request.getSession();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
