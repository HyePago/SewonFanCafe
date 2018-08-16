<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="schedule/view.jsp">
		<select name="year">
			<option value="2018">2018</option>
		</select>
		<select name="month">
			<option value="1">1월</option>
			<option value="2">2월</option>
			<option value="3">3월</option>
			<option value="4">4월</option>
			<option value="5">5월</option>
			<option value="6">6월</option>
			<option value="7">7월</option>
			<option value="8">8월</option>
			<option value="9">9월</option>
			<option value="10">10월</option>
			<option value="11">11월</option>
			<option value="12">12월</option>
		</select>
		<br>
		<input type="submit" value="보기">
	</form>
	
	<form action="schedule/insert.html">
		<input type="button" value="추가" />
	</form>
</body>
</html>