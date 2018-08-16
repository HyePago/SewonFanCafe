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
    	<%
    		String SQL = null;
    		String request_page = request.getParameter("page");
    		int current_page = Integer.parseInt(request_page);
    		
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
    			SQL = "SELECT count(*) count FROM notice;";
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
        <form action="notice/insert.html" id="myForm" class= "myForm" name="myForm" method="post">
            <table width="700px" class="notice_out_table">
                <tbody>
                    <tr>
                        <td> <div class="notice_logo">통합 공지 관리</div></td>
                    </tr>
                    <tr height="2" bgcolor="#EF8556">
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <table class="notice_inner_table">
                                <tbody>
                                    <tr>
                                        <th width="150px">작성자</th>
                                        <th width="700px">제목</th>
                                        <th width="100px">삭제</th>
                                    </tr>
                                    <%
                                    	try {
                                    		SQL = "SELECT * FROM notice ORDER BY timestamp DESC LIMIT 10 OFFSET " + ((current_page - 1) * 10);
                                    		pstmt = conn.prepareStatement(SQL);
                                    		
                                    		rs = pstmt.executeQuery();
                                    		
                                    		while(rs.next()){
                                    			%>
                                    			<tr>
                                    				<td> 운영자 </td>
                                    				<td><a href="notice_view.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("title") %></a></td>
                                    				<%
                                    					String r_id = rs.getString("id");
                                    				%>
                                    				<td><input type="button" value="삭제" class="notice_submit" onclick="javascript:delete_user('<%= r_id %>')"></td>
                                    			</tr>
                                    			<%
                                    		}
                                    	} catch(Exception e){
                                    		e.printStackTrace();
                                    	}
                                    %>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:left">
                            <%
                            	if(total_posts/10 > 5) {
                           	%>
                            		<span class="page_span">
                            			<a href="notice.jsp?page=<%= current_page - 10 %>" class="back_or_next">◀ 이전</a>
                            			<%
                            				for(int i=(current_page / 10) * 10; i < ((current_page / 10) * 10) + 10; i++) {
                            					if(i == current_page) {
                            						%>
													<span class="to_page"><a href="notice.jsp?page=<%= i %>"><font color="#EF8556"><%= i %></font></a></span>
													<%
                            					} else if(i == total_posts / 10 + 1) {
                            						break;
                            					} else {
													%>
														<span class="to_page"><a href="notice.jsp?page=<%= i %>"><%= i %></a></span>
													<%	
												}
                            				}
                            			%>
                            			<a href="notice.jsp?page=<%= current_page + 10 %>" class="back_or_next">다음 ▶</a>
                            		</span>			
                            <%
                            	} else {
                            %>
                            		<span class="page_span">
										<a href="notice.jsp?page=<%= current_page - 1 %>" class="back_or_next">◀ 이전</a>
										<%
											for(int i=1; i<=total_posts/10 + 1; i++){
												if(i == current_page){
													%>
													<span class="to_page"><a href="notice.jsp?page=<%= i %>"><font color="#EF8556"><%= i %></font></a></span>
													<%	
												} else {
													%>
														<span class="to_page"><a href="notice.jsp?page=<%= i %>"><%= i %></a></span>
													<%	
												}
											}
										%>							
										<a href="notice.jsp?page=<%= current_page + 1 %>" class="back_or_next">다음 ▶</a>
                            		</span>
                            <%
                            	}
                            %>
                        </td>
                    </tr>
                    <tr style="text-align:center;">
                        <td>
                            <select name="find_select">
                                <option value="1">제목</option>
                                <option value="2">내용</option>
                            </select>
                            <input type="text" name="find_text">
                            <input type="button" value="검색" class="notice_submit" onclick="javascript:find_click()">
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="글쓰기" class="notice_submit"></td>
                    </tr>
                </tbody>
            </table>
        </form>
        <script>
	    	function delete_user(id) {
	    		location.href = "notice/delete.jsp?id="+id;
	    	}
			function find_click() {
				document.myForm.action = "notice/find.jsp?page=1";
				document.myForm.submit();
			}
	        </script>
	    </script>
    </body>
</html>