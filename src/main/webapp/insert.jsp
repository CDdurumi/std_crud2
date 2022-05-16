<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
</head>
<body>
	<form action="/insert.std">
		<table border=1 align=center>
			<tr>
				<th>New Student
			</tr>
			<tr>
				<td><input type=text name="name" placeholder="Student Name" required>
			</tr>
			<tr>
				<td><input type=text name="kor" placeholder="Korean score" required>
			</tr>
			<tr>
				<td><input type=text name="eng" placeholder="English score" required>
			</tr>
			<tr>
				<td><input type=text name="math" placeholder="Math score" required>
			</tr>
			<tr>
				<td><button id="add">Add</button><button id="back" type=button>back</button>
			</tr>
		</table>
	</form>
	<script>
		$("#back").on("click",function(){
			location.href="index.jsp";
		})
	</script>
</body>
</html>