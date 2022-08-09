package employee.controller;
import employee.dao.EmployeeDao;
import employee.model.Employee;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmployeeServlet
 */
@WebServlet("/register")
public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private EmployeeDao employeeDao = new EmployeeDao();
    /**
     * Default constructor. 
     */
    public EmployeeServlet() {
    	super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/employeeRegister.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int roleId = Integer.parseInt(request.getParameter("roleId"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		int gender = Integer.parseInt(request.getParameter("gender"));
		
		
		Employee employee = new Employee();
		employee.setRoleId(roleId);
		employee.setFirstName(firstName);
		employee.setLastName(lastName);
		employee.setGender(gender);
		
		try{
			employeeDao.registerEmployee(employee);
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/employeedetails.jsp");
		dispatcher.forward(request, response);
	}

}
