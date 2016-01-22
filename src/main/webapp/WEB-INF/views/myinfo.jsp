<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<form action="home">
			<table>
				<tr>
					<td>ID</td>
					<td><%=request.getAttribute("id")%></td>
				</tr>
				<tr>
					<td>pw</td>
					<td><%=request.getAttribute("pw")%></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><%=request.getAttribute("birthday")%></td>
				</tr>
				<tr>
					<td>이메일주소</td>
					<td><%=request.getAttribute("email")%></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><%=request.getAttribute("name")%></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><%=request.getAttribute("age")%></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><%=request.getAttribute("phone")%></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="확인"></td>
			</table>
		</form>
	</center>
</body>
</html>