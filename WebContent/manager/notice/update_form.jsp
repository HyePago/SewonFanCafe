<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="Generator" content="EditPlus">
        <meta name="Author" content="HyejinKim">
        <meta name="Keywords" content="dessert">
        <meta name="Description" content="">
        <link rel="stylesheet" href="../../css/mystyle.css">
    </head>
    <body>
    	<%
    		request.setCharacterEncoding("UTF-8");
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
	    	
	    		SQL = "SELECT * FROM notice WHERE id = ?";
	    		
	    		pstmt = conn.prepareStatement(SQL);
	    		pstmt.setInt(1, Integer.parseInt(id));
	    		
	    		rs = pstmt.executeQuery();
	    	} catch(Exception e) {
	    		e.printStackTrace();
	    	}
    	%>
        <form action="update.jsp" method="post">
            <table>
            	<%
            		if(rs.next()){
            			%>
                        <tr>
	                        <td width="400px"><input type="text" class="write_title" name="title" placeholder="제목" value="<%= rs.getString("title") %>" required></td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <textarea rows="30" cols="98" name="content" class="write_content" required><%= rs.getString("content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;") %></textarea>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <input type="submit" vlaue="작성" class="write_btn"> &nbsp; <a href="../notice_view.jsp?id=<%= id %>" class="write_btn">취소</a>
	                        </td>
	                    </tr>
                    <%
            		}
            	%>
            </table>
            <input type="hidden" name="id" value="<%= id %>" />
        </form>
    </body>
</html>