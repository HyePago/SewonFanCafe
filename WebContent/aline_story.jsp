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
	    %>	
        <form action="line_insert.jsp" method="post">
            <table width="700px" class="aline_story_table">
                <tbody>
                    <tr>
                        <td> <div class="notice_logo">한줄얘기</div></td>
                    </tr>
                    <tr height="2" bgcolor="#EF8556">
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td colspan="2">세운이의 한줄 얘기 :)</td>
                                </tr>
                                <tr>
                                    <td><textarea cols="80" name="text" rows="3"></textarea></td>
                                    <td><input type="submit" value="등록" class="aline_story_submit"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="notice_inner_table">
                                <tbody>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                    	<td>
                    		<%
                    			try {
                    				SQL = "SELECT * FROM aline ORDER BY timestamp DESC";
                    				
                    				pstmt = conn.prepareStatement(SQL);
                    				rs = pstmt.executeQuery();
                    				
                    				while(rs.next()){
                    					%>
                    					<table>
                    						<tr>
                    							<td></td>
                    							<td><%= rs.getString("nickname") %></td>
                    						</tr>
                    						<tr>
                    							<td></td>
                    							<td>
                    								<%= rs.getString("text") %>
                    							</td>
                    						</tr>
                    					</table>
                    					<hr>
                    					<%
                    				}
                    				
                    			} catch(Exception e) {
                    				e.printStackTrace();
                    			}
                    		%>
                    	</td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>