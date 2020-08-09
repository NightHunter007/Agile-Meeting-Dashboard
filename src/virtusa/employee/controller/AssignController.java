package virtusa.employee.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import virtusa.employee.dao.Employee;
import virtusa.employee.dao.EmployeeDaoImp;

/**
 * Servlet implementation class AssignController
 */
@WebServlet("/AssignController")
public class AssignController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	EmployeeDaoImp employeeDao=null;
	RequestDispatcher dispatcher=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignController() {
    	employeeDao = new EmployeeDaoImp();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action==null)
		{
			action="REDIRECT";
		}
		switch(action)
		{
		case "REDIRECT" : 
			redirect(request, response);
			break;
			
		case "LOGOUT" :
			logout(request,response);
			break;
			
			
		default :
			redirect(request, response);
			break;
		}
		
	}


	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dispatcher=request.getRequestDispatcher("/views/employeeLogin.jsp");
		dispatcher.forward(request, response);
		
	}

	public void redirect(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dispatcher=request.getRequestDispatcher("/views/Assign.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String task=request.getParameter("InputTask");
		
		String []name=task.split("#");
		String task1=name[0];
		String name1=name[1];		
		
		Employee e=new Employee();
		
		
		e.setUserName(name1);
		e.setTask(task1);
		
		if(employeeDao.taskAssign(e)) {
			request.setAttribute("message", "Task Assigned Successfully!");
		}
		else
		{
			request.setAttribute("message", "Error!! Please check Query");
		}
		
		dispatcher=request.getRequestDispatcher("/views/Assign.jsp");
		dispatcher.forward(request, response);
	}

}
