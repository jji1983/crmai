<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Top bar -->
<header class="main-header">
	<!-- Logo -->
	<a href="/main" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini"><b>CRM</b>사업팀</span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>TARGET AI</b></span>
	</a>
	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="push-menu"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a>
		<!-- Navbar Right Menu -->
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- Tasks: style can be found in dropdown.less -->
				<li class="dropdown tasks-menu"><a onclick="getMoviePage();"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-file-movie-o"></i> <span class="label label-danger"></span>
						<label>소개영상</label>
				</a></li>
				<!-- Tasks: style can be found in dropdown.less -->
				<li class="dropdown tasks-menu"><a onclick="getGuidePage();"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-flag-o"></i> <span class="label label-danger"></span>
						<label>사용자 가이드</label>
				</a></li>
				<li class="dropdown tasks-menu"><a onclick="Logout();"
					class="dropdown-toggle" data-toggle="dropdown"> <label>로그아웃</label>
				</a></li>
			</ul>
		</div>
	</nav>
</header>
<script>
	/*function getGuideFile() {
		//window.location = "/file/downloadGuide";
		pageContext.forward("test.html")
	}*/
	function getGuidePage()
	{
		window.open('/guide','newWindow')
	}
	function getMoviePage()
	{
		var nHeight	= 545;
		var nWidth 	= 915;
		var nLeft	= window.screenLeft+665;
		var nTop 	= window.screenTop+335;
		
		window.open('/movie','movie','resizable=yes, width='+nWidth+', height='+nHeight+', left='+nLeft+', top='+nTop+', scrollbars= 0, toolbar=0, menubar=no')
		
	}
	function Logout() {
		var result = confirm("Logout 진행 하시겠습니까? ");
		if (result) {
			window.location.href = "/logout";
		} else {
			result;
		}
	}
</script>