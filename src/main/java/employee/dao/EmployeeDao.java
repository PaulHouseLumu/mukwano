package employee.dao;
import java.sql.*;

import DBUtils.DBUtil;
import employee.model.Employee;


public class EmployeeDao {
	
	 
	 public int registerEmployee(Employee employee) throws ClassNotFoundException{
		 String INSERT_USERS_SQL = "INSERT INTO employee (role_id, first_name, last_name, gender) VALUES (?, ?, ?, ?);";
		 
		 int result = 0;
		 
		 //Class.forName("com.mysql.cj.jdbc.Driver"); 
		 try(
//				 Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/fruitsodadb", "root", "");
			
			Connection connection = new DBUtil().getConnection();
				 
			// Step2: Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)){
			//preparedStatement.setInt(1,3);
			preparedStatement.setInt(1,employee.getRoleId());
			preparedStatement.setString(2,employee.getFirstName());
			preparedStatement.setString(3,employee.getLastName());
			preparedStatement.setInt(4,employee.getGender());
			
			System.out.println(preparedStatement);
			
			// Step3: Execute the query
			result = preparedStatement.executeUpdate();
		 
		 } catch(SQLException e) {
			 e.printStackTrace();
		 }
		 return result;
	 }
	 }
			
					 