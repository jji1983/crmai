<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	//out.println("sessionLOGIN :: " + session.getAttribute("sessionLOGIN"));
	//out.println("sessionCAMCNT :: " + session.getAttribute("sessionCAMCNT"));
%>

<title>Dashboard</title>

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->

<!-- /resources/bower_components/bootstrap/dist/css/bootstrap.min.css -->
<link rel="stylesheet"
	href="/resources/adminLTE/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="/resources/adminLTE/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="/resources/adminLTE/Ionicons/css/ionicons.min.css">
<!-- Morris charts -->
<link rel="stylesheet" href="/resources/adminLTE/morris.js/morris.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="/resources/adminLTE/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="/resources/adminLTE/dist/css/skins/_all-skins.min.css">
<!-- Select2 -->
<link rel="stylesheet"
	href="/resources/bower_components/select2/dist/css/select2.min.css">



<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script>
	function Content_Learning() {
		//alert("call Content_Learning!!");
		document.getElementById("main_frame").src = "/Learning/data";
	}
</script>

<style>
#ds_campaign {
	border-collapse: collapse;
}

.btn-bg-mint {
	color: #fff;
	background-color: #78C2AD;
	border-color: #78C2AD;
}

#ds_campaign td, #ds_campaign th {
	padding: 20px;
}

#ds_campaign th {
	background-color: #ccc;
}

#ds_campaign tr.selected {
	background-color: navy;
	color: #fff;
	font-weight: bold;
}

.myAlert {
	position: relative;
	padding: 0.75rem 1.25rem;
	margin-bottom: 1rem;
	border: 1px solid transparent;
	border-radius: 0.4rem;
	padding-right: 4rem;
	color: #38656f;
	background-color: #e2f3f7;
	border-color: #d6eef3;
}
</style>

