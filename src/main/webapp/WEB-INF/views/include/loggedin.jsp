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
<%=request.getAttribute("name") %> �� ȯ���մϴ� 
<button onclick="location.href='logout'">�α׾ƿ�</button>
<button onclick="location.href='myinfo'">�� ����</button>
</div> 
</body>
</html>