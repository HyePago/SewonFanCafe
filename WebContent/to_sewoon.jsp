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
    		String request_page = request.getParameter("page");
    		int current_page = Integer.parseInt(request_page);
    	
    		// 변수
    		int total_posts = 0;
    	
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
	    	
	    	// 총 페이지 구하기
    		try {
    			SQL = "SELECT count(*) count FROM to_sewoon;";
    			pstmt = conn.prepareStatement(SQL);
    			
    			rs = pstmt.executeQuery();
    			rs.next();
    			total_posts = rs.getInt("count");
    		} catch(Exception e) {
    			e.printStackTrace();
    		}
	    	
    		// page 제한
    		if(current_page < 1) {
    			current_page = 1;
    		} else if(current_page > total_posts / 10 + 1) {
    			current_page = total_posts / 10 + 1;
    		}
    	%>
        <form action="write.html" method="post">
            <table width="700" class="to_out_table">
                <tbody>
                    <tr>
                        <td> <div class="login_logo">세운에게</div></td>
                    </tr>
                    <tr height="2" bgcolor="#EF8556">
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table width="700" class="to_inner_table" style="font-size: 0.9em;">
                                <tbody>
                               		<tr>
                                        <th width="50px">번호</th>
                                        <th>제목</th>
                                        <th>글쓴이</th>
                                        <th width="70px">작성일</th>
                                        <th width="50px">조회</th>
                                        <th width="50px">추천</th>
                                    </tr>
                                	<%
                                		SQL = "SELECT * FROM to_sewoon ORDER BY timestamp DESC LIMIT 10 OFFSET " + ((current_page - 1) * 10);
                                		pstmt = conn.prepareStatement(SQL);
                                		
                                		rs = pstmt.executeQuery();
                                		
                                		while(rs.next()){
                                			%>
                                				<tr>
                                					<td>
                                						<%= rs.getString("id") %>
                                					</td>
                                					<td>
                                						<a href="to_sewoon_view.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("title") %></a>
                                					</td>
                                					<td>
                                						<%= rs.getString("nickname") %>
                                					</td>
                                					<td>
                                						<%= rs.getString("timestamp") %>
                                					</td>
                                					<td>
                                						<%= rs.getInt("views") %>
                                					</td>
                                					<td>
                                						추천수
                                					</td>
                                				</tr>
                                			<%
                                		}
                                	
                                	%>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                    	
                    
                        <td style="text-align:left">
                            <input type="submit" value="글쓰기" class="to_write">
                            
                            <%
                            	if(total_posts/10 > 5) {
                           	%>
                            		<span class="page_span">
                            			<a href="to_sewoon.jsp?page=<%= current_page - 10 %>" class="back_or_next">◀ 이전</a>
                            			<%
                            				for(int i=(current_page / 10) * 10; i < ((current_page / 10) * 10) + 10; i++) {
                            					if(i == current_page) {
                            						%>
													<span class="to_page"><a href="to_sewoon.jsp?page=<%= i %>"><font color="#EF8556"><%= i %></font></a></span>
													<%
                            					} else if(i == total_posts / 10 + 1) {
                            						break;
                            					} else {
													%>
														<span class="to_page"><a href="to_sewoon.jsp?page=<%= i %>"><%= i %></a></span>
													<%	
												}
                            				}
                            			%>
                            			<a href="to_sewoon.jsp?page=<%= current_page + 10 %>" class="back_or_next">다음 ▶</a>
                            		</span>			
                            <%
                            	} else {
                            %>
                            		<span class="page_span">
										<a href="to_sewoon.jsp?page=<%= current_page - 1 %>" class="back_or_next">◀ 이전</a>
										<%
											for(int i=1; i<=total_posts/10 + 1; i++){
												if(i == current_page){
													%>
													<span class="to_page"><a href="to_sewoon.jsp?page=<%= i %>"><font color="#EF8556"><%= i %></font></a></span>
													<%	
												} else {
													%>
														<span class="to_page"><a href="to_sewoon.jsp?page=<%= i %>"><%= i %></a></span>
													<%	
												}
											}
										%>							
										<a href="to_sewoon.jsp?page=<%= current_page + 1 %>" class="back_or_next">다음 ▶</a>
                            		</span>
                            <%
                            	}
                            %>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>