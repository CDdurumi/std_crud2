<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<table border=1 align=center>

		<tr>
			<th colspan=9 align=center>Student Information
		</tr>

		<tr>
			<th>RANK
			<th>SID
			<th>NAME
			<th>KOR
			<th>ENG
			<th>MATH
			<th>EXAM_DATE
			<th>SUM
			<th>AVG
		</tr>


		<c:choose>
			<c:when test="${!empty list}">
				<c:forEach var="i" items="${list }">
					<tr align=center>
						<td>${i.rank}
						<td>${i.sid}
						<td>${i.name}
						<td>${i.kor}
						<td>${i.eng}
						<td>${i.math}
						<td>${i.exam_date}
						<td>${(i.kor+i.eng+i.math)}
						<td><fmt:formatNumber value="${(i.kor+i.eng+i.math)/3.0 }" pattern=".0"/>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan=9 align="center">학생목록이 존재하지 않습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>


		<tr>
			<td colspan=9 align=center>
				<button id="back">Back</button>
		</tr>

		<script>
			$("#back").on("click", function() {
				location.href = "/index.jsp;"
			})
		</script>

	</table>




</body>