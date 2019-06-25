<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="./include/commonJs.jsp" />
<title>소개영상</title>
<style type="text/css">
body {
	background-color:#3c8dbc;
}
</style>
</head>
<body>
<video width="900" height="530" controls>
  <source src="/resources/dist/img/movie.mp4" type="video/mp4"/>
  Your browser does not support the video tag.
</video>
</body>
</html>