</head>
<body class="hold-transition skin-blue sidebar-mini">


	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Dashboard <small id="session">Control panel</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Dashboard</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">

		<c:if test="${sessionCAMCNT <= 0}">

			<div class="row">
				<!-- Default box -->
				<div class="box">
					<div class="box-header">
						<h4 class="box-title">
							AI 자동 수행 안내 <small> 등록된 캠페인이 없습니다</small>
						</h4>

						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse" data-toggle="tooltip" title="Collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-box-tool"
								data-widget="remove" data-toggle="tooltip" title="Remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<div class="box-body">
						<div class="row">

							<div class="col-md-2.5 col-sm-2 text-center">
								<div class="box box-default box-solid">
									<div class="box-header with-border">
										<h3 class="box-title">1.1 학습데이터</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<button type="button" class="btn btn-default"
											disabled="disabled">데이터 없음</button>
									</div>
									<!-- /.box-body -->

								</div>
							</div>
							<!-- /.col -->
							<div class="col-md-2.5 col-sm-2 text-center">
								<div class="box box-default box-solid">
									<div class="box-header with-border">
										<h3 class="box-title">1.2 대상자데이터</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<button type="button" class="btn btn-default"
											disabled="disabled">데이터 없음</button>
									</div>
									<!-- /.box-body -->

								</div>
							</div>
							<!-- /.col -->
							<div class="col-md-2.5 col-sm-2 text-center">
								<div class="box box-default box-solid">
									<div class="box-header with-border">
										<h3 class="box-title">2. AI 전처리</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<button type="button" class="btn btn-default"
											disabled="disabled">데이터 없음</button>
									</div>
									<!-- /.box-body -->

								</div>
							</div>
							<!-- /.col -->
							<div class="col-md-2.5 col-sm-2 text-center">
								<div class="box box-default box-solid">
									<div class="box-header with-border">
										<h3 class="box-title">3. AI학습</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<button type="button" class="btn btn-default"
											disabled="disabled">데이터 없음</button>
									</div>
									<!-- /.box-body -->

								</div>
							</div>
							<!-- /.col -->
							<div class="col-md-2.5 col-sm-2 text-center">
								<div class="box box-default box-solid">
									<div class="box-header with-border">
										<h3 class="box-title">4. AI 예측실행</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<button type="button" class="btn btn-default"
											disabled="disabled">데이터 없음</button>
									</div>
									<!-- /.box-body -->

								</div>
							</div>
							<!-- /.col -->
							<div class="col-md-2.5 col-sm-2 text-center">
								<div class="box box-default box-solid">
									<div class="box-header with-border">
										<h3 class="box-title">5. AI 결과</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<button type="button" class="btn btn-default"
											disabled="disabled">데이터 없음</button>
									</div>
									<!-- /.box-body -->

								</div>
							</div>
							<!-- /.col -->

							<div class="row">
								<div class="col-md-3 col-md-offset-10">
									<button id='newBtn' type="button" class="btn btn-info"
										onclick="location.href='/iframe/AutoOrder'">신규 캠페인
										등록하기</button>
								</div>
							</div>
						</div>
						<!-- /.row -->

					</div>
				</div>
			</div>
		</c:if>

		<!-- 공지사항 -->
		<div class="row">
			<!-- Default box -->
			<div class="box">
				<div class="box-header with-border">
					<h4 class="box-title">공지사항</h4>

					<div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool"
							data-widget="collapse" data-toggle="tooltip" title="Collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button type="button" class="btn btn-box-tool"
							data-widget="remove" data-toggle="tooltip" title="Remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<div class="box-body">
					<p id="noticeVal"></p>
					<div class="row">
						<div class="col-xs-12">
							<div class="box">
								<div class="box box-default">
									<!-- /.box-header -->
									<div class="box-body with-border">
										<!-- notice table -->
										<!-- /.게시판 목록 -->
										<div class="row">
											<!-- notice table -->
											<table id="ai_notice"
												class="table table-bordered table-hover text-center"></table>
											<nav aria-label="Page navigation example"
												style="text-align: center;">
												<ul class="pagination-sm" id="id_notice"></ul>
											</nav>
											<table id="id_notice"
												class="table table-bordered table-hover"></table>
											<nav aria-label="Page navigation example"
												style="text-align: center;">
												<ul class="pagination-sm" id="pagination"></ul>
											</nav>

										</div>

										<!-- Modal -->
										<div class="modal fade" id="noticeNewModal" tabindex="-1"
											role="dialog" aria-labelledby="newModalLabel"
											aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<div class="row">
															<div class="col-xs-10">
																<h5 class="modal-title" id="newModalLabel">게시글 신규
																	등록</h5>
															</div>
															<div class="col-xs-2">
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
														</div>
													</div>
													<div class="modal-body">
														<!-- form start -->
														<form class="form-horizontal" id="newUploadForm"
															action="/notice/insert" method="post">
															<div class="box-body">

																<input type="hidden" id="user_id" name="user_id"
																	value=<%=session.getAttribute("sessionID")%>> <input
																	type="hidden" id="noticeCode" name="noticeCode">

																<div class="form-group">
																	<label for="inputNoticeName"
																		class="col-sm-2 control-label">제목</label>

																	<div class="col-sm-10">
																		<input id="inputNoticeName" name="inputNoticeName"
																			type="text" class="form-control" placeholder="제목"
																			required>
																	</div>
																</div>

																<div class="form-group readNotice">
																	<label for="noticeDate" class="col-sm-2 control-label">등록일</label>

																	<div class="col-sm-10">
																		<input id="noticeDate" name="noticeDate" type="text"
																			class="form-control" readonly>
																	</div>
																</div>

																<div class="form-group readNotice">
																	<label for="noticeWriter"
																		class="col-sm-2 control-label">작성자</label>

																	<div class="col-sm-10">
																		<input id="noticeWriter" name="noticeWriter"
																			type="text" class="form-control" readonly>
																	</div>
																</div>

																<div class="form-group">
																	<label for="inputNoticeDesc"
																		class="col-sm-2 control-label">내용</label>

																	<div class="col-sm-10">
																		<textarea id="inputNoticeDesc" name="inputNoticeDesc"
																			class="form-control" rows="10" placeholder="내용"
																			style="resize: none;"></textarea>
																	</div>
																</div>

															</div>
															<!-- /.box-body -->
															<div class="box-footer">
																<div class='row pull-right' style='margin-right: 3px'>
																	<button id="bthClose" type="button"
																		class="btn btn-secondary" data-dismiss="modal"
																		style="margin-left: 5px">돌아가기</button>
																</div>
															</div>
															<!-- /.box-footer -->
														</form>
													</div>
												</div>
											</div>
										</div>
										<!--/. Modal -->

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.box -->
		</div>
		<!-- /.row -->

		<!-- 통계 -->
		<div class="row">
			<!-- Default box -->
			<div class="box">
				<div class="box-header with-border">
					<h4 class="box-title">통계</h4>

					<div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool"
							data-widget="collapse" data-toggle="tooltip" title="Collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button type="button" class="btn btn-box-tool"
							data-widget="remove" data-toggle="tooltip" title="Remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<div class="box-body">
					<!-- left -->
					<div class="col-md-6">

						<!-- 나의 현황 -->
						<div class="row" style="margin-bottom: 30px; margin-top: 10px;">
							<div class="col-md-4">
								<button type="button"
									class="btn btn-block btn-bg-mint btn-lg disabled">나의
									현황</button>
							</div>
						</div>

						<c:if test="${sessionCAMCNT > 0}">
							<ul id="leftTab" class="nav nav-tabs" role="tablist">
								<li role="presentation" class="dropdown"><a data-target="#"
									id="myTabDrop0" class="dropdown-toggle" data-toggle="dropdown"
									aria-controls="myTabDrop0-contents">나의전체<span class="caret"></span>
								</a>
									<ul class="dropdown-menu" role="menu"
										aria-labelledby="myTabDrop1" id="leftType">
									</ul></li>
								<li role="presentation" class="dropdown"><a data-target="#"
									id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown"
									aria-controls="myTabDrop1-contents">기간별 <span class="caret"></span>
								</a>
									<ul class="dropdown-menu" role="menu"
										aria-labelledby="myTabDrop1" id="leftPeriod">
									</ul></li>
								<li role="presentation" class="dropdown"><a data-target="#"
									id="myTabDrop2" class="dropdown-toggle" data-toggle="dropdown"
									aria-controls="myTabDrop2-contents">캠페인별 <span
										class="caret"></span>
								</a>
									<ul class="dropdown-menu" role="menu"
										aria-labelledby="myTabDrop2" id="leftCam">
									</ul></li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div role="tabpanel" class="tab-pane fade active in"
									id="dropdown0">
									<!-- 		<p>0번입니다</p> -->
									<!-- Info boxes -->

									<!-- BAR CHART -->
									<div class="box box-success">

										<div class="box-header with-border text-center">
											<h3 class="box-title" id="LChartTitle">나의 캠페인 전체</h3>
										</div>
										<div class="box-body">
											<div class="chart" style="height: 320px">
												<canvas id="chBarLeft" style="height: 320px"></canvas>
											</div>
										</div>
									</div>
								</div>
								<!-- /.chart -->
							</div>
							<!-- Tabs -->

							<div class="row" id="leftStat">
								<div class="col-md-4 col-sm-6 col-xs-12">
									<div class="info-box">
										<span class="info-box-text text-center text-light-blue">학습</span>
										<span class="info-box-number text-center text-light-blue">0%</span>
										<span class="info-box-text text-center text-light-blue">(0건)</span>
									</div>
									<!-- /.info-box -->
								</div>
								<!-- /.col -->
								<div class="col-md-4 col-sm-6 col-xs-12">
									<div class="info-box">
										<span class="info-box-text text-center text-yellow">예측</span>
										<span class="info-box-number text-center text-yellow">0%</span>
										<span class="info-box-text text-center text-yellow">(0건)</span>
									</div>
									<!-- /.info-box -->
								</div>
								<!-- /.col -->

								<!-- fix for small devices only -->
								<div class="clearfix visible-sm-block"></div>

								<div class="col-md-4 col-sm-6 col-xs-12">
									<div class="info-box">
										<span class="info-box-text text-center text-green">결과</span> <span
											class="info-box-number text-center text-green">0%</span> <span
											class="info-box-text text-center text-green">(0건)</span>
									</div>
									<!-- /.info-box -->
								</div>
							</div>
							<!-- /.box -->
						</c:if>
						<div>
							<c:if test="${sessionCAMCNT <= 0}">
								<button type="button" class="btn btn-default btn-block"
									onclick="location.href='/iframe/AutoOrder'">
									<strong>${sessionNAME }님 </strong> 현재 등록된 캠페인이 없습니다 <small>(클릭하여
										등록하기)</small>
								</button>
							</c:if>
						</div>
					</div>


					<!-- right -->
					<div class="col-md-6">

						<!-- 전체 현황 -->
						<div class="row" style="margin-bottom: 30px; margin-top: 10px;">
							<div class="col-md-4">
								<button type="button"
									class="btn btn-block btn-bg-mint btn-lg disabled">전체
									현황</button>
							</div>
						</div>

						<ul id="RightTab" class="nav nav-tabs" role="tablist">
							<li role="presentation" class="dropdown"><a data-target="#"
									id="myTabDrop3" class="dropdown-toggle" data-toggle="dropdown"
									aria-controls="myTabDrop3-contents">산업군별<span class="caret"></span>
								</a>
									<ul class="dropdown-menu" role="menu"
										aria-labelledby="myTabDrop3" id="rightType">
									</ul></li>
							<li role="presentation" class="dropdown"><a data-target="#"
								id="myTabDrop4" class="dropdown-toggle" data-toggle="dropdown"
								aria-controls="myTabDrop3-contents">기간별 <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu"
									aria-labelledby="myTabDrop5" id="rightPeriod">
								</ul></li>
							<li role="presentation" class="dropdown"><a data-target="#"
								id="myTabDrop5" class="dropdown-toggle" data-toggle="dropdown"
								aria-controls="myTabDrop5-contents">캠페인별 <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu"
									aria-labelledby="myTabDrop5" id="rightCam">
								</ul></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div role="tabpanel" class="tab-pane fade active in"
								id="dropdown1" aria-labelledby="dropdown1-tab">
								<!-- 		<p>5번입니다</p> -->
								<!-- Info boxes -->

								<!-- BAR CHART -->
								<div class="box box-success">

									<div class="box-header with-border text-center">
										<h3 class="box-title" id="RChartTitle">캠페인 전체</h3>
									</div>
									<div class="box-body">
										<div class="chart" style="height: 320px">
											<canvas id="chBarRight" style="height: 320px"></canvas>
										</div>
									</div>
								</div>
							</div>
							<!-- /.chart -->
						</div>
						<!-- Tabs -->

						<div class="row" id="rightStat">
							<div class="col-md-4 col-sm-6 col-xs-12">
								<div class="info-box">
									<span class="info-box-text text-center text-light-blue">학습</span>
									<span class="info-box-number text-center text-light-blue">0%</span>
									<span class="info-box-text text-center text-light-blue">(0건)</span>
								</div>
								<!-- /.info-box -->
							</div>
							<!-- /.col -->
							<div class="col-md-4 col-sm-6 col-xs-12">
								<div class="info-box">
									<span class="info-box-text text-center text-yellow">예측</span> <span
										class="info-box-number text-center text-yellow">0%</span> <span
										class="info-box-text text-center text-yellow">(0건)</span>
								</div>
								<!-- /.info-box -->
							</div>
							<!-- /.col -->

							<!-- fix for small devices only -->
							<div class="clearfix visible-sm-block"></div>

							<div class="col-md-4 col-sm-6 col-xs-12">
								<div class="info-box">
									<span class="info-box-text text-center text-green">결과</span> <span
										class="info-box-number text-center text-green">0%</span> <span
										class="info-box-text text-center text-green">(0건)</span>
								</div>
								<!-- /.info-box -->
							</div>
						</div>
					</div>

					<!-- ~right -->
				</div>
			</div>


			<!-- /.box -->
		</div>

		<!-- /.row -->
	</section>
	<!-- /.Main content -->


	<!-- jQuery 3 -->
	<script src="/resources/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="/resources/bower_components/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- ChartJS -->
	<script src="/resources/bower_components/Chart.js/Chart.js"></script>
	<!-- Morris.js charts -->
	<script src="/resources/bower_components/raphael/raphael.min.js"></script>
	<script src="/resources/bower_components/morris.js/morris.min.js"></script>
	<!-- Sparkline -->
	<script
		src="/resources/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script
		src="/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="/resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- jQuery Knob Chart -->
	<script
		src="/resources/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script src="/resources/bower_components/moment/min/moment.min.js"></script>
	<script
		src="/resources/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- datepicker -->
	<script
		src="/resources/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<!-- Bootstrap WYSIHTML5 -->
	<script
		src="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<!-- Slimscroll -->
	<script
		src="/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="/resources/bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="/resources/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="/resources/dist/js/pages/dashboard.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/resources/dist/js/demo.js"></script>

	<!-- MDB charts ADD -->
	<script src="/resources/js/chart.js"></script>

	<!-- twbsPagination :: https://github.com/josecebe/twbs-pagination -->
	<script src="/resources/js/jquery.twbsPagination.js"></script>
	<script src="/resources/js/jquery.twbsPagination.min.js"></script>

	<!-- AI MAKE JS -->
	<script src="/resources/js/ai_campaign.js"></script>
	<script src="/resources/js/ai_notice.js"></script>
	<script src="/resources/js/dashboardChart.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {


			$('.modal').on('hidden.bs.modal', function(e) {
				// console.log('modal close');
				$(this).find('form')[0].reset();
			});
			$('#ai_notice').on('shown.bs.modal', function(e) {
				var div_t_pageing = $('#id_notice');
				grid_table_notice(div_t_pageing);
				noticePage();
			});


		});

		//게시글 조회
		function view_notice(code) {
			//console.log('-- view_board -- ', code);

			$.ajax({
				type : "GET",
				url : "/notice/detail?code=" + code,
				contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
				cache : false,
				timeout : 600000,
				success : function(data) {
					console.log("SUCCESS : ", data);

					showModal(data);
				},
				error : function(e) {
					alert("error :: " + e.responseText);
					console.log("ERROR : ", e);
				}
			});
		}

		function showModal(data) {
			console.log('-- showModal -- ', data);

			var d = data[0];
			$('#newModalLabel').text('게시글 상세 조회');

			$("#inputNoticeName").attr("readonly", true);
			$("#inputNoticeName").val(d.title);

			$("#inputNoticeDesc").attr("readonly", true);
			$("#inputNoticeDesc").val(d.contents);

			$("#noticeCode").val(d.code);
			$("#noticeWriter").val(d.writer);
			$("#noticeDate").val(d.reg_datetime.substr(0, 19));

			$('.readNotice').show();
			$('.editNotice').hide();

			$('#noticeNewModal').modal('show');
		}
	</script>

	<!-- 차트 초기화 -->
	<script type="text/javascript">
		$(document).ready(function() {
			var leftTab = document.getElementById("leftTab");
			if (leftTab != null) {
				initLeftChart();
			}
			
			initRightChart();
		});
	</script>
</body>
</html>