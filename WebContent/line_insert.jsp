 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

// 값 받아오기
String text = request.getParameter("text");

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

// 글 저장
String SQL = "INSERT INTO aline (username, nickname, text) VALUES (?, ?, ?);";

pstmt = conn.prepareStatement(SQL);
pstmt.setString(1, (String)session.getAttribute("id"));
pstmt.setString(2, (String)session.getAttribute("nickname"));
pstmt.setString(3, text);

pstmt.executeUpdate();

out.println("<script>");
out.println("location.href='aline_story.jsp';");
out.println("</script>");
%>
