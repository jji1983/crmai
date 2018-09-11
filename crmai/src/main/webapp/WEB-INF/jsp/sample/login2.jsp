<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%
	// 인코딩 처리
	request.setCharacterEncoding("UTF-8"); 
%>
<meta charset="UTF-8">
<title>ADMIN LOGIN</title>

<!-- css 파일 분리 -->
<link href='/resources/css/join_style.css' rel='stylesheet' style='text/css'/>

<!-- jQuery -->

<script src="http://code.jquery.com/jquery-1.12.0.js"></script>


<script type="text/javascript">
$(document).ready(function() {

    $('#btnLogin').click(function() {
      var action = $('#frmLogin').attr("action");
      var form_data = {
    		  ADM_ID: $('#ADM_ID').val(),
    		  ADM_PW: $('#ADM_PW').val()
      };
      $.ajax({
                type: "GET",
                url: action,
                data: form_data,
                success: function(response) {
                	
                	alert("AJAX Success!");
                	
                   	console.log(response);
                   	console.log(response.status);
                   	console.log(response.message);
                   	console.log(response.errorMessage);
                   	console.log(response.errorCode);
                	  
                    sessionStorage.setItem("ADM_ID", form_data.ADM_ID);
                    $('#msg').html("<p style='color:green; font-weight:bold'>로그인 성공!</p>");
                 
                   // $('#msg').html("<p style='color:red'>아이디 또는 비밀번호가 잘못되었습니다.</p>");
                  
                },
                error: function() {
                  $('#msg').html("<h2>Error</h2>");
                }
      });
    });
  });

  // 회원가입 버튼 클릭시 회원가입 화면으로 이동
  function goJoinForm() {
	location.href="JoinForm.jsp";
  }	
</script>
</head>
<body>
<div id="wrap">
		<form id="frmLogin" name="frmLogin" method="post" action="/admin/login_proc" >
			<!-- 이미지 추가 -->
			<img src="/resources/img/welcome.png">
			<br><br>
			
			<table>
				<tr>
					<td bgcolor="skyblue">아이디</td>
					<td><input type="text" id="ADM_ID" name="ADM_ID" placeholder="아이디" /></td>
				</tr>
				<tr>
					<td bgcolor="skyblue">비밀번호</td>
					<td><input type="password" id="ADM_PW" name="ADM_PW" placeholder="패스워드" /></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="로그인"/>
			<input type="button" value="회원가입" onclick="goJoinForm()" />
		
		</form>
		<div id="msg"></div>
	</div>	
</body>
</html>