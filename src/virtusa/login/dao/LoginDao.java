package virtusa.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import virtusa.login.model.Login;

public class LoginDao {
	
	public boolean validate(Login login) throws ClassNotFoundException {
		
		boolean status=false;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		try(Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee?useSSL=false","root","password");
				PreparedStatement ps=connection.prepareStatement("select * from employee where user_name=? and password=?")) {
			ps.setString(1, login.getUserName());
			ps.setString(2, login.getPassword());
			

			ResultSet rs=ps.executeQuery();
			status=rs.next();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
public boolean roleCheck(Login login) throws ClassNotFoundException {
		
		boolean status=false;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		try(Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee?useSSL=false","root","password");
				PreparedStatement ps=connection.prepareStatement("select role from employee where user_name=? and password=? and role='PRODUCT MANAGER'")) {
			ps.setString(1, login.getUserName());
			ps.setString(2, login.getPassword());
			

			ResultSet rs=ps.executeQuery();

			status=rs.next();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return status;
	}

}
