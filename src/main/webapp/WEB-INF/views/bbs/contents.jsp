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
				<td>���� :</td>
				<td>${title}</td>
			</tr>
			<tr>
				<td>�۾��� :</td>
				<td>${name}</td>
			</tr>
			<tr>
				<td>���� :</td>
				<td>${contents}</td>
			</tr>
		</table>
		<div>
			<c:choose>
			<c:when test="${name eq sessionname}">
			<input type="submit" value="�����ϱ�" onclick="form.action='../modify/${seq}'">
			</c:when>
			</c:choose>
			<input type="submit" value="���">
			<input type="submit" value="�������" onclick="form.action='../list'">
		</div>
		</form>
	</center>
</body>
</html>