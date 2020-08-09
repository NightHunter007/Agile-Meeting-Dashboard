package virtusa.employee.dao;

import java.util.List;

import virtusa.login.model.Login;


public interface EmployeeDao {
	
	List <Employee> get();
	
	boolean save(Employee e);
	
	boolean taskAssign(Employee e);
	
	String task(Login e);
	
	Employee get(int id);
	
	boolean update(Employee e);
	
	boolean delete(int id);
}
