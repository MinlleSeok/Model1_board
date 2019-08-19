<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	
	try {
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url,"board","12345");
		out.println("Oracle Database Connection Success");
		
		Statement stmt = con.createStatement();
		String sql = "INSERT INTO member" +
					 "(idx, name, user_id, user_pw) "+
					 "VALUES(member_seq.nextval,'"+name+"','"+user_id+"','"+user_pw+"')";
		stmt.executeUpdate(sql);
		
		con.close();
		
	} catch(Exception e){
		
		out.println(e.getMessage());
		e.printStackTrace();
		
		
	} finally {
		request.setAttribute("url","index.jsp");
	}
%>
<script>
	location.href='${url}';
</script>
<body>

</body>
</html>