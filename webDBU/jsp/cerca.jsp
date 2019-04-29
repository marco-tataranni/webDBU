<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <%
        String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=tataranni.marco;password=xxx123#";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        Connection connection = DriverManager.getConnection(connectionUrl);
        String text="%"+request.getParameter("text")+"%";
        String sql = "SELECT * FROM Sblendorio where "+request.getParameter("type")+" like ?";
        
       
		PreparedStatement st = connection.prepareStatement(sql);
    	st.setString(1,text );
    	ResultSet rs = st.executeQuery(); 	
		
		
		out.print("<table>");
			
		out.print("<tr><th align=left>Cognome</th><th align=left>Nome</th><th align=left>E-mail</th><th align=left>Username</th></tr>");
			
    	while(rs.next()){

			String Nome = rs.getString("Nome");
			String Cognome = rs.getString("Cognome");
			String Email = rs.getString("Email");
			String Username = rs.getString("Username");
                
            out.print("<tr><td>" + Cognome + "</td><td>" + Nome + "</td><td>" + Email + "</td><td>" + Username + "</td></tr>");

	        }
	        
	     out.print("</table>");
	        
		 rs.close();
	        
	     connection.close();
    %>

</body>
</html>