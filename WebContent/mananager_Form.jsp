<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    		// 매니저 아이디와 비밀번호 확인
    		String username = request.getParameter("username");
    		String password = request.getParameter("password");
    		
    		if(!(username.equals("hyejin") && password.endsWith("1234"))){
    			out.print("<script>history.go(-1);</script>");
    		}
    	%>
        <form action="mananager_Form.html" method="post">
            <table width="700" class="login_out_table">
                <tbody>
                    <tr>
                        <td> <div class="login_logo">MANAGER MENU</div></td>
                    </tr>
                    <tr height="2" bgcolor="#EF8556">
                        <td></td>
                    </tr>
                    <tr style="text-align: center;">
                        <td colspan="2" class="login_blank">
                            <table width="700" class="manager_Form_inner_table" align="center">
                                <tbody>
                                    <tr>
                                        <td><a href="manager/user.jsp" class="mamanger_Form_a">회원관리</td>
                                    </tr>
                                    <tr>
                                        <td><a href="manager/notice.jsp" class="mamanger_Form_a">통합공지 관리</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>