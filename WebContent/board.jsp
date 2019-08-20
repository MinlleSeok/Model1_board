<%@page import="com.board.bean.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>본격 게시판 - 게시글 리스트</title>
</head>

<%
	request.setCharacterEncoding("UTF-8");
	// ArrayList<Board> ar = new ArrayList<Board>();
	// Board bd = null;
	// ResultSet rs = null;
	
	try {
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		ResultSet rs = null;
		
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, "board", "12345");
		out.println("Oracle Database Connection Success.");
		
		Statement stmt = con.createStatement();
		
		String sql = "SELECT * FROM board order by idx desc";
		
		rs = stmt.executeQuery(sql);
		
		/*
		while(rs.next()){
			bd = new Board();
			bd.setIdx(rs.getInt("idx"));
			bd.setContent(rs.getString("title"));
			bd.setCount(rs.getInt("count"));
			bd.setRegdate(rs.getString("regdate"));
			bd.setTitle(rs.getString("title"));
			bd.setWriter(rs.getString("writer"));
			ar.add(bd);
		}
		
		
		stmt.close();
		rs.close();
		con.close();
		
	} catch (Exception e){
		out.println("board.jsp 오류");
		out.println(e.getMessage());
		e.printStackTrace();	
	}
	
	request.setAttribute("array", ar);
	*/
%>
<style type="text/css">
	table, td, th {
		border: 1px solid green;
	}
	th {
		background-color: green;
		color: white;
	}
</style>
<body>
	<h1>게시글 리스트</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<%
			while(rs.next()){
				out.print("<tr>");
				out.print("<td>"+rs.getString(1)+"</td>");
				out.print("<td><a href='content.jsp?idx="+rs.getString("idx")+"'>"+rs.getString("title")+"</a></td>");
				out.print("<td>"+rs.getString(3)+"</td>");
				out.print("<td>"+rs.getString(4)+"</td>");
				out.print("<td>"+rs.getString(5)+"</td>");
				out.print("</tr>");
			}
		%>
		
		<!-- 
		<c:forEach var="arr" items="${array}">
		<tr>
			<td>${arr.title}</td>
			<td>${arr.writer}</td>
			<td>${arr.regdate}</td>
			<td>${arr.count}</td>
			<td>${arr.content}</td>
		</tr>
		</c:forEach>
		 -->
	</table>
	<a href="write.jsp">글쓰기</a>
	<%
		con.close();
	} catch (Exception e) {
		out.println("데이터베이스 연결 에러 <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
	%>
</body>
</html>