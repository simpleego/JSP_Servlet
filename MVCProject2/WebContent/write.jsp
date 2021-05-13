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
	
	
	// 한글처리 인코딩
	request.setCharacterEncoding("UTF-8");
	
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer_id = request.getParameter("writer_id");
	
	String sql = "insert into notice(title, content,writer_id) values "
			+"("+"'"+title+"','"+content+"','"+writer_id+"'"+")";
	
	System.out.println("sql : "+sql);
	// 1단계 클래스 JDBC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계 데이터베이스 접속
	Connection conn = DriverManager.getConnection(url, id, password);
	System.out.println("데이터베이스 접속 성공");
	// SQL 문장 객체 생성 및 설정
	Statement stmt = conn.createStatement();
	int i = stmt.executeUpdate(sql);
	if (i >= 1) {
		// 목록을 보여주기
		response.sendRedirect("list.jsp");
	}else {
		System.out.println(" 데이터 삽입 에러!!");
	}
%>   