<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.Month"%>
<%@page import="java.util.Calendar"%>
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
			
			// 값 넘겨받기
			int requestMonth = Integer.parseInt(request.getParameter("month"));
			
			// 값 조건
			if(requestMonth > 12) requestMonth = 12;
			if(requestMonth < 1) requestMonth = 1;
		
			// 현재 날짜
			Calendar calendar = Calendar.getInstance(); 
			int sysMonth = calendar.get(Calendar.MONTH) + 1;
			
			// 화면에 보여줄 날짜
			Calendar viewCal = Calendar.getInstance();
			viewCal.set(Calendar.MONTH, (requestMonth-1));
			viewCal.set(Calendar.DATE, 1);
			
			// 해당 월 시작 요일
			int startDay = viewCal.get(Calendar.DAY_OF_WEEK);
			
			// 해당 월 마지막 날짜
			int lastDay = viewCal.getActualMaximum(Calendar.DATE);
		%>
		<form>
			<table width="500" class="schedule_table">
                <tbody>
                    <tr>
                        <td> <span class="schedule_logo"> <a href="schedule.jsp?month=1">&#60;&#60;</a>&nbsp;&nbsp;<a href="schedule.jsp?month=<%= requestMonth - 1 %>">&#60;</a>&nbsp;&nbsp;&nbsp; 2018년 <%= requestMonth %>월 &nbsp;&nbsp;&nbsp;<a href="schedule.jsp?month=<%= requestMonth + 1 %>">&#62;</a>&nbsp;&nbsp;<a href="schedule.jsp?month=12">&#62;&#62;</a> </span> </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <table class="schedule_inner_table">
                                <tr>
                                    <th>SUN</th>
                                    <th>MON</th>
                                    <th>TUE</th>
                                    <th>WED</th>
                                    <th>THU</th>
                                    <th>FRI</th>
                                    <th>SAT</th>
                                </tr>
                                <%
                                	int tempDay = startDay;
                                
                                	out.println("<tr>");
									for(int i=1; i < startDay; i++){
										out.println("<td></td>");
									}
                                
                                	for(int i=1; i <= lastDay; i++){
                                		if(tempDay == 1) {
                                			if(!(tempDay == startDay)){
                                    			out.println("<tr>");	
                                			}
                                		}
                                		
                                		// 데이터 가져오기
                                		try {
                                			SQL = "SELECT * FROM schedule WHERE year=? and month=? and day=?";
                                			
                                			pstmt = conn.prepareStatement(SQL);
                                			pstmt.setInt(1, viewCal.get(Calendar.YEAR));
                                			pstmt.setInt(2, requestMonth);
                                			pstmt.setInt(3, i);
                                			
                                			rs = pstmt.executeQuery();
                                			
                                			if(rs.next()) {
                                				if((calendar.get(Calendar.MONTH) + 1) == requestMonth && calendar.get(Calendar.DATE) == i ) {
                                        			%>
                                        				<td bgcolor="#EEDF89" title="[<%= rs.getString("division") %>] <%= rs.getString("channel") %> <%= rs.getString("title")%>&#13;시간 - <%= rs.getString("time") %>">
                                        					<%= i %><br>
                                        					<span class="schedule_text">[<%= rs.getString("division") %>] <%= rs.getString("channel") %>..</span>
                                        				</td>
                                        			<%
                                        		} else {
        	                                		%>
        	                                			<td title="[<%= rs.getString("division") %>] <%= rs.getString("channel") %> <%= rs.getString("title") %>">
                                        					<%= i %><br>
                                        					<span class="schedule_text">[<%= rs.getString("division") %>] <%= rs.getString("channel") %>..</span>
                                        				</td>
        	                                		<%	
                                        		}
                                			} else {
                                				if((calendar.get(Calendar.MONTH) + 1) == requestMonth && calendar.get(Calendar.DATE) == i ) {
                                        			%>
                                        				<td bgcolor="#EEDF89"><%= i %></td>
                                        			<%
                                        		} else {
        	                                		%>
        	                                		<td><%= i %></td>
        	                                		<%	
                                        		}
                                			}
                                			
                                		} catch(Exception e) {
                                			e.printStackTrace();
                                		}
                                		if(tempDay == 7) {
                                			out.println("</tr>");
                                		}
                                		
                                		tempDay++;
                                		
                                		if(tempDay > 7) tempDay = 1;
                                	}
                                %>
                            </table>
                        </td>
                    </tr>
                    <tr class="today_schedule">
                        <td>
                            <span class="today_schedule_span"> 오늘 일정 </span>
                        </td>
                    </tr>
                    <tr class="today_schedule">
                        <td class="today_schedule_td">
                        	<%
                        		try {
                        			SQL = "SELECT * FROM schedule WHERE year=? and month=? and day=?";
                        			
                        			pstmt = conn.prepareStatement(SQL);
                        			pstmt.setInt(1, calendar.get(Calendar.YEAR));
                        			pstmt.setInt(2, calendar.get(Calendar.MONTH) + 1);
                        			pstmt.setInt(3, calendar.get(Calendar.DATE));
                        			
                        			rs = pstmt.executeQuery();
                        			
                        			if(rs.next()) {
                        				%>
                        					<span><b>[<%= rs.getString("division") %>] <%= rs.getString("channel") %> <%= rs.getString("title") %></b> <br>
                                			시간 - <%= rs.getString("time") %>
                            </span>
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