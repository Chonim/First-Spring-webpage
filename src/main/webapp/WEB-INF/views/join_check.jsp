<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%=request.getAttribute("id") %>
<%=request.getAttribute("pw") %>
<%=request.getAttribute("birthday") %>
<%=request.getAttribute("email") %>
<%=request.getAttribute("name") %>
<%=request.getAttribute("age") %>
<%=request.getAttribute("phone") %>
</body>
</html>