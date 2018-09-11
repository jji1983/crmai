<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		1. 전송하고자 하는 입력 폼을 <form>과 </form>사이에 위치해놓는다. 
		2. action 값은 데이터를 전송받아서 처리할 Controller url로 설정한다. 
		3. method를 반드시 post로 설정해준다. get으로 설정시 parameter들이 url에 따라간다. 
		4. enctype을 multipart/form-data로 설정한다. 
		5. <form>과 </form>사이에 input type submit버튼을 위치시킨다. 
	-->
	<form action="/file/fileUpload" id="fileUpload" name="fileUpload"
		method="post" enctype="multipart/form-data">
		이름 : <input type="text" name="name" id="cmd" value="namevla"><br>
		파일 : <input type="file" name="file"><br> <input
			type="submit" name="업로드" value="제출"><br>
	</form>
</body>

</html>