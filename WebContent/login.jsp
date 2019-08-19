<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.board.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	String user_id = request.getParameter("id");
	String user_pw = request.getParameter("pw");
	Member user = null;
	
	try {
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		ResultSet rs = null;
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url,"board","12345");
		Statement stmt = con.createStatement();
		
		String sql = "select * from member where user_id = "+
				//'" + user_id + "' and user_pw = '" + user_pw + "'";
					 "(select user_id from member where user_id = '"+user_id+"' and user_pw = '"+user_pw+"')";
		
		System.out.println(sql);
		
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			user = new Member();
			user.setUser_id(rs.getString("user_id"));
			user.setUser_pw(rs.getString("user_pw"));
			
		}
	} catch (Exception e){
		out.println("error!");
	} finally {
		if(user == null){
			request.setAttribute("msg","there is no member Information");
			request.setAttribute("url", "index.jsp");
			
		} else {
			request.setAttribute("msg", "welcome!");
			request.setAttribute("url", "list.do");
			request.getSession().setAttribute("user", user_id);
		}
	}
%>
<script>
	alert("${msg}"+"${user}");
	location.href="${url}";
</script>
<body>
	

</body>
</html>