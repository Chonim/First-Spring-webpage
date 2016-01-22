<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="right">
<%=request.getAttribute("name") %> 님 환영합니다 
<button onclick="location.href='logout'">로그아웃</button>
<button onclick="location.href='myinfo'">내 정보</button>
</div> 
</body>
</html>