<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String SQL = null;

// 값 넘겨 받기
String id = request.getParameter("id");

//데이터 베이스 연결
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
	String dbURL = "jdbc:mysql://localhost:3306/sewonfancafe";
	String dbID = "root";
	String dbPassword = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
} catch(Exception e) {
	e.printStackTrace();
}

try {
	// 카페 회원 삭제
	SQL = "DELETE FROM notice WHERE id = ?";
	
	pstmt = conn.prepareStatement(SQL);
	pstmt.setString(1, id);
	pstmt.executeUpdate();
} catch(Exception e) {
	e.printStackTrace();
}

out.println("<script>");
out.println("location.href='../notice.jsp?page=1';");
out.println("</script>");
%>