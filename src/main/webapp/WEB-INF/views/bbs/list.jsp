<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <link rel="stylesheet" href="style.css"> -->
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
	<center>
		<hr width='600' size='2' noshade>
		<h2>�Խ���</h2>
		<a href='write'><button>�۾���</button></a> &nbsp;&nbsp;&nbsp; <a
			href='../home'><button>ó��ȭ��</button></a>
		<hr width='600' size='2' noshade>
		<br /> <br />

		<div class="container">
		<table width='700' border='1' class="table table-striped">
		<thead>
			<tr>
				<th width='10%'>��ȣ</th>
				<th width='20%'>�۾���</th>
				<th width='30%'>�� ����</th>
				<th width='15%'>��¥</th>
				<th width='10%'>����</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="result" items="${list}" varStatus="index">
				<tr class="contents">
					<td align='center'>${result.seq}</td>
					<td align='center'>${result.name}</td>
					<td align='center'><a href="contents/${result.seq}">${result.title}</a></td>
					<td align='center'>${result.day}</td>
					<td align='center'><a href="delete/${result.seq}">${result.isDeletable}</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
		<div class="searchbox"><form action="search">
			�Խñ� �˻� <input name="keyword" type="text"><input type="submit" value="�˻�" /></form>
		</div>

	</center>
</body>
</html>