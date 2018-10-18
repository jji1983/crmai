<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>회원가입</title>
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

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a><b>AI 캠페인</b><br>Assistant플랫폼</a>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">AI CAP 회원가입</p>

    
     <div class="form-group has-feedback">
       <input id="ADM_ID" name="ADM_ID" type="text" class="form-control" placeholder="ID">
       <span class="glyphicon glyphicon-user form-control-feedback"></span>
     </div>
     
     <div class="form-group has-feedback">
       <input id="ADM_NAME" name="ADM_NAME" type="text" class="form-control" placeholder="NAME">
       <span class="glyphicon glyphicon-user form-control-feedback"></span>
     </div>

     <div class="form-group has-feedback">
       <input id="ADM_EMAIL" name="ADM_EMAIL" type="email" class="form-control" placeholder="Email">
       <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
     </div>
     <div class="form-group has-feedback">
       <input id="ADM_PW" name="ADM_PW" type="password" class="form-control" placeholder="Password">
       <span class="glyphicon glyphicon-lock form-control-feedback"></span>
     </div>
     <div class="form-group has-feedback">
       <input id="ADM_PW_R" name="ADM_PW_R" type="password" class="form-control" placeholder="Retype password">
       <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
     </div>
     
	 <div class="form-group has-feedback">
	   <label for="cam_type">가입자 산업유형</label><select id="ADM_TYPE" class="form-control select2" style="width: 100%;">
			<option value="0" selected="selected">기타</option>
			<option value="1">통신</option>
			<option value="2">금융</option>
			<option value="3">유통</option>
			<option value="0">기타</option>
	   </select>
	 </div>
     
     <div class="row">
       <div class="col-xs-8">
         
       </div>
       <!-- /.col -->
       <div class="col-xs-4">
         <button onclick="register_check();" class="btn btn-primary btn-block btn-flat">Register</button>
       </div>
       <!-- /.col -->
     </div>
    

    <a href="login" class="text-center">I already have a membership</a>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 3 -->
<script src="/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/resources/plugins/iCheck/icheck.min.js"></script>
<script>

function register_check(){
	
	if($('#ADM_ID').val() == '' || $('#ADM_NAME').val() == '' || $('#ADM_PW').val() == ''){
		alert("ID/PW/NAME/ 은 필수 입니다.");
		return;
	}
	
	if($('#ADM_PW').val() != $('#ADM_PW_R').val()){
		alert("비밀번호가 일치 하지 않습니다.!");
		return;
	}
	
	var admin = new Object();
	admin.ADM_ID = $('#ADM_ID').val();
	admin.ADM_NAME = $('#ADM_NAME').val();
	admin.ADM_EMAIL = $('#ADM_EMAIL').val();
	admin.ADM_PW = $('#ADM_PW').val();
	admin.ADM_TYPE = $('#ADM_TYPE').val();

    $.ajax({
        type    : 'GET', // method
        url     : '/admin/register_check',
        //url       : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
        async   : 'true', // true
        data    : admin, // GET 요청은 지원되지 않습니다.
        processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
        contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
        success : function(data, status, xhr){
        	
        	//alert("data :: " + data);
        	if(data == "success"){
        		//alert("Login1 :: " + data[0]);
        		alert("등록에 성공 하였습니다. 로그인 하십시요.~!");
        		
        		location.href="login";
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
</script>
</body>
</html>
