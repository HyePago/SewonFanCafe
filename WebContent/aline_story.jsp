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
                </tbody>
            </table>
        </form>
    </body>
</html>