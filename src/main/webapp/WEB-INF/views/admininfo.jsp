<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
			<script>var i=0;</script>
</head>
<body>
	<center>
	<form action="home">
		<table>
			<tr>
				<th>번호</th>
				<th width="40%">아이디</th>
				<th width="40%">이름</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="result" items="${list}">
				<tr>
					<td><script type="text/javascript">i+=1; document.write(i);</script>
					<td>${result.id}</td>
					<td>${result.name}</td>
					<td><a href="deletemember/${result.id}">O</a></td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<input type="submit" value="홈으로">
		</div>
		</form>
	</center>
</body>
</html>