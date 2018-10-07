<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

						<ul id="leftTab" class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a data-target="#"
								id="dropdown0-tab" role="tab" data-toggle="tab"
								aria-controls="dropdown0" aria-expanded="true">나의전체</a></li>
							<li role="presentation" class="dropdown"><a data-target="#"
								id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown"
								aria-controls="myTabDrop1-contents">기간별 <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu"
									aria-labelledby="myTabDrop1" id="myTabDrop1-contents">
									<li><a class="dropdown-header">선택하세요</a></li>
									<li role="presentation" class="divider"></li>
									<li><a data-target="#" tabindex="-1" role="tab"
										id="dropdown1-tab" data-toggle="tab" aria-controls="dropdown1">2018년
											1월</a></li>
									<li><a data-target="#" tabindex="-1" role="tab"
										id="dropdown2-tab" data-toggle="tab" aria-controls="dropdown2">2018년
											2월</a></li>
								</ul></li>
							<li role="presentation" class="dropdown"><a data-target="#"
								id="myTabDrop2" class="dropdown-toggle" data-toggle="dropdown"
								aria-controls="myTabDrop2-contents">캠페인별 <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu"
									aria-labelledby="myTabDrop2" id="myTabDrop2-contents">
									<li><a class="dropdown-header">선택하세요</a></li>
									<li role="presentation" class="divider"></li>
									<li><a data-target="#" tabindex="-1" role="tab"
										id="dropdown3-tab" data-toggle="tab" aria-controls="dropdown3">캠페인1</a></li>
									<li><a data-target="#" tabindex="-1" role="tab"
										id="dropdown4-tab" data-toggle="tab" aria-controls="dropdown4">캠페인2</a></li>
								</ul></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div role="tabpanel" class="tab-pane fade active in"
								id="dropdown0" aria-labelledby="dropdown0-tab">
								<!-- 		<p>0번입니다</p> -->
								<!-- Info boxes -->

								<!-- BAR CHART -->
								<div class="box box-success">

									<div class="box-header with-border text-center">
										<h3 class="box-title" id="LChartTitle">나의 캠페인 전체</h3>
									</div>
									<div class="box-body">
										<div class="chart" style="height: 320px">
											<canvas id="chBar0" style="height: 320px"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="dropdown1"
								aria-labelledby="dropdown1-tab">
								<!-- 	<p>1번입니다</p> -->
								<!-- Info boxes -->

								<!-- BAR CHART -->
								<div class="box box-success">

									<div class="box-header with-border text-center">
										<h3 class="box-title">월별 통계</h3>

									</div>
									<div class="box-body">
										<div class="chart">
											<canvas id="chBar1" style="height: 320px"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="dropdown2"
								aria-labelledby="dropdown2-tab">
								<!-- 	<p>2번입니다</p> -->
								<!-- Info boxes -->

								<!-- BAR CHART -->
								<div class="box box-success">

									<div class="box-header with-border text-center">
										<h3 class="box-title">기간 통계</h3>
									</div>
									<div class="box-body">
										<div class="chart">
											<canvas id="chBar2" style="height: 320px"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="dropdown3"
								aria-labelledby="dropdown3-tab">
								<!-- <p>3번입니다</p> -->
								<!-- Info boxes -->

								<!-- BAR CHART -->
								<div class="box box-success">

									<div class="box-header with-border text-center">
										<h3 class="box-title">캠페인별 정확도</h3>
									</div>
									<div class="box-body">
										<div class="chart">
											<canvas id="chBar3" style="height: 320px"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="dropdown4"
								aria-labelledby="dropdown4-tab">
								<!-- 		<p>4번입니다</p> -->
								<!-- Info boxes -->

								<!-- BAR CHART -->
								<div class="box box-success">

									<div class="box-header with-border text-center">
										<h3 class="box-title">캠페인별 정확도</h3>
									</div>
									<div class="box-body">
										<div class="chart">
											<canvas id="chBar4" style="height: 320px"></canvas>
										</div>
									</div>
								</div>
							</div>
							<!-- /.chart -->
						</div>
						<!-- Tabs -->
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="info-box">
								<span class="info-box-text text-center">학습</span> <span
									class="info-box-number text-center">80%</span> <span
									class="info-box-text text-center">(20건)</span>
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="info-box">
								<span class="info-box-text text-center">예측</span> <span
									class="info-box-number text-center">83%</span> <span
									class="info-box-text text-center">(20건)</span>
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->

						<!-- fix for small devices only -->
						<div class="clearfix visible-sm-block"></div>

						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="info-box">
								<span class="info-box-text text-center">결과</span> <span
									class="info-box-number text-center">84%</span> <span
									class="info-box-text text-center">(20건)</span>
							</div>
							<!-- /.info-box -->
						</div>
					</div>
					<!-- /.box -->


					<!-- right -->
					<div class="col-md-6">


						<!-- 나의 현황 -->
						<div class="row" style="margin-bottom: 30px; margin-top: 10px;">
							<div class="col-md-4">
								<button type="button"
									class="btn btn-block btn-bg-mint btn-lg disabled">전체
									현황</button>
							</div>
						</div>

						<ul id="rightTab" class="nav nav-tabs">
							<li class="active"><a href="#" id="dropdown5-tab"
								data-toggle="tab">산업군별</a></li>
							<li role="presentation" class="dropdown"><a
								class="dropdown-toggle" data-toggle="dropdown" href="#">기간별
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu">
									<li role="presentation"><a class="dropdown-header"
										role="tab" tabindex="-1" href="#">선택하세요</a></li>
									<li role="presentation" class="divider"></li>
									<li role="presentation"><a role="menuitem" tabindex="-1"
										data-toggle="tab" href="#" id="dropdown6-tab">2019년</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1"
										data-toggle="tab" href="#" id="dropdown7-tab">2018년</a></li>
								</ul></li>
							<li role="presentation" class="dropdown"><a
								class="dropdown-toggle" data-toggle="dropdown" href="#">캠페인별
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu">
									<li role="presentation"><a class="dropdown-header"
										role="menuitem" tabindex="-1" href="#">선택하세요</a></li>
									<li role="presentation" class="divider"></li>
									<li role="presentation"><a role="menuitem"
										data-toggle="tab" tabindex="-1" href="#" id="dropdown8-tab">기가지니</a></li>
									<li role="presentation"><a role="menuitem"
										data-toggle="tab" tabindex="-1" href="#" id="dropdown9-tab">아이폰X
											프로모션</a></li>
								</ul></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active">
								<!-- BAR CHART -->
								<div class="box box-success">

									<div class="box-header with-border text-center">
										<h3 class="box-title" id="RChartTitle">나의 캠페인 전체</h3>
									</div>
									<div class="box-body">
										<div class="chart" style="height: 320px">
											<canvas id="chBar5" style="height: 320px"></canvas>
										</div>
									</div>
								</div>
							</div>
							<!-- /.tab-pane -->
						</div>
						<!-- /.tab-content -->



						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="info-box">
								<span class="info-box-text text-center">학습</span> <span
									class="info-box-number text-center">78%</span> <span
									class="info-box-text text-center">(20건)</span>
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="info-box">
								<span class="info-box-text text-center">예측</span> <span
									class="info-box-number text-center">83%</span> <span
									class="info-box-text text-center">(20건)</span>
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->

						<!-- fix for small devices only -->
						<div class="clearfix visible-sm-block"></div>

						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="info-box">
								<span class="info-box-text text-center">결과</span> <span
									class="info-box-number text-center">80%</span> <span
									class="info-box-text text-center">(20건)</span>
							</div>
							<!-- /.info-box -->
						</div>
					</div>
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

	<!-- Chart script -->
	<script type="text/javascript">
		$(function() {

			//LeftTab Ajax

			$.ajax({
				type : "GET",
				url : "/dashboardChart/totalData",
				contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
				cache : false,
				processData : true,
				async : true,
				success : function(data) {
					//alert(data);
					$.each(data, function(){
						
						//dashboardChart print
                        //alert("totalCount : "+ this.totalCount +" , totalOriginal : " +this.totalOriginal + " , totalSo : " + this.totalSo +" , totalReal :" +this.totalReal);
                        
						//aiStat print
						alert("AIStatistics [camId=" + this.camId + ", camName=" + this.camName + ", camStatus=" + this.camStatus + ", admId=" + this.admId
								+ ", admName=" + this.admName + ", camType=" + this.camType + ", camCdate=" + this.camCdate + ", admType=" + this.admType
								+ ", trainMethod=" + this.trainMethod + ", originalAcc=" + this.originalAcc + ", soAcc=" + this.soAcc + ", realAcc="
								+ this.realAcc + ", modelFlag=" + this.modelFlag + ", testCnt=" + this.testCnt + ", beforeDate=" + this.beforeDate
								+ ", afterDate=" + this.afterDate + ", originalAccAvg=" + this.originalAccAvg + ", soAccAvg=" + this.soAccAvg
								+ ", realAccAvg=" + this.realAccAvg + "]");

						
	            	   });
					
				},
				error : function(e) {
					//console.log("ERROR : ", e);
				}
			});

			//labels
			types = [ "통신", "금융", "유통", "기타" ];
			months = [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월",
					"10월", "11월", "12월" ];
			campains = [ "정확도(%)", "예측(%)", "결과(%)" ];
			chartBGColor = [ 'rgba(81, 152, 255, 0.6)',
					'rgba(99, 132, 0, 0.6)', 'rgba(0, 180, 175, 0.6)' ];

			//elements
			var ctx0 = document.getElementById("chBar0").getContext('2d');
			var ctx1 = document.getElementById("chBar1").getContext('2d');
			var ctx2 = document.getElementById("chBar2").getContext('2d');
			var ctx3 = document.getElementById("chBar3").getContext('2d');
			var ctx4 = document.getElementById("chBar4").getContext('2d');
			var ctx5 = document.getElementById("chBar5").getContext('2d');

			monthORIGINAL = [ 54, 53, 14, 33, 13, 87, 11, 63, 90, 87, 100, 21 ];
			monthSO = [ 37, 89, 98, 37, 21, 90, 87, 11, 53, 14, 33, 13 ];
			monthREAL = [ 26, 37, 48, 37, 23, 90, 87, 100, 21, 90, 87, 11 ];

			typeORIGINAL = [ 16, 74, 88, 90 ];
			typeSO = [ 90, 87, 100, 90 ];
			typeREAL = [ 37, 21, 90, 87 ];

			campainData1 = 94;
			campainData2 = 90;
			campainData3 = 88;
			campainDatas = [ campainData1, campainData2, campainData3 ];

			//Campains Data
			campainLeft = {
				labels : campains,
				datasets : [ {
					label : '캠페인',
					data : campainDatas,
					backgroundColor : chartBGColor,
					borderWidth : 0
				} ]
			};
			campainRight = {
				labels : campains,
				datasets : [ {
					label : '캠페인',
					data : campainDatas,
					backgroundColor : chartBGColor,
					borderWidth : 0
				} ]
			};

			//Types Data
			typeLeft = {
				labels : types,
				datasets : [ {
					label : '정확도(%)',
					data : typeORIGINAL,
					backgroundColor : 'rgba(81, 152, 255, 0.6)',
					borderWidth : 0,
				}, {
					label : '예측(%)',
					data : typeSO,
					backgroundColor : 'rgba(99, 132, 0, 0.6)',
					borderWidth : 0,
				}, {
					label : '결과(%)',
					data : typeREAL,
					backgroundColor : 'rgba(0, 180, 175, 0.6)',
					borderWidth : 0
				} ]
			};
			typeRight = {
				labels : types,
				datasets : [ {
					label : '정확도(%)',
					data : typeORIGINAL,
					backgroundColor : 'rgba(81, 152, 255, 0.6)',
					borderWidth : 0,
				}, {
					label : '예측(%)',
					data : typeSO,
					backgroundColor : 'rgba(99, 132, 0, 0.6)',
					borderWidth : 0,
				}, {
					label : '결과(%)',
					data : typeREAL,
					backgroundColor : 'rgba(0, 180, 175, 0.6)',
					borderWidth : 0
				} ]
			};

			//Months Data
			monthRight = {
				labels : months,
				datasets : [ {
					label : '정확도(%)',
					data : monthORIGINAL,
					backgroundColor : 'rgba(81, 152, 255, 0.6)',
					borderWidth : 0,
				}, {
					label : '예측(%)',
					data : monthSO,
					backgroundColor : 'rgba(99, 132, 0, 0.6)',
					borderWidth : 0,
				}, {
					label : '결과(%)',
					data : monthREAL,
					backgroundColor : 'rgba(0, 180, 175, 0.6)',
					borderWidth : 0
				} ]
			};
			monthLeft = {
				labels : months,
				datasets : [ {
					label : '정확도(%)',
					data : monthORIGINAL,
					backgroundColor : 'rgba(81, 152, 255, 0.6)',
					borderWidth : 0,
				}, {
					label : '예측(%)',
					data : monthSO,
					backgroundColor : 'rgba(99, 132, 0, 0.6)',
					borderWidth : 0,
				}, {
					label : '결과(%)',
					data : monthREAL,
					backgroundColor : 'rgba(0, 180, 175, 0.6)',
					borderWidth : 0
				} ]
			};

			var chartOptions = {
				legend : {
					labels : {
						fontColor : '#666'
					}
				},
				scales : {
					xAxes : [ {
						gridLines : {
							display : false
						},
						maxBarThickness : 35
					} ],
					yAxes : [ {
						gridLines : {
							display : false
						},
						ticks : {
							beginAtZero : true
						},
						gridLines : {
							display : true,
							drawBorder : true,
							drawOnChartArea : true,
							drawTicks : false,
						}
					}, ]
				},
				tooltips : {
					mode : 'index'
				},
				legend : {
					position : 'bottom',
				}
			};

			barChart0 = new Chart(ctx0, {
				type : 'bar',
				data : typeLeft,
				options : chartOptions
			});
			barChart1 = new Chart(ctx1, {
				type : 'bar',
				data : monthLeft,
				options : chartOptions
			});
			barChart2 = new Chart(ctx2, {
				type : 'bar',
				data : monthLeft,
				options : chartOptions
			});
			barChart3 = new Chart(ctx3, {
				type : 'bar',
				data : campainLeft,
				options : chartOptions
			});
			barChart4 = new Chart(ctx4, {
				type : 'bar',
				data : campainLeft,
				options : chartOptions
			});

			barChart5 = new Chart(ctx5, {
				type : 'bar',
				data : typeRight,
				options : chartOptions
			});

			//rightChart initData ajax

			//dropdown0-tab click
			document.getElementById('dropdown0-tab').addEventListener('click',
					function() {
						//type 1
						toggleLeft(1);
					});
			//dropdown1-tab click
			document.getElementById('dropdown1-tab').addEventListener('click',
					function() {
						//month 2
						toggleLeft(2);
					});
			//dropdown2-tab click
			document.getElementById('dropdown2-tab').addEventListener('click',
					function() {
						//month 2
						toggleLeft(2);
					});
			//dropdown3-tab click
			document.getElementById('dropdown3-tab').addEventListener('click',
					function() {
						//month 2
						toggleLeft(3);
					});
			//dropdown4-tab click
			document.getElementById('dropdown4-tab').addEventListener('click',
					function() {
						//month 2
						toggleLeft(3);
					});

			//dropdown5-tab click
			document.getElementById('dropdown5-tab').addEventListener('click',
					function() {
						//type 1
						toggleRight(1);
					});
			//dropdown6-tab click
			document.getElementById('dropdown6-tab').addEventListener('click',
					function() {
						//month 2
						toggleRight(2);
					});
			//dropdown7-tab click
			document.getElementById('dropdown7-tab').addEventListener('click',
					function() {
						//month 2
						toggleRight(2);
					});
			//dropdown8-tab click
			document.getElementById('dropdown8-tab').addEventListener('click',
					function() {
						//month 2
						toggleRight(3);
					});
			//dropdown9-tab click
			document.getElementById('dropdown9-tab').addEventListener('click',
					function() {
						//month 2
						toggleRight(3);
					});

		});

		function initLeft() {
			alert('왼쪽 차트 초기화할꼐용~');
		}

		function toggleLeft(kind) {
			var cngTitle = "변경합시다";

			//type 1
			if (kind == 1) {
				cngTitle = "typeLeft 변경합니당";

				//data delete
				//Types Data
				var title = document.getElementById('LChartTitle');
				$(title).text(cngTitle);

				var some_new_data = {
					labels : types,
					datasets : [ {
						label : '정확도(%)',
						data : typeORIGINAL,
						backgroundColor : 'rgba(81, 152, 255, 0.6)',
						borderWidth : 0,
					}, {
						label : '예측(%)',
						data : typeSO,
						backgroundColor : 'rgba(99, 132, 0, 0.6)',
						borderWidth : 0,
					}, {
						label : '결과(%)',
						data : typeREAL,
						backgroundColor : 'rgba(0, 180, 175, 0.6)',
						borderWidth : 0
					} ]
				};

				barChart0.config.data = some_new_data;
				barChart0.update();

				/* $.ajax({
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
				}); */
			}

			//month 2
			if (kind == 2) {
				cngTitle = "monthLeft 변경합니당";
				var title = document.getElementById('LChartTitle');
				$(title).text(cngTitle);

				var some_new_data = {
					labels : months,
					datasets : [ {
						label : '정확도(%)',
						data : monthORIGINAL,
						backgroundColor : 'rgba(81, 152, 255, 0.6)',
						borderWidth : 0,
					}, {
						label : '예측(%)',
						data : monthSO,
						backgroundColor : 'rgba(99, 132, 0, 0.6)',
						borderWidth : 0,
					}, {
						label : '결과(%)',
						data : monthREAL,
						backgroundColor : 'rgba(0, 180, 175, 0.6)',
						borderWidth : 0
					} ]
				};

				barChart0.config.data = some_new_data;
				barChart0.update();
				/* $.ajax({
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
				}); */
			}

			//campain 3
			if (kind == 3) {
				cngTitle = "campainLeft 변경합니당";
				var title = document.getElementById('LChartTitle');
				$(title).text(cngTitle);
				some_new_data = {
					labels : campains,
					datasets : [ {
						label : '캠페인',
						data : campainDatas,
						backgroundColor : chartBGColor,
						borderWidth : 0
					} ]
				};

				barChart0.config.data = some_new_data;
				barChart0.update();

				/* $.ajax({
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
				}); */
			}
		}
		function toggleRight(kind) {
			var cngTitle = "변경합시다";

			//type 1
			if (kind == 1) {
				cngTitle = "typeRight 변경합니당";

				//data delete
				//Types Data
				var title = document.getElementById('RChartTitle');
				$(title).text(cngTitle);

				var some_new_data = {
					labels : types,
					datasets : [ {
						label : '정확도(%)',
						data : typeORIGINAL,
						backgroundColor : 'rgba(81, 152, 255, 0.6)',
						borderWidth : 0,
					}, {
						label : '예측(%)',
						data : typeSO,
						backgroundColor : 'rgba(99, 132, 0, 0.6)',
						borderWidth : 0,
					}, {
						label : '결과(%)',
						data : typeREAL,
						backgroundColor : 'rgba(0, 180, 175, 0.6)',
						borderWidth : 0
					} ]
				};

				barChart5.config.data = some_new_data;
				barChart5.update();

				/* $.ajax({
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
				}); */
			}

			//month 2
			if (kind == 2) {
				cngTitle = "monthRight 변경합니당";
				var title = document.getElementById('RChartTitle');
				$(title).text(cngTitle);

				var some_new_data = {
					labels : months,
					datasets : [ {
						label : '정확도(%)',
						data : monthORIGINAL,
						backgroundColor : 'rgba(81, 152, 255, 0.6)',
						borderWidth : 0,
					}, {
						label : '예측(%)',
						data : monthSO,
						backgroundColor : 'rgba(99, 132, 0, 0.6)',
						borderWidth : 0,
					}, {
						label : '결과(%)',
						data : monthREAL,
						backgroundColor : 'rgba(0, 180, 175, 0.6)',
						borderWidth : 0
					} ]
				};

				barChart5.config.data = some_new_data;
				barChart5.update();
				/* $.ajax({
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
				}); */
			}

			//campain 3
			if (kind == 3) {
				cngTitle = "campainRight 변경합니당";
				var title = document.getElementById('RChartTitle');
				$(title).text(cngTitle);
				some_new_data = {
					labels : campains,
					datasets : [ {
						label : '캠페인',
						data : campainDatas,
						backgroundColor : chartBGColor,
						borderWidth : 0
					} ]
				};

				barChart5.config.data = some_new_data;
				barChart5.update();

				/* $.ajax({
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
				}); */
			}
		}

		function addData(chart, label, data) {

			chart.update();
		}

		function updateChart(chart) {
			chart.update();
		}
	</script>
</body>
</html>