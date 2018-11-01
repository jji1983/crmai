<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<%
					if (session.getAttribute("sessionID").equals("asdf")) {
				%>
				<img src="/resources/dist/img/user8-128x128.jpg" class="img-circle"
					alt="User Image">
				<%
					} else {
				%>
				<img src="/resources/dist/img/user2-160x160.jpg" class="img-circle"
					alt="User Image">
				<%
					}
				%>
			</div>
			<div class="pull-left info">
				<p><%=session.getAttribute("sessionNAME")%>님 환영 합니다.
				</p>
				<a href="#"><i class="fa fa-circle text-success"></i>Online</a>
			</div>
		</div>
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">MAIN</li>
			<li><a href="/iframe/Dashboard"><i
					class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
			<li class="header">자동 수행</li>
			<li><a href="/iframe/AutoOrder"><i
					class="fa fa-circle-o text-aqua"></i> <span>AI 자동수행</span></a></li>
			<li class="header">수동 수행</li>
			<li class="treeview"><a href="#"> <i class="fa fa-laptop"></i>
					<span>AI 학습 등록</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li class="active"><a
						href="/iframe/Pretreatment"><i
							class="fa fa-circle-o"></i>학습데이터 로딩</a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-laptop"></i>
					<span>AI 학습 결과 확인</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li class="active"><a
						href="/iframe/PretreatmentResult"><i
							class="fa fa-circle-o"></i>전처리 결과</a></li>
					<li class="active"><a href="/iframe/Learning"><i
							class="fa fa-circle-o"></i>AI학습 결과</a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-laptop"></i>
					<span>AI 캠페인 대상자 선정</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li class="active"><a href="/iframe/RunForecast"><i
							class="fa fa-circle-o"></i>AI 대상자 로딩</a></li>
				</ul></li>
			<li class="header">부가 기능</li>
			<li><a href="/iframe/RunForecastResult"><i
					class="fa fa-circle-o text-aqua"></i> <span>AI 선정결과</span></a></li>
			<li class="treeview"><a href="#"> <i class="fa fa-pie-chart"></i>
					<span>통계</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li class="active"><a
						href="/iframe/Statistics_m1"><i
							class="fa fa-circle-o"></i>기존캠페인 성공률</a></li>
					<li class="active"><a
						href="/iframe/Statistics_m2"><i
							class="fa fa-circle-o"></i>AI캠페인 예측률</a></li>
					<li class="active"><a
						href="/iframe/Statistics_m3"><i
							class="fa fa-circle-o"></i>AI캠페인 실질반응</a></li>
				</ul></li>
			<li><a href="/iframe/NoticeBoard"><i
					class="fa fa-book"></i> <span>게시판(Q&amp;A)</span></a></li>
			<%
				if (session.getAttribute("sessionROLE").equals("0")) {
			%>
			<li class="treeview"><a href="#"> <i class="fa fa-share"></i>
					<span>관리자 기능</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li class="active"><a href="/iframe/admin/NoticeMgr"><i
							class="fa fa-circle-o"></i>공지사항 관리</a></li>
					<li class="active"><a href="/iframe/admin/UserMgr"><i
							class="fa fa-circle-o"></i>계정 관리</a></li>
				</ul> <%
 	}
 %></li>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>