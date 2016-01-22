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
		<form action="write_check/${seq}" id="frm">
			<table border=1>
				<tr>
					<td>이름: <input type="text" name="name" readonly="readonly" value=<%=request.getAttribute("name") %>><br />
					</td>
				</tr>
				<tr>
					<td>제목: <input type="text" name="title"><br />
					</td>
				</tr>
				<tr>
					<td>내용: <textarea name="contents" rows="5"></textarea>
					</td>
				</tr>
			</table>
				<input type="hidden" name="isreply" value="1"/>
			
			<!-- 날짜 -->

			<br /> <input type="submit" value="저장">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="초기화"><br>
		</form>
	</center>
</body>
</html>