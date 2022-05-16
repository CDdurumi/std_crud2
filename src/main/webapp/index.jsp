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
	<div class=container>
		<div class="row">
			<h2>학생관리 메뉴</h2>
		</div>
		<div calss="row">
			<button id="insert">신규 정보 입력</button>
		</div>
		<div calss="row">
			<button id="selectAll">학생 정보 출력</button>
		</div>
		<div calss="row">
			<button id="delete">학생 정보 삭제</button>
		</div>
		<div calss="row">
			<button id="modify">학생 정보 수정</button>
		</div>
		<div calss="row">
			<button id="search">학생 정보 검색</button>
		</div>
	</div>
	
	<script>
			$("#insert").on("click",function(){
				location.href="insert.jsp";
			})

			$("#selectAll").on("click",function(){location.href="ListServlet";})
			
			$("#delete").on("click",function(){
				location.href="deleteServlet";
			})
			
			$("#modify").on("click",function(){
				location.href="modify_list_Servlet";
			})
			
			$("#search").on("click",function(){
				location.href="search.jsp";
			})
// 			$("#search").on("click",function(){
// 				location.href="search.jsp?name=";
// 			})
		</script>
</body>
</html>