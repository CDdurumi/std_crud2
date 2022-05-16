<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Index Page</title>

<style>
* {
	box-sizing: border-box;
}

.container{
	width: 400px;
	height: 400px;
	border: 1px solid black;
	text-align: center;
}
button{
	width:150px;
	height:50px;
	margin-top : 10px;
}

</style>
</head>
<body>
	<form action="/delete.std">
	<div class=container>
		<div class="row">
			<h2>학생 정보 삭제</h2>
		</div>
		<div class="row">
			<div class="col-12"><input type ="text" placeholder="학번을 입력하세요" name="sid"></div>			
		</div>
		<div class="row">
			<div class="col-12"><button>삭제하기</button></div>
		</div>
		<div class="row">
			<a href="index.jsp"><button type="button">뒤로가기</button></a>
		</div>
		
	</div>
	</form>
</body>
</html>