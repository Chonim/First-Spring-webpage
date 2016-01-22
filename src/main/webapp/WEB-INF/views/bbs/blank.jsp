<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function write() {
	location.href("../list");
}

function del() {
	location.href("../list");
}
</script>
</head>
<body>
<c:choose>
  <c:when test="${type eq 'write'}">
     <script> write() </script>
  </c:when>
  <c:when test="${type eq 'deletemember'}">
     <script> location.href("../admininfo") </script>
  </c:when>
  <c:when test="${type eq 'reply'}">
     <script> location.href("../list") </script>
  </c:when>
  <c:otherwise>
     <script> del() </script>
  </c:otherwise>
</c:choose>
${type} 실행 완료
</body>
</html>