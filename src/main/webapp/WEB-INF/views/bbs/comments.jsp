<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <link rel="stylesheet" href="style.css"> -->
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<table width='700' border='1'>
			<tr>
				<th width='10%'>번호</th>
				<th width='20%'>글쓴이</th>
				<th width='30%'>내용</th>
				<th width='15%'>날짜</th>
				<th width='10%'>삭제</th>
			</tr>
			<c:forEach var="result" items="${list}" varStatus="index">
				<tr class="contents">
					<td align='center'>${result.seq}</td>
					<td align='center'>${result.name}</td>
					<td align='center'>${result.comments}</td>
					<td align='center'>${result.day}</td>
					<td align='center'><a href="delete/${result.seq}">${result.isDeletable}</a></td>
				</tr>
				<tr class="write">
					<td colspan="4"><input type="text" width="100px" height="20px" />
					<td><a href=>댓글 남기기</a></td>
				</tr>
			</c:forEach>
		</table>
	</center>
</body>
</html>