<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String url = "jdbc:mysql://211.228.178.214/book_db";
	String id = "hello";
	String password = "pjc0129";
	
	String id_ = request.getParameter("id");
	
	String sql = "SELECT * FROM notice where ID=?";
	
	// 1단계 클래스 JDBC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계 데이터베이스 접속
	Connection conn = DriverManager.getConnection(url, id, password);
	System.out.println("데이터베이스 접속 성공");
	// SQL 문장 객체 생성 및 설정
	PreparedStatement stmt = conn.prepareStatement(sql);
	int id1 = Integer.parseInt(id_);
	stmt.setInt(1, id1);
	ResultSet rs = stmt.executeQuery();
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#content {
	width: 400px;
	margin: 50px auto;
	border: 10px solid #ddd;
	padding: 50px;
}
</style>
</head>
<body>
	<div id="content">
	<h3>공지사항 글쓰기</h3>
	<form action="update.jsp" method="post">
		번호 : <input type="text" readonly name="id" value="<%= rs.getInt("ID") %>" /><br>
		제목 : <input type="text" name="title" value="<%= rs.getString("TITLE") %>"/><br>
		작성자 : <input type="text"  readonly value="<%= rs.getString("WRITER_ID") %>"/><br>
		내용 : <br>
		<textarea rows="10" cols="50"  name="content">
			<%= rs.getString("CONTENT") %>
		</textarea><br>
		<input type="submit" value="수정" >
		<a href="delete.jsp?id=<%= rs.getInt("ID") %>">삭제</a>
		<a href="list.jsp">목록보기</a>
	</form>
	</div>

</body>
</html>