<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>본격 게시판 - 게시글 리스트</title>
<script>
	function validateLogin(){
		var id = document.forms[0].id;
		var pw = document.forms[0].pw;
		
		if(id.value == "") {
			alert("id is null");
			id.focus();
			return false;
		} else if(id.value.indexOf("'") != -1){
			alert("you can't use single quotation!");
			id.value = "";
			id.focus();
			return false;
		}
		
		if(pw.value == ""){
			alert("pw is null");
			pw.focus();
			return false;
			
		} else if(pw.value.indexOf("'") != -1) {
			alert("you can't use single quotation!");
			pw.value = "";
			pw.focus();
			return false;
			
		}
	}
</script>
</head>
<%-- 
<%
	request.setCharacterEncoding("UTF-8");
	int idx = 1;
	String title = request.getParameter("title"); // "제목입니다.";
	String writer = request.getParameter("writer"); // "작성자이름";
	String regdate = request.getParameter("regdate"); // "120610";
	int count = 10000;
	String content = request.getParameter("content");
	
	if(title == "" || title == null) out.println("title이 null입니다.");
	
	if(writer == "" || writer == null)
		out.println("writer가 null입니다.");
	else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
		out.println("이메일 형식이 아닙니다.");
	
	if(regdate == "" || regdate == null)
		out.println("regdate가 null입니다.");
	else if(!Pattern.matches("^[0-9]*$", regdate))
		out.println("숫자형식이 아닙니다.");
	
	if(content == "" || content == null) out.println("content가 null입니다.");
		
	
%>
--%>
<body>
	<form action="login.jsp" onsubmit="return validateLogin()">
		ID : <input type="text" name="id" /> <br/>
		PW : <input type="password" name="pw" /> <br/>
		<input type="submit" value="로그인" />
		<input type="button" value="회원가입" onclick="location.href='enter.jsp';" />
	</form>
	<a href="board.jsp">게시판</a>
</body>
</html>