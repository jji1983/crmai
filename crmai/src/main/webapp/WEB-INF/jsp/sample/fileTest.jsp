<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
   function fileSubmit() {
	   
	   alert('1');
       var formData = new FormData($("#fileForm")[0]);
       $.ajax({
           type : 'post',
           url : 'fileUpload',
           data : formData,
           processData : false,
           contentType : false,
           success : function(html) {
               alert("파일 업로드하였습니다.");
           },
           error : function(error) {
               alert("파일 업로드에 실패하였습니다.");
               console.log(error);
               console.log(error.status);
           }
       });
   }
</script>
</head>
<body>

    <form id="fileForm" action="/sample/fileUpload" method="post" enctype="multipart/form-data">
        <input type="file" id="fileUp" name="fileUp"/><br/><br/>
        <input type="file" id="fileUp2" name="fileUp2"/><br/><br/>
          
	        아이디 : <input type="text" name="id" />
	        비밀번호 : <input type="password" name="pw" /><br/><br/>
        <input type="button" value="전송하기" onClick="fileSubmit();">
    </form>
	
</body>

</html>