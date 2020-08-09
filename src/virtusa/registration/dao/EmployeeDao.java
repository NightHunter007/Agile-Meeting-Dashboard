package virtusa.registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import virtusa.registration.model.Employee;

public class EmployeeDao {
	
	public int registerEmployee(Employee employee) throws ClassNotFoundException {
		String INSERT_USERS_SQL="insert into employee"+"(user_name,email,password,role) values"
				+"(?,?,?,?);";
		
		int result=0;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		try(Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee?useSSL=false","root","password");
				PreparedStatement ps=connection.prepareStatement(INSERT_USERS_SQL)) {

			ps.setString(1, employee.getUserName());
			ps.setString(2, employee.getEmail());
			ps.setString(3, employee.getPassword());
			ps.setString(4, employee.getRole());
			

			
			result=ps.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
