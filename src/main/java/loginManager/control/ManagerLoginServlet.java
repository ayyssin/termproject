
package loginManager.control;
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
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Manager loginB = new Manager();
        loginB.setEmail(email);
        loginB.setPassword(password);
        HttpSession session = request.getSession();
        try {
            if (login.validate(loginB)) {
                String managerEmail = loginB.getEmail();
                String managerName = loginB.getFirstname();
                String managerSurname = loginB.getLastname();
                String managerID = loginB.getManagerID();
                String hotel = loginB.getHotel_id();
                System.out.println("Manager:"+ managerName);

                request.setAttribute("managerName", managerName);
                request.setAttribute("managerSurname", managerSurname);

                String url = "/manager-profile.jsp";

                session.setAttribute("managerLogin", email);
                session.setAttribute("managerID", managerID);
                session.setAttribute("Hotel_id", hotel);

                response.setContentType("text/html;charset=UTF-8");
                RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                dispatcher.forward(request, response);
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User or password incorrect');");
                out.println("location='login-manager.jsp';");
                out.println("</script>");

            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
