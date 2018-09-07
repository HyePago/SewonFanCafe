<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!Doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="Generator" content="VisualStudioCode">
        <meta name="Author" content="HyejinKim">
        <meta name="Keywords" content="sewon">
        <meta name="Description" content="">
        <title>포뇨 나라</title>
        <link rel="stylesheet" href="css/mystyle.css">
    </head>
    <body class="index_body">
        <header class="out_div">
            <div id="main_header">
                <nav>
                    <ul>
                        <li><a href="index.jsp">main</a></li> 
                        <% 
						if(((String)session.getAttribute("id")) == null || ((String)session.getAttribute("id")).equals("")) { %>
                        	<li><a href="join.html" target="main">카페 가입하기</a></li>
                     	<% } else { %>
                        	<li><a href="secession.jsp" target="main">카페 탈퇴하기</a></li>
                        <% 
                     	}
						if(((String)session.getAttribute("id")) == null || ((String)session.getAttribute("id")).equals("")) { %>
                        	<li><a href="login.html" target="main">로그인</a></li>
                     	    <li><a href="sign_up.html" target="main">회원가입</a></li>
                        <% } else { %>
                        	<li><a href="logout.jsp" target="">로그아웃</a></li>
                        <% } %>
                    </ul>
                </nav>
            </div>
        </header>
            
        <section class="main_view_div">
            <aside id="main_left">
                <div class="introduce">
                    <ul>
                        <li>
                            <h3 class="logo"> 포뇨 나라 </h3>
                        </li>
                        <li>
                            <img src="images/profile.jpg" />
                        </li>
                        <li>
                            <table class="introduce_table">
                                <tr class="nickname">
                                    <td colspan="2">
                                        <b>김혜진</b> (공개)
                                    </td>
                                </tr>
                                <tr>
                                    <th>카페지기</th>
                                    <td>김혜진</td>
                                </tr>
                                <tr>
                                    <th>회원수</th>
                                    <td>22,388</td>
                                </tr>
                                <tr>
                                    <th>방문수</th>
                                    <td>1,080</td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="td_btn">
                                        <a href="join.html" target="main" class="join_btn">카페 가입하기</a>
                                    </td>
                                </tr>
                            </table>
                        </li>
                    </ul>
                </div>
                <div class="list">
                        <ul>
                            <li><audio src="file/audio_sewon.mp3" class="main_audio" controls /></li>
                            <li>OFFICIAL SNS</li>
                            <li>
                                <ul>
                                    <li><a href="https://twitter.com/jeongsewoon_twt" target="_blank">Twitter</a></li>
                                    <li><a href="https://www.facebook.com/OfficialJeongSewoon/" target="_blank">Facebook</a></li>
                                    <li><a href="http://channels.vlive.tv/DB347F/video" target="_blank">V Live</a></li>
                                    <li><a href="https://passport.weibo.com/visitor/visitor?entry=miniblog&a=enter&url=https%3A%2F%2Fweibo.com%2Fjeongsewoon&domain=.weibo.com&sudaref=http%3A%2F%2Fcafe.daum.net%2F_c21_%2Fhome%3Fgrpid%3D1XVUf&ua=php-sso_sdk_client-0.6.28&_rand=1524189867.1112"target="_blank">Weibo</a></li>
                                    <li><a href="https://www.youtube.com/channel/UCnT5DqsxopUmAsIqEmrgvUg" target="_blank">Youtube</a></li>
                                    <li><a href="https://www.instagram.com/official_jeongsewoon/" target="_blank">Instagram</a></li>
                                </ul>
                            </li>
                        </ul>
                                <ul>
                                    <li>JEONG SEWOON SNS</li>
                                    <li>
                                        <ul>
                                            <li><a href="https://twitter.com/sewoon_jeong" target="_blank">Twitter</a></li>
                                            <li><a href="https://www.instagram.com/sewoon_j/" target="_blank">Instagram</a></li>
                                        </ul>
                                    </li>
                                </ul>
                        <ul>
                            <li>OFFICIAL</li>
                            <li>
                                <ul>
                                    <li><a href="notice.jsp?page=1" target="main">통합공지</a></li>
                                    <li><a href="schedule.jsp?month=9" target="main">스케줄방</a></li>
                                    <li><a href="broadcast.html" target="main">공방공지</a></li>
                                    <li><a href="official_impormation.html" target="main">공식자료</a></li>
                                    <li><a href="article.html" target="main">기사정보</a></li>
                                    <li><a href="event.html" target="main">이벤트방</a></li>
                                </ul>
                            </li>
                        </ul>
                        <ul>
                            <li>JEONG SEWOON</li>
                            <li>
                                <ul>
                                    <li><a href="aline_story.jsp" target="main">한줄얘기</a></li>
                                    <li><a href="from_sewoon.jsp?page=1" target="main">세운이가</a></li>
                                    <li><a href="to_sewoon.jsp?page=1" target="main">세운에게</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
            </aside>

            <section>
                <article>
                    <iframe name="main" width=100% height=965px style="border: none" src="main.jsp" align="right">
                    </iframe>
                </article>
            </section>
            <footer>
                <br>3209 김혜진 <address> hyepago@gmail.com </address><br>
                <p class="footer_manager">
                    <a href="manager.html" target="main">관리자 페이지</a>
                </p>
            </footer>
        </section>
    </body>
</html>