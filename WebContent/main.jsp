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
    %>
        <iframe name="main_youtube" width=100% height="500px" style="border: none" src="https://www.youtube.com/embed/3cfkrMG3vFQ" align="right">
        </iframe>
        <table class="notice_table">
            <tr>
                <td><span class="table_logo">카페에서 알립니다</span></td>
            </tr>
            <tr>
                <td bgcolor="#EF8556" height="2"></td>
            </tr>
            <tr>
                <td>
                    <table class="main_inner_table">
                    	<%
                    		try {
                    			SQL = "SELECT * FROM notice ORDER BY timestamp DESC LIMIT 3";
                    		
                    			pstmt = conn.prepareStatement(SQL);
                    			
                    			rs = pstmt.executeQuery();
                    			
                    			while(rs.next()){
                    				%>
                    					<tr>
                    						<td><a href="notice_view.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("title") %></a></td>
                    					</tr>
                    				<%
                    			}
                    		} catch(Exception e) {
                    			e.printStackTrace();
                    		}
                    	%>
                    </table>
                </td>
            </tr>
        </table>
        <table class="notice_table">
            <tr>
                <td><span class="table_logo">최신글 보기</span></td>
            </tr>
            <tr>
                <td bgcolor="#EF8556" height="2"></td>
            </tr>
            <tr>
                <td>
                    <table class="main_inner_table">
                    	<%
                    		try {
                    			SQL = "SELECT * FROM to_sewoon ORDER BY timestamp DESC LIMIT 3";
                    		
                    			pstmt = conn.prepareStatement(SQL);
                    			
                    			rs = pstmt.executeQuery();
                    			
                    			while(rs.next()){
                    				%>
                    					<tr>
                    						<td><a href="to_sewoon_view.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("title") %></a></td>
                    					</tr>
                    				<%
                    			}
                    		} catch(Exception e) {
                    			e.printStackTrace();
                    		}
                    	%>
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>