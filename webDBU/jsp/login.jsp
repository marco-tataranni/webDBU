<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <%
        String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=tataranni.marco;password=xxx123#";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        Connection connection = DriverManager.getConnection(connectionUrl);
        Statement stmt = connection.createStatement();
        String sql = "SELECT * FROM Sblendorio where Username='"+request.getParameter("user")+"' and Password='"+request.getParameter("psw")+"'";
			
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next())
		{
		    out.print("Benvenuto, "+rs.getString("Nome"));
		}else
		{
		    out.print("Utente non riconosciuto");
		}
		
		 rs.close();
	        
	     connection.close();
    %>
</body>
</html>