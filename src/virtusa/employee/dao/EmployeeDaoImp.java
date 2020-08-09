package virtusa.employee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import virtusa.login.model.Login;

public class EmployeeDaoImp implements EmployeeDao {

	Connection connection=null;
	Statement statement=null;
	ResultSet resultSet=null;
	PreparedStatement preparedStatement=null;
	
	@Override
	public List<Employee> get() {
		List<Employee> list=null;
		Employee employee=null;
		
		try {
			list=new ArrayList<Employee>();
			
			String sql="SELECT id,user_name,email,role FROM employee";
			
			connection=DBConnectionUtil.openConnection();
			
			statement=connection.createStatement();
			
			resultSet=statement.executeQuery(sql);
			
			while(resultSet.next()) {
				employee=new Employee();
				employee.setId(resultSet.getInt("id"));
				employee.setUserName(resultSet.getString("user_name"));
				employee.setEmail(resultSet.getString("email"));
				employee.setRole(resultSet.getString("role"));
				list.add(employee);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public boolean save(Employee e) {
		boolean flag=false;
		try {
			String sql="INSERT INTO employee(user_name,email,password,role) VALUES('"+e.getUserName()+"','"+e.getEmail()+"','"+e.getPassword()+"','"+e.getRole()+"')";
			connection=DBConnectionUtil.openConnection();
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag=true;
		}catch(SQLException ex) {
			ex.printStackTrace();			
		}
		return flag;
	}
	@Override
	public Employee get(int id) {
		Employee employee=null;
		try {
			employee=new Employee();
			String sql="SELECT * FROM employee WHERE id="+id;
			connection=DBConnectionUtil.openConnection();
			statement=connection.createStatement();
			resultSet=statement.executeQuery(sql);
			while(resultSet.next())
			{
				employee.setId(resultSet.getInt("id"));
				employee.setUserName(resultSet.getString("user_name"));
				employee.setEmail(resultSet.getString("email"));
				employee.setRole(resultSet.getString("role"));
			}
		}catch(SQLException ex)
		{
			ex.printStackTrace();
		}
		
		
		return employee;
	}
	@Override
	public boolean update(Employee e) {
		boolean flag=false;
		try {
			String sql="UPDATE employee SET user_name='"+e.getUserName()+"',email='"+e.getEmail()+"',password='"+e.getPassword()+"',role='"+e.getRole()+"' WHERE id="+e.getId();
			connection= DBConnectionUtil.openConnection();
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag=true;
			
		}catch(SQLException ex)
		{
			ex.printStackTrace();
		}
		return flag;
	}
	@Override
	public boolean delete(int id) {
		boolean flag=false;
		try {
			String sql="DELETE FROM employee where id="+id;
			connection= DBConnectionUtil.openConnection();
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag=true;
			
		}catch(SQLException ex)
		{
			ex.printStackTrace();
		}
		return flag;
		
	}
	@Override
	public boolean taskAssign(Employee e) {
		boolean flag=false;
		try {
			String sql="UPDATE employee SET task='"+e.getTask()+"' WHERE user_name='"+e.getUserName()+"'";
			connection=DBConnectionUtil.openConnection();
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag=true;
		}catch(SQLException ex) {
			ex.printStackTrace();			
		}
		return flag;
	}
	@Override
	public String task(Login e) {
		Employee employee=null;
		String ans="";
		try {
			employee=new Employee();
			String sql="SELECT task FROM employee WHERE user_name='"+e.getUserName()+"'";
			connection=DBConnectionUtil.openConnection();
			statement=connection.createStatement();
			resultSet=statement.executeQuery(sql);
			
			while(resultSet.next())
			{
				employee.setTask(resultSet.getString("task"));
			}
			ans=employee.getTask();
			
		}catch(SQLException ex) {
			ex.printStackTrace();			
		}
		if(ans==null)
			return "0";
		return ans ;
		
	}

}
