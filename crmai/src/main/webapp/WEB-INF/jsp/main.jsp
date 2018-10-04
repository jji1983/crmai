<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<%
	// 인코딩 처리
	request.setCharacterEncoding("UTF-8"); 

	if (session.getAttribute("sessionID") == null) // 로그인이 안되었을 때
	{
		// 로그인 화면으로 이동
		response.sendRedirect("/login");
	}
	
	if(session.getAttribute("sessionROLE") == null){
		session.setAttribute("sessionROLE", "1");
	}
	
	//out.println("sessionID :: " + session.getAttribute("sessionID"));
	//out.println("sessionROLE :: " + session.getAttribute("sessionROLE"));
%>

<meta charset="UTF-8">
<title>AI 캠페인 Assistant 플랫폼</title>

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
 <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
 <link rel="stylesheet" href="/resources/dist/css/skins/_all-skins.min.css">
 <!-- Morris chart -->
 <link rel="stylesheet" href="/resources/bower_components/morris.js/morris.css">
 <!-- jvectormap -->
 <link rel="stylesheet" href="/resources/bower_components/jvectormap/jquery-jvectormap.css">
 <!-- Date Picker -->
 <link rel="stylesheet" href="/resources/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
 <!-- Daterange picker -->
 <link rel="stylesheet" href="/resources/bower_components/bootstrap-daterangepicker/daterangepicker.css">
 <!-- bootstrap wysihtml5 - text editor -->
 <link rel="stylesheet" href="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  
  <script type="text/javascript">
	var sessionName;
  
  	function Content_Dashboard() {
		//alert("call Content_Dashboard!!");
		document.getElementById("main_frame").src = "/iframe/Dashboard";
	}
	
	function Content_AutoOrder() {
		//alert("call Content_AutoOrder!!");
		document.getElementById("main_frame").src = "/iframe/AutoOrder";
	}
	
	function Content_Pretreatment() {
		//alert("call Content_Pretreatment!!");
		document.getElementById("main_frame").src = "/iframe/Pretreatment";
	}
	
	function Content_PretreatmentResult() {
		//alert("call Content_PretreatmentResult!!");
		document.getElementById("main_frame").src = "/iframe/PretreatmentResult";
	}
	function Content_Learning() {
		//alert("call Content_Learning!!");
		document.getElementById("main_frame").src = "/iframe/Learning";
	}
  
	function Content_RunForecast() {
		//alert("call Content_Learning!!");
		document.getElementById("main_frame").src = "/iframe/RunForecast";
	}
	
	function Content_RunForecastResult() {
		//alert("call Content_RunForecastResult!!");
		document.getElementById("main_frame").src = "/iframe/RunForecastResult";
		$("input[name='session_name']").val("${sessionNAME}");
	}
	
	function Content_Statistics_m1() {
		//alert("call Content_Statistics!!");
		document.getElementById("main_frame").src = "/iframe/Statistics_m1";
		$("input[name='session_name']").val("${sessionNAME}");
	}
	
	function Content_Statistics_m2() {
		//alert("call Content_Statistics!!");
		document.getElementById("main_frame").src = "/iframe/Statistics_m2";
		$("input[name='session_name']").val("${sessionNAME}");
	}
	
	function Content_Statistics_m3() {
		//alert("call Content_Statistics!!");
		document.getElementById("main_frame").src = "/iframe/Statistics_m3";
		$("input[name='session_name']").val("${sessionNAME}");
	}
	
	function Content_NoticeBoard() {
		//alert("call Content_NoticeBoard!!");
		document.getElementById("main_frame").src = "/iframe/NoticeBoard";
	}
	
	function Content_NoticeMgr() {
		//alert("call Content_NoticeBoard!!");
		document.getElementById("main_frame").src = "/iframe/admin/NoticeMgr";
	}
	
	function Content_UserMgr() {
		//alert("call Content_NoticeBoard!!");
		document.getElementById("main_frame").src = "/iframe/admin/UserMgr";
	}
	
  </script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
 <div class="wrapper">

	<!-- Top bar -->
	<header class="main-header">
    <!-- Logo -->
    <a href="/main" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>CRM</b>운영팀</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>AI Assistant</b>플랫폼</span>
    </a>
    
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
      	<ul class="nav navbar-nav">
      	<!-- Tasks: style can be found in dropdown.less -->
          <li class="dropdown tasks-menu">
            <a onclick="getGuideFile();" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger">1</span>
              <label>사용자 가이드</label> 
            </a>
          </li>
      	</ul>
      </div>
    </nav>
  </header>

  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><%=session.getAttribute("sessionNAME")%>님 환영 합니다.</p>
          <a href="#"><i class="fa fa-circle text-success"></i>Online</a>
        </div>
      </div>
    
     <!-- sidebar menu: : style can be found in sidebar.less -->
     <ul class="sidebar-menu" data-widget="tree">
        
        <li class="header">MAIN</li>
		<li><a href="javascript:Content_Dashboard();"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
        
        <li class="header">자동 수행</li>
        <li><a href="javascript:Content_AutoOrder();"><i class="fa fa-circle-o text-aqua"></i> <span>AI 자동수행</span></a></li>
        
        <li class="header">수동 수행</li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-laptop"></i> <span>AI 캠페인 대상자  학습</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li  class="active"><a  href="javascript:Content_Pretreatment();"><i class="fa fa-circle-o"></i>대상자 로딩</a></li>
          </ul>
        </li>
        
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-laptop"></i> <span>AI 학습 결과 확인</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li  class="active"><a href="javascript:Content_PretreatmentResult();"><i class="fa fa-circle-o"></i>전처리 결과</a></li>
            <li  class="active"><a href="javascript:Content_Learning();"><i class="fa fa-circle-o"></i>AI학습 결과</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-laptop"></i> <span>AI 캠페인 대상자 선정</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li  class="active"><a href="javascript:Content_RunForecast();"><i class="fa fa-circle-o"></i>AI 대상자 로딩</a></li>
          </ul>
        </li>
        
        <li class="header">부가 기능</li>
        <li><a href="javascript:Content_RunForecastResult();"><i class="fa fa-circle-o text-aqua"></i> <span>AI 선정결과</span></a></li>   
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-pie-chart"></i> <span>통계</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li  class="active"><a href="javascript:Content_Statistics_m1();"><i class="fa fa-circle-o"></i>선정대상에 대한 실질반응1</a></li>
          	<li  class="active"><a href="javascript:Content_Statistics_m2();"><i class="fa fa-circle-o"></i>선정대상에 대한 실질반응2</a></li>
          	<li  class="active"><a href="javascript:Content_Statistics_m3();"><i class="fa fa-circle-o"></i>선정대상에 대한 실질반응3</a></li>
          </ul>
        </li>
        
		<li><a href="javascript:Content_NoticeBoard();"><i class="fa fa-book"></i> <span>게시판(Q&amp;A)</span></a></li>
        
        <% if(session.getAttribute("sessionROLE").equals("0")){ %>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-share"></i> <span>관리자 기능</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li  class="active"><a href="javascript:Content_NoticeMgr();"><i class="fa fa-circle-o"></i>공지사항 관리</a></li>
            <li  class="active"><a href="javascript:Content_UserMgr();"><i class="fa fa-circle-o"></i>계정 관리</a></li>
          </ul>
          <%} %>
        </li>
        
        
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">

    
    <!-- Main content -->
    <section class="content">
	    <iframe  id="main_frame" src="/iframe/Dashboard" width="100%" height="80%"></iframe>
    </section>
     <!-- /.Main content -->
    
    
    <!-- /.content -->
    
  </div>
  <!-- /.content-wrapper -->
  
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 0.0.1
    </div>
    <strong>Copyright &copy; 2018 <a href="http://www.ktds.com">CRM운영팀 AI학습체</a>.</strong> All rights
    reserved.
  </footer>
  
  
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
 
</div>
<!-- ./wrapper -->

<input name="session_name" type="hidden">

<!-- jQuery 3 -->
<script src="/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/resources/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="/resources/bower_components/raphael/raphael.min.js"></script>
<script src="/resources/bower_components/morris.js/morris.min.js"></script>
<!-- Sparkline -->
<script src="/resources/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="/resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="/resources/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="/resources/bower_components/moment/min/moment.min.js"></script>
<script src="/resources/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="/resources/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="/resources/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/resources/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/dist/js/demo.js"></script>
<script>
	function getGuideFile(){
	
		alert("getGuideFile ~~!! ");
		var campaign = new Object();
	    $.ajax({
	        type: 'GET',
	        url: '/file/downloadGuide',
	        dataType: 'json',
	        contentType: 'application/json;charset=UTF-8',
	        data: campaign,
	        success: function (data) {
	        	
	        	
	            window.open(data.fileUrl);
	            // or window.location.href = data.fileUrl;
	        },
	        error:function (xhr, ajaxOptions, thrownError) {
	            console.log("in error");
	     } 
		});
	}

</script>
</body>
</html>