<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("EUC-KR");

String SQL = null;

// 값 넘겨 받기
String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");

//데이터 베이스 연결
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

out.print(title);

try {
	String dbURL = "jdbc:mysql://localhost:3306/sewonfancafe";
	String dbID = "root";
	String dbPassword = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
} catch(Exception e) {
	e.printStackTrace();
}

// 업데이트
try {
	SQL = "UPDATE notice set title=?, content=? where id=?";
	
	pstmt = conn.prepareStatement(SQL);
	
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	pstmt.setInt(3, Integer.parseInt(id));
	
	pstmt.executeUpdate();
} catch(Exception e){
	e.printStackTrace();
}

String out_script = "location.href='../notice_view.jsp?id=" + id + "';";
out.println("<script>");
out.println(out_script);
out.println("</script>");
%>