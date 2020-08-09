package virtusa.login.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import virtusa.employee.dao.EmployeeDaoImp;
import virtusa.login.dao.LoginDao;
import virtusa.login.model.Login;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	EmployeeDaoImp employeeDao=null;
	private LoginDao loginDao;
	RequestDispatcher dispatcher=null;
	public void init() {
		loginDao = new LoginDao();
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
			dispatcher = request.getRequestDispatcher("/views/employeeLogin.jsp");
			dispatcher.forward(request, response);
			break;
		
			
		default :
			dispatcher = request.getRequestDispatcher("/views/employeeLogin.jsp");
			dispatcher.forward(request, response);
			break;
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		
		Login login=new Login();
		login.setUserName(userName);
		login.setPassword(password);
		
		try {
			
			if(loginDao.validate(login)) {
				
				if(loginDao.roleCheck(login))
				{
					RequestDispatcher dispatcher = request.getRequestDispatcher("/views/loginSuccess.jsp");
					dispatcher.forward(request, response);
				}
				else
				{
					String e=employeeDao.task(login);
					if(e.charAt(0)!='&' || e==null)
					{
						RequestDispatcher dispatcher = request.getRequestDispatcher("/views/loginBasic.jsp");
						request.setAttribute("currentTask", "No Task Currently Assigned!");
						dispatcher.forward(request, response);
					}
					else
					{
						RequestDispatcher dispatcher = request.getRequestDispatcher("/views/loginBasic.jsp");
						request.setAttribute("currentTask", e.substring(1));
						dispatcher.forward(request, response);
					}
					RequestDispatcher dispatcher = request.getRequestDispatcher("/views/loginBasic.jsp");
					dispatcher.forward(request, response);
				}
				
				
				
			}
			else {
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/views/employeeLogin.jsp");
				dispatcher.forward(request, response);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}

}
