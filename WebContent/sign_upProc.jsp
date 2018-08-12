<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String SQL = null;

// 값 넘겨 받기
String name = request.getParameter("name");
String username = request.getParameter("username");
String password = request.getParameter("password");
String password_confirm = request.getParameter("password_confirm");
String email = request.getParameter("email");

// 비밀번호 확인
if(!password.equals(password_confirm)){ // 비밀번호와 비밀번호 확인이 일치하지 않는다면
	out.println("<script>");
	out.println("alert('비밀번호를 다시 한 번 확인해주세요.');");
	out.println("history.go(-1);");
	out.println("</script>");
}

// 데이터 베이스 연결
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

// 이미 아이디가 존재하는 지 확인
try {
	SQL = "SELECT name FROM user WHERE username = ?";
	
	pstmt = conn.prepareStatement(SQL);
	pstmt.setString(1, username);
	
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		out.println("<script>");
		out.println("alert('이미 존재하는 아이디입니다.');");
		out.println("history.go(-1);");
		out.println("</script>");
	}
} catch(Exception e){
	e.printStackTrace();
}

// 회원가입
try {
	SQL = "INSERT INTO user (name, username, password, email) VALUES (?, ?, ?, ?);";
	
	pstmt = conn.prepareStatement(SQL);
	pstmt.setString(1, name);
	pstmt.setString(2, username);
	pstmt.setString(3, password);
	pstmt.setString(4, email);
	
	pstmt.executeUpdate();
} catch(Exception e) {
	e.printStackTrace();
}
%>