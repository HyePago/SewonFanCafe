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
        <link rel="stylesheet" href="../css/mystyle.css">
    </head>
    <body>
    	<script>
    		function delete() {
    			
    		}
    	</script>
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
        <form action="mananager_Form.html" method="post">
            <table width="700" class="login_out_table">
                <tbody>
                    <tr>
                        <td> <div class="login_logo">회원 관리</div></td>
                    </tr>
                    <tr height="2" bgcolor="#EF8556">
                        <td></td>
                    </tr>
                    <tr style="text-align: center;">
                        <td colspan="2" class="login_blank">
                            <table width="700" class="login_inner_table" align="center">
                                <tbody>
                                    <tr>
                                        <th>아이디</th>
                                        <th>닉네임</th>
                                        <th> 삭제 </th>
                                    </tr>
                                    <%
                                    	try {
                                    		SQL = "SELECT * FROM cafe_user";
                                    		
                                    		pstmt = conn.prepareStatement(SQL);
                                    		rs = pstmt.executeQuery();
                                    		
                                    		while(rs.next()){
                                    			%>
                                    				<tr>
														<td><%= rs.getString("username") %></td>
														<td><%= rs.getString("nickname") %></td>
														<td><input type="button" value="삭제"  class="notice_submit" onclick=""></td>
                                    				</tr>
                                    			<%
                                    		}
                                    	} catch(Exception e) {
                                    		e.printStackTrace();
                                    	}
                                    %>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="button" value="이전"  class="notice_submit"></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>