<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function goBack() {
		window.history.back();
	}
</script>
</head>
<body>
	<center>
		회원가입
		<div>
			<form action="join_check">
				<table border="0">
					<tr>
						<td>ID :</td>
						<td><input type="text" name="id"></td>
					</tr>
					<tr>
						<td>PW :</td>
						<td><input type="password" name="pw"></td>
					</tr>
					<tr>
						<td>생년월일 :</td>
						<td><input type="text" name="birthday"></td>
					</tr>
					<tr>
						<td>이메일주소 :</td>
						<td><input type="text" name="email"></td>
					</tr>
					<tr>
						<td>이름 :</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td>나이 :</td>
						<td><input type="text" name="age"></td>
					</tr>
					<tr>
						<td>전화번호 :</td>
						<td><input type="text" name="phone"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="submit" value="확인">
						<input type="submit" value="취소"
							onclick="form.action='home'">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</center>
</body>
</html>