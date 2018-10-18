<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<%
	// 인코딩 처리
	request.setCharacterEncoding("UTF-8"); 
%>
<meta charset="UTF-8">
<title>ADMIN LOGIN</title>

<!-- css 파일 분리 
<link href='/resources/css/join_style.css' rel='stylesheet' style='text/css'/>
-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/resources/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="/resources/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/resources/plugins/iCheck/square/blue.css">
  
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a><b>AI 캠페인</b><br>Assistant플랫폼</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Log-In</p>
      <div class="form-group has-feedback">
        <input id="ADM_ID" name="ADM_ID" type="text" class="form-control" placeholder="아이디">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input id="ADM_PW" name="ADM_PW" type="password" class="form-control" placeholder="비밀번호">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button onclick="login_check();" class="btn btn-primary btn-block btn-flat">로그인</button>
        </div>
        <!-- /.col -->
      </div>
    <!-- <a href="#">비밀번호 찾기</a><br> -->
    <a href="register" class="text-center">회원가입</a>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/resources/plugins/iCheck/icheck.min.js"></script>
<script>

$(document).ready(function(){
	 
    $('#ADM_PW').keydown(function (key) {
 
        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
        	login_check();
        }
 
    });
     
});


var _response = $('#msg');
function login_check(){
	var _response = $('#msg');
	var admin = new Object();
	admin.ADM_ID = $('#ADM_ID').val();
	admin.ADM_PW = $('#ADM_PW').val();

    $.ajax({
        type    : 'GET', // method
        url     : '/admin/login_proc',
        //url       : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
        async   : 'true', // true
        data    : admin, // GET 요청은 지원되지 않습니다.
        processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
        contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
        cache: false,
        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
        success : function(data, status, xhr){
        	
        	//alert("data :: " + data);
        	if(data == "success"){
        		//alert("Login1 :: " + data[0]);
        		
        		location.href="main";
        	}else{
        		alert(data[0]);
        	}
        },
        error   : function(request,status,error){
        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	 
        	 responseError(error);
        	 
        	 $('#msg').html(error);
        }
	});
}
// 회원가입 버튼 클릭시 회원가입 화면으로 이동
function goJoinForm() {
	location.href="JoinForm.jsp";
}	

function convertJson(data){
	return JSON.stringify(data, true, 2);
}

function responseJson(data){
	_response.html(convertJson(data));
}

function responseError(data){
	_response.html(data.responseText);
}
</script>

</body>
<p></p>

</body>
</html>