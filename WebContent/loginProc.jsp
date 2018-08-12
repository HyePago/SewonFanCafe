<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 값 넘겨 받기
String username = request.getParameter("username");
String password = request.getParameter("password");

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

// 로그인
String SQL = "SELECT password FROM user WHERE username = ?";

try {
	pstmt = conn.prepareStatement(SQL);
	pstmt.setString(1, username);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(rs.getString(1).equals(password)){
			// 로그인 성공
			session.setAttribute("id", username);
			out.println("<script>");
			out.println("location.href('main.jsp');");
			out.println("</script>");
		} else {
			// 로그인 실패
			out.println("<script>");
			out.println("alert('로그인에 실패하셨습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
		}
	}
	
	// 아이디 존재 X
	out.println("<script>");
	out.println("alert('로그인에 실패하셨습니다.');");
	out.println("history.go(-1);");
	out.println("</script>");
} catch(Exception e) {
	e.printStackTrace();
}
%>