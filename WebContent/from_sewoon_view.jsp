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
	    		SQL = "UPDATE from_sewoon SET views = views + 1 WHERE id = ?";
	    		
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
	    	    		SQL = "SELECT * FROM from_sewoon WHERE id = ?";
	    	    		
	    	    		pstmt = conn.prepareStatement(SQL);
	    	    		pstmt.setInt(1, Integer.parseInt(id));
	    	    		
	    	    		rs = pstmt.executeQuery();
	    	    		
	    	    		if(rs.next()) {
	    	    			%>
	    	    			<tr>
	    	    				<td width="400px" class="writting_title" colspan="2"><%= rs.getString("title") %></td>
	    	    			</tr>
	    	    			<tr>
	    	    				<td class="writting_impormaiton" colspan="2"><font color="red"><%= rs.getString("nickname") %></font> 조회 <%= rs.getString("views") %> <%= rs.getString("timestamp") %> </td>
	    	    			</tr>
	    	    			<tr>
	    	    				<td class="writting_content" colspan="2" style="border-bottom: 1px solid #bbb">
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
                <tr class="writting_comment_name">
                    <td>
                    </td>
                    <td width="100px">인쇄 | 신고</td>
                </tr>
                <tr style="vertical-align: bottom; text-align: right;">
                    <td colspan="2"><a href="from_sewoon.jsp?page=1">목록</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="from_sewoon_view.jsp?id=<%= Integer.parseInt(id)+1 %>">▲윗글</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="from_sewoon_view.jsp?id=<%= Integer.parseInt(id)-1 %>">▼아랫글</a></td>
                </tr>
                <%
                	try {
						SQL = "SELECT * FROM from_sewoon WHERE id = ?";
	    	    		
	    	    		pstmt = conn.prepareStatement(SQL);
	    	    		pstmt.setInt(1, Integer.parseInt(id) + 1);
	    	    		rs = pstmt.executeQuery();
	    	    		
	    	    		if(rs.next()) {
	    	    			%>
	    	    				 <tr>
				                    <td>▲윗글&nbsp;&nbsp;&nbsp;| <a href="from_sewoon_view.jsp?id=<%= Integer.parseInt(id)+1 %>"><%= rs.getString("title") %></a></td>
				                    <td class="writting_time"><%= rs.getString("timestamp") %></td>
				                </tr>
	    	    			<%
	    	    		} else {
							%>
								<tr>
								</tr>
							<%
	    	    		}
	    	    		
						SQL = "SELECT * FROM from_sewoon WHERE id = ?";
	    	    		
	    	    		pstmt = conn.prepareStatement(SQL);
	    	    		pstmt.setInt(1, Integer.parseInt(id) - 1);
	    	    		rs = pstmt.executeQuery();
	    	    		
	    	    		if(rs.next()) {
	    	    			%>
	    	    				 <tr>
				                    <td>▼아랫글&nbsp;| <a href="from_sewoon_view.jsp?id=<%= Integer.parseInt(id)-1 %>"><%= rs.getString("title") %></a></td>
				                    <td class="writting_time"><%= rs.getString("timestamp") %></td>
				                </tr>
	    	    			<%
	    	    		} else {
							%>
								<tr>
								</tr>
							<%
	    	    		}
                	} catch(Exception e) {
                		e.printStackTrace();
                	}
                %>
            </table>
        </form>
    </body>
