<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!Doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="Generator" content="EditPlus">
        <meta name="Author" content="HyejinKim">
        <meta name="Keywords" content="dessert">
        <meta name="Description" content="">
        <link rel="stylesheet" href="css/mystyle.css">
    </head>
    <body>
    	<%
    		String SQL = null;
    	
    		// 값 넘겨받기
    		String id = request.getParameter("id");
    	
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
	    	
	    	// views 1 늘리기
	    	try {
	    		SQL = "UPDATE notice SET views = views + 1 WHERE id = ?";
	    		
	    		pstmt = conn.prepareStatement(SQL);
	    		pstmt.setString(1, id);
	    		
	    		pstmt.executeUpdate();
	    	} catch(Exception e) {
	    		e.printStackTrace();
	    	}
    	%>
    	<form action="joinProc.jsp" method="post" class="event_form">
            <table class="event_table">
            	<%
	    	    	try {
	    	    		SQL = "SELECT * FROM notice WHERE id = ?";
	    	    		
	    	    		pstmt = conn.prepareStatement(SQL);
	    	    		pstmt.setInt(1, Integer.parseInt(id));
	    	    		
	    	    		rs = pstmt.executeQuery();
	    	    		
	    	    		if(rs.next()) {
	    	    			%>
								<tr>
									<td width="400px" class="writting_title"><%= rs.getString("title") %></td>
									<td><span class="writting_sub"> | 통합공지</span></td>
								</tr>
								<tr>
									<td class="writting_impormaiton" colspan="2"><font color="red">운영자</font> 조회 <%= rs.getInt("views") %> <%= rs.getString("timestamp") %></td>
								</tr>
								<tr colspan="2" class="writting_content">
									<td>
										<%= rs.getString("content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
									</td>
								</tr>
	    	    			<%
	    	    		} else {
	    	    			out.println("<script>history.go(-1);</script>");
	    	    		}
	    	    	} catch(Exception e) {
	    	    		e.printStackTrace();
	    	    	}
            	%>
            </table>
        </form>
	</body>
</html>