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
String nickname = request.getParameter("nickname");
String mail_txt = request.getParameter("mail");
String facing_txt = request.getParameter("facing");
String text = request.getParameter("text");

int mail = 0;
int facing = 0;

if(mail_txt == null) {
	mail = 0;
} else {
	mail = 1;
}

if(facing_txt == null) {
	facing = 0;
} else {
	facing = 1;
}

// 로그인 되어 있는 지 확인 - 안되어있을 경우, 로그인 창으로 이동
if(((String)session.getAttribute("id")) == null || ((String)session.getAttribute("id")).equals("")) {
	out.println("<script>");
	out.println("location.href('sign_up.html');");
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

// 닉네임 중복 확인
try {
	SQL = "SELECT username FROM cafe_user WHERE nickname = ?";
	
	pstmt = conn.prepareStatement(SQL);
	pstmt.setString(1, nickname);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		// 중복된 닉네임 존재
		out.println("<script>");
		out.println("alert('이미 존재하는 닉네임입니다.');");
		out.println("history.go(-1);");
		out.println("</script>");
	}
} catch(Exception e) {
	e.printStackTrace();
}

// 카페 가입
try {
	SQL = "INSERT INTO cafe_user (username, nickname, text, mail, facing) VALUES (?, ?, ?, ?, ?);";
	
	pstmt = conn.prepareStatement(SQL);
	pstmt.setString(1, (String)session.getAttribute("id"));
	pstmt.setString(2, nickname);
	pstmt.setString(3, text);
	pstmt.setInt(4, mail);
	pstmt.setInt(5, facing);
	
	pstmt.executeUpdate();
} catch(Exception e) {
	e.printStackTrace();
}

session.setAttribute("nickname", nickname);
out.println("<script>");
out.println("location.href='main.jsp';");
out.println("</script>");
%>
