<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	<%-- function login(form) {
		var id = form.id.value;
		var pw = form.pw.value;
		
		if (id == "f" && pw === "f") {
			alert("로그인 성공");
			<% String id=null; session.setAttribute("id", (String)id); %>
		} else {
			alert("로그인 실패");
		}
	} --%>
</script>
</head>
<body>
	<div class="loggedout" align="right">
		<form action="logincheck">
			ID: <input id="id" name="id" type="text"> PW: <input name="pw" id="pw"
				type="password"> <input type="submit" value="로그인"
				onmouseup="logincheck"> <input type="submit" value="회원가입"
				onclick="form.action='join';">
		</form>
	</div>
</body>
</html>