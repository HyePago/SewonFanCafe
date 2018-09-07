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
	String date = request.getParameter("date");
	String year = date.substring(0, 4);
	String month = date.substring(5, 7);
	String day = date.substring(8, 10);
	String division = request.getParameter("division");
	String channel = request.getParameter("channel");
	String title = request.getParameter("title");
	String time = request.getParameter("time");
	
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
			
	try {
		SQL = "INSERT INTO schedule (year, month, day, division, channel, title, time) VALUES (?,?,?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, year);
		pstmt.setString(2, month);
		pstmt.setString(3, day);
		pstmt.setString(4, division);
		pstmt.setString(5, channel);
		pstmt.setString(6, title);
		pstmt.setString(7, time);
		
		pstmt.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
	}
	out.println("<script>");
	out.println("location.href='../schedule.jsp';");
	out.println("</script>");

%>
