<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%
	if (session.getAttribute("sessionID") == null) {
		// 로그인 화면으로 이동
		response.sendRedirect("/login");
	}

	if (session.getAttribute("sessionROLE") == null) {
		session.setAttribute("sessionROLE", "1");
	}
%>
<meta charset="UTF-8">
<title>TARGET AI</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="./include/commonCss.jsp" />
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- Top bar -->
		<jsp:include page="./include/00_topBar.jsp"/>
		<!-- Side Bar -->
		<jsp:include page="./include/20_sideBar.jsp"/>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="height: '80%';">
			<!-- Main content -->
			<section class="content">
				
			</section>
			<!-- /.Main content -->
			<!-- /.content -->
		</div>
		<!-- Footer -->
		<jsp:include page="./include/90_footer.jsp"/>
	</div>
	<!-- ./wrapper -->
	<!-- 세션에서 로그인 사용자를 생성자 텍스트에 입력하려면 이 것을 사용해야 함 -->
	<input name="session_name" type="hidden">
	<jsp:include page="./include/commonJs.jsp" />
</body>
</html>