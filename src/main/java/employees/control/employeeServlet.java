package employees.control;


import employees.connectDB.employeeDB;
import employees.employee_model.employee;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/employees")
public class employeeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private employeeDB emp;

    public void init() {
        emp = new employeeDB();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String text = "some text";

            response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
            response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
            response.getWriter().write(text);

        }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        String managerID=(String)session.getAttribute("managerID");
        System.out.println(managerID);
        employee Employee = new employee();

        try {
            if(emp.validate(managerID)){
                ArrayList<employee> employeeList = new ArrayList<>();
                employeeList = employeeDB.getAllEmployees();
/*
                for(employee em : employeeList){
                    System.out.println("id: "+em.getEmployeeID());
                }
*/

                JSONArray arr = new JSONArray();
                JSONObject tmp;
                try {
                    for(int i = 0; i < employeeList.size(); i++) {
                        tmp = new JSONObject();
                        tmp.put("id",employeeList.get(i).getEmployeeID());
                        tmp.put("name",employeeList.get(i).getFirstname()+" "+employeeList.get(i).getLastname());
                        tmp.put("position",employeeList.get(i).getPosition());
                        tmp.put("schedule", employeeList.get(i).getWorking_days());
                        tmp.put("hours", employeeList.get(i).getWorking_hour());
                        tmp.put("salary", employeeList.get(i).getSalary());
                        tmp.put("total_payroll", employeeList.get(i).getPayroll());
                        arr.put(tmp);
                    }

                } catch(JSONException e){
                    //error handling
                }
                String url = "/manager-employee.jsp";
                request.setAttribute("employeeList", employeeList);
                String s = arr.toString();
                //System.out.println(s);
                request.setAttribute("jsonEmployee", s);
                session.setAttribute("jsonEmployee", s);

                session.setAttribute("employeeList", employeeList);
                response.setContentType("text/html;charset=UTF-8");
                RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                dispatcher.forward(request, response);

            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
