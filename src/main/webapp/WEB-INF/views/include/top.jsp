<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
	String id = (String)session.getAttribute("id");
	
	// 로그인 되지 않은 상태
	if (id ==null||id.equals("null")) {
		%> <jsp:include page="loggedout.jsp" flush="false" /> <%	
	// 로그인 된 상태
	} else if (id.equals("admin")) {
		%> <jsp:include page="adminloggedin.jsp" flush="false" /> <%		
	} else {
		%> <jsp:include page="loggedin.jsp" flush="false" /> <%		
	}

%>
</body>
</html>