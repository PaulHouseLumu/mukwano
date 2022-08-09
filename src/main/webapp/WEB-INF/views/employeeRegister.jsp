<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>Employee Registration Form</h1>
		<form action="<%= request.getContextPath() %>/register" method="post">
			<table style="width: 80%">
				<tr>
					<td>Role</td>
					<td>
						<input type="radio" name="roleId" value=1 />
						<label for="Manager">Manager</label><br>
						<input type="radio" name="roleId" value=2 checked />
						<label for="Employee">Employee</label><br>
					</td>
				</tr>
				
				<tr>
					<td>First Name</td>
					<td><input type="text" name="firstName" required /></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input type="text" name="lastName" required /></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td>
						<input type="radio" name="gender" value="1" required />
						<label for="Male">Male</label><br>
						<input type="radio" name="gender" value="2" />
						<label for="Female">Female</label><br>
					</td>
				</tr>
			</table>
			<input type="submit" value="Submit" />
		</form>
	</div>
</body>
</html>