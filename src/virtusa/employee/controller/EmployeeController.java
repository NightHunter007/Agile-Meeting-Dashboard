package virtusa.employee.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import virtusa.employee.dao.Employee;
import virtusa.employee.dao.EmployeeDaoImp;

/**
 * Servlet implementation class EmployeeController
 */
@WebServlet("/EmployeeController")
public class EmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	EmployeeDaoImp employeeDao=null;
	RequestDispatcher dispatcher=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeController() {
        employeeDao = new EmployeeDaoImp();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String action=request.getParameter("action");
				if(action==null)
				{
					action="List";
				}
				switch(action)
				{
				case "LIST" : 
					listEmployees(request, response);
					break;
					
				case "EDIT" :
					getSingleEmployee(request,response);
					break;
					
				case "DELETE" :
					deleteEmployee(request,response);
					break;
					
				case "REDIRECT" : 
					redirect(request, response);
					break;
					
				default :
					listEmployees(request, response);
					break;
				}
	}

	

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String userName=request.getParameter("userName");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String role=request.getParameter("role");
		Employee e=new Employee();
		
		e.setUserName(userName);
		e.setEmail(email);
		e.setPassword(password);
		e.setRole(role);
		if(id.isEmpty()||id==null)
		{
			if(employeeDao.save(e)) {
				request.setAttribute("message", "Saved Successfully!");
			}
		}
		else
		{
			e.setId(Integer.parseInt(id));
			if(employeeDao.update(e)) {
				request.setAttribute("message", "Updated Successfully!");
			}
		}
		
		listEmployees(request,response);
	}
	
	public void listEmployees(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		List<Employee> list=employeeDao.get();
		
		request.setAttribute("list", list);
		
		dispatcher=request.getRequestDispatcher("/views/loginSuccess.jsp");
		dispatcher.forward(request, response);
	}
	
	public void getSingleEmployee(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		String id=request.getParameter("id");
		Employee employee=employeeDao.get(Integer.parseInt(id));
		request.setAttribute("employee", employee);
		dispatcher=request.getRequestDispatcher("/views/loginSuccess.jsp");
		dispatcher.forward(request, response);
	}
	
	public void deleteEmployee(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		String id=request.getParameter("id");
		if(employeeDao.delete(Integer.parseInt(id)))
		{
			request.setAttribute("message", "Record has been Deleted");
		}
		listEmployees(request,response);
	}
	
	public void redirect(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		dispatcher=request.getRequestDispatcher("/views/loginBasic.jsp");
		dispatcher.forward(request, response);
		
	}

}
