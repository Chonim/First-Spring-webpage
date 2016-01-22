<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
	<form action="../reply/${seq}">
		<table>
			<tr>
				<td>제목 :</td>
				<td>${title}</td>
			</tr>
			<tr>
				<td>글쓴이 :</td>
				<td>${name}</td>
			</tr>
			<tr>
				<td>내용 :</td>
				<td>${contents}</td>
			</tr>
		</table>
		<div>
			<c:choose>
			<c:when test="${name eq sessionname}">
			<input type="submit" value="수정하기" onclick="form.action='../modify/${seq}'">
			</c:when>
			</c:choose>
			<input type="submit" value="답글">
			<input type="submit" value="목록으로" onclick="form.action='../list'">
		</div>
		</form>
	</center>
</body>
</html>