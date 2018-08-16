<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("UTF-8");

//값 넘겨 받기
String title = request.getParameter("title");
String content = request.getParameter("content");

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

//글 추가
try {
	String SQL = "INSERT INTO notice (title, content) VALUES (?, ?);";
	
	pstmt = conn.prepareStatement(SQL);
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	
	pstmt.executeUpdate();
} catch(Exception e) {
	e.printStackTrace();
}

out.println("<script>");
out.println("location.href='../notice.jsp?page=1';");
out.println("</script>");
%>