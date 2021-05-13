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
String sql = "SELECT * FROM notice";

// 1단계 클래스 JDBC 드라이버 로드
Class.forName("com.mysql.jdbc.Driver");

// 2단계 데이터베이스 접속
Connection conn = DriverManager.getConnection(url, id, password);
System.out.println("데이터베이스 접속 성공");
// SQL 문장 객체 생성 및 설정
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<style>
#content {
	width: 550px;
	margin: 50px auto;
	border: 10px solid #ddd;
	padding: 50px;
}

td {
	border-bottom: 2px solid #ddd;
	padding: 5px;
}
</style>
</head>
<body>
	<div id="content">
		<table>
			<tr>
				<td><h3>공지사항 목록</h3></td>
			</tr>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>조회수</td>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getInt("ID")%></td>
				<td><a href="detail.jsp?id=<%=rs.getInt("ID")%>"><%=rs.getString("TITLE")%></a></td>
				<td><%=rs.getString("WRITER_ID")%></td>
				<td><%=rs.getInt("HIT")%></td>
			</tr>
			<%
				}
			%>

		</table>
		<a href="writeForm.html">글쓰기</a>
	</div>

</body>
</html>