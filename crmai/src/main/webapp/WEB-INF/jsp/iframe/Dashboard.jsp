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

<!-- minty <link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/minty/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Qt9Hug5NfnQDGMoaQYXN1+PiQvda7poO7/5k4qAmMN6evu0oDFMJTyjqaoTGHdqf"
	crossorigin="anonymous"> -->




<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		$('a[data-toggle="tab"]').on('hidden.bs.tab', function(e) {
			alert("이벤트 실행됨");
		});
	});
	function Content_Learning() {
		//alert("call Content_Learning!!");
		document.getElementById("main_frame").src = "/Learning/data";
	}
</script>

</head>
<body class="hold-transition skin-blue sidebar-mini">


	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Dashboard <small>Control panel</small>
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
						<p id="noticeVal"></p>
						<ul id="myTab" class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a
								data-target="#dropdown0" id="dropdown0-tab" role="tab"
								data-toggle="tab" aria-controls="dropdown0" aria-expanded="true">나의전체</a></li>
							<li role="presentation" class="dropdown"><a data-target="#"
								id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown"
								aria-controls="myTabDrop1-contents">기간별 <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu"
									aria-labelledby="myTabDrop1" id="myTabDrop1-contents">
									<li><a class="dropdown-header">선택하세요</a>
										<hr style="padding: 0px; margin: 0px;"></li>
									<li><a data-target="#dropdown1" tabindex="-1" role="tab"
										id="dropdown1-tab" data-toggle="tab" aria-controls="dropdown1">2018년
											1월</a></li>
									<li><a data-target="#dropdown2" tabindex="-1" role="tab"
										id="dropdown2-tab" data-toggle="tab" aria-controls="dropdown2">2018년
											2월</a></li>
								</ul></li>
							<li role="presentation" class="dropdown"><a data-target="#"
								id="myTabDrop2" class="dropdown-toggle" data-toggle="dropdown"
								aria-controls="myTabDrop2-contents">캠페인별 <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu"
									aria-labelledby="myTabDrop2" id="myTabDrop2-contents">
									<li><a data-target="#dropdown3" tabindex="-1" role="tab"
										id="dropdown3-tab" data-toggle="tab" aria-controls="dropdown3">캠페인1</a></li>
									<li><a data-target="#dropdown4" tabindex="-1" role="tab"
										id="dropdown4-tab" data-toggle="tab" aria-controls="dropdown4">캠페인2</a></li>
								</ul></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div role="tabpanel" class="tab-pane fade active in"
								id="dropdown0" aria-labelledby="dropdown0-tab">
								<p>0번입니다</p>
								<!-- Info boxes -->

								<!-- BAR CHART -->
								<div class="box box-success">

									<div class="box-header with-border">
										<h3 class="box-title">캠페인 예측율 증가 학습</h3>
									</div>
									<div class="box-body">
										<div class="chart">
											<canvas id="chBar0" style="height: 230px"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="dropdown1"
								aria-labelledby="dropdown1-tab">
								<p>1번입니다</p>
								<!-- Info boxes -->

								<!-- BAR CHART -->
								<div class="box box-success">

									<div class="box-header with-border">
										<h3 class="box-title">캠페인 예측율 증가 학습</h3>

									</div>
									<div class="box-body">
										<div class="chart">
											<canvas id="chBar1" style="height: 230px"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="dropdown2"
								aria-labelledby="dropdown2-tab">
								<p>2번입니다</p>
								<!-- Info boxes -->

								<!-- BAR CHART -->
								<div class="box box-success">

									<div class="box-header with-border">
										<h3 class="box-title">캠페인 예측율 증가 학습</h3>
									</div>
									<div class="box-body">
										<div class="chart">
											<canvas id="chBar2" style="height: 230px"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="dropdown3"
								aria-labelledby="dropdown3-tab">
								<p>3번입니다</p>
								<!-- Info boxes -->

								<!-- BAR CHART -->
								<div class="box box-success">

									<div class="box-header with-border">
										<h3 class="box-title">캠페인 예측율 증가 학습</h3>
									</div>
									<div class="box-body">
										<div class="chart">
											<canvas id="chBar3" style="height: 230px"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="dropdown4"
								aria-labelledby="dropdown4-tab">
								<p>4번입니다</p>
								<!-- Info boxes -->

								<!-- BAR CHART -->
								<div class="box box-success">

									<div class="box-header with-border">
										<h3 class="box-title">캠페인 예측율 증가 학습</h3>
									</div>
									<div class="box-body">
										<div class="chart">
											<canvas id="chBar4" style="height: 230px"></canvas>
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
						<p id="noticeVal"></p>
						<ul id="myTab" class="nav nav-tabs" role="tablist">
							<li role="presentation" class="dropdown"><a data-target="#"
								id="myTabDrop3" class="dropdown-toggle" data-toggle="dropdown"
								aria-controls="myTabDrop3-contents">산업군별 <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu"
									aria-labelledby="myTabDrop3" id="myTabDrop3-contents">
									<li><a class="dropdown-header">선택하세요</a>
										<hr style="padding: 0px; margin: 0px;"></li>
									<li><a data-target="#dropdown5" tabindex="-1" role="tab"
										id="dropdown5-tab" data-toggle="tab" aria-controls="dropdown5">통신분야</a></li>
									<li><a data-target="#dropdown6" tabindex="-1" role="tab"
										id="dropdown6-tab" data-toggle="tab" aria-controls="dropdown6">게임분야</a></li>
								</ul></li>
							<li role="presentation" class="dropdown"><a data-target="#"
								id="myTabDrop4" class="dropdown-toggle" data-toggle="dropdown"
								aria-controls="myTabDrop4-contents">기간별 <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu"
									aria-labelledby="myTabDrop4" id="myTabDrop4-contents">
									<li><a class="dropdown-header">선택하세요</a>
										<hr style="padding: 0px; margin: 0px;"></li>
									<li><a data-target="#dropdown7" tabindex="-1" role="tab"
										id="dropdown7-tab" data-toggle="tab" aria-controls="dropdown7">2019년
											1월</a></li>
									<li><a data-target="#dropdown8" tabindex="-1" role="tab"
										id="dropdown8-tab" data-toggle="tab" aria-controls="dropdown8">2019년
											2월</a></li>
								</ul></li>
							<li role="presentation" class="dropdown"><a data-target="#"
								id="myTabDrop5" class="dropdown-toggle" data-toggle="dropdown"
								aria-controls="myTabDrop5-contents">캠페인별 <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu"
									aria-labelledby="myTabDrop5" id="myTabDrop5-contents">
									<li><a class="dropdown-header">선택하세요</a>
										<hr style="padding: 0px; margin: 0px;"></li>
									<li><a data-target="#dropdown9" tabindex="-1" role="tab"
										id="dropdown9-tab" data-toggle="tab" aria-controls="dropdown9">2018년도
											신규상품..</a></li>
									<li><a data-target="#dropdown10" tabindex="-1" role="tab"
										id="dropdown10-tab" data-toggle="tab"
										aria-controls="dropdown10">아이폰X 프로모션</a></li>
								</ul></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div role="tabpanel" class="tab-pane fade active in"
								id="dropdown5" aria-labelledby="dropdown5-tab">
								<p>5번입니다</p>
								<!-- Info boxes -->

								<!-- BAR CHART -->
								<div class="box box-success">

									<div class="box-header with-border">
										<h3 class="box-title">캠페인 예측율 증가 학습</h3>

										<!-- <div class="box-tools pull-right">
										<button type="button" class="btn btn-box-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button type="button" class="btn btn-box-tool"
											data-widget="remove">
											<i class="fa fa-times"></i>
										</button>
									</div> -->
									</div>
									<div class="box-body">
										<div id="chBar5" style="height: 400px; width: 500px;"></div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="dropdown6"
								aria-labelledby="dropdown6-tab">
								<p>6번입니다</p>
								<!-- Info boxes -->

								<!-- BAR CHART -->
								<div class="box box-success">

									<div class="box-header with-border">
										<h3 class="box-title">캠페인 예측율 증가 학습</h3>

									</div>
									<div class="box-body">
										<div id="chBar6" style="height: 400px; width: 500px;"></div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="dropdown7"
								aria-labelledby="dropdown7-tab">
								<p>7번입니다</p>
								<!-- Info boxes -->

								<!-- BAR CHART -->
								<div class="box box-success">

									<div class="box-header with-border">
										<h3 class="box-title">캠페인 예측율 증가 학습</h3>

										<div class="box-tools pull-right">
											<button type="button" class="btn btn-box-tool"
												data-widget="collapse">
												<i class="fa fa-minus"></i>
											</button>
											<button type="button" class="btn btn-box-tool"
												data-widget="remove">
												<i class="fa fa-times"></i>
											</button>
										</div>
									</div>
									<div class="box-body">
										<div id="chBar7" style="height: 400px; width: 500px;"></div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="dropdown8"
								aria-labelledby="dropdown8-tab">
								<p>8번입니다</p>
								<!-- Info boxes -->

								<!-- BAR CHART -->
								<div class="box box-success">

									<div class="box-header with-border">
										<h3 class="box-title">캠페인 예측율 증가 학습</h3>

									</div>
									<div class="box-body">
										<div id="chBar8" style="height: 400px; width: 500px;"></div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="dropdown9"
								aria-labelledby="dropdown9-tab">
								<p>9번입니다</p>
								<!-- Info boxes -->

								<!-- BAR CHART -->
								<div class="box box-success">

									<div class="box-header with-border">
										<h3 class="box-title">캠페인 예측율 증가 학습</h3>

									</div>
									<div class="box-body">
										<div id="chBar9" style="height: 400px; width: 500px;"></div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="dropdown10"
								aria-labelledby="dropdown10-tab">
								<p>10번입니다</p>
								<!-- Info boxes -->

								<!-- BAR CHART -->
								<div class="box box-success">

									<div class="box-header with-border">
										<h3 class="box-title">캠페인 예측율 증가 학습</h3>

									</div>
									<div class="box-body">
										<div id="chBar10" style="height: 400px; width: 500px;"></div>
									</div>
								</div>
							</div>
							<!-- /.chart -->
						</div>
						<!-- Tabs -->
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


				<!-- /.box -->
			</div>

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

	<!-- page script -->
	<script>
		$(function() {

			//labels
			var types = [ "통신", "금융", "유통", "기타" ];
			var months = [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
					"9월", "10월", "11월", "12월" ];
			var campains = [ "정확도(%)", "예측(%)", "결과(%)" ];

			//datasets
			var typeData1 = {
				label : types[0],
				data : [ 5427, 5243, 5514, 3933, 1326, 687, 1271, 1638 ],
				backgroundColor : 'rgba(0, 99, 132, 0.6)',
				borderWidth : 0,
				yAxisID : "y-axis-density"
			};

			//elements
			var ctx0 = document.getElementById("chBar0").getContext('2d');
			var ctx1 = document.getElementById("chBar1").getContext('2d');
			var ctx2 = document.getElementById("chBar2").getContext('2d');
			var ctx3 = document.getElementById("chBar3").getContext('2d');
			var ctx4 = document.getElementById("chBar4").getContext('2d');
			var ctx5 = document.getElementById("chBar5").getContext('2d');
			var ctx6 = document.getElementById("chBar6").getContext('2d');
			var ctx7 = document.getElementById("chBar7").getContext('2d');
			var ctx8 = document.getElementById("chBar8").getContext('2d');
			var ctx9 = document.getElementById("chBar9").getContext('2d');
			var ctx10 = document.getElementById("chBar10").getContext('2d');

			//sample
			var densityData = {
				label : 'Density of Planet (kg/m3)',
				data : [ 5427, 5243, 5514, 3933, 1326, 687, 1271, 1638 ],
				backgroundColor : 'rgba(0, 99, 132, 0.6)',
				borderWidth : 0,
				yAxisID : "y-axis-density"
			};

			var gravityData = {
				label : 'Gravity of Planet (m/s2)',
				data : [ 3.7, 8.9, 9.8, 3.7, 23.1, 9.0, 8.7, 11.0 ],
				backgroundColor : 'rgba(99, 132, 0, 0.6)',
				borderWidth : 0,
				yAxisID : "y-axis-gravity"
			};

			var planetData = {
				labels : [ "Mercury", "Venus", "Earth", "Mars", "Jupiter",
						"Saturn", "Uranus", "Neptune" ],
				datasets : [ densityData, gravityData ]
			};

			var chartOptions = {
				scales : {
					xAxes : [ {
						barPercentage : 1,
						categoryPercentage : 0.6
					} ],
					yAxes : [ {
						id : "y-axis-density"
					}, {
						id : "y-axis-gravity"
					} ]
				}
			};

			var barChart = new Chart(ctx0, {
				type : 'bar',
				data : planetData,
				options : chartOptions
			});

			//left
			var myChart0 = new Chart(ctx0,
					{
						type : 'bar',
						data : {
							labels : label0,
							datasets : [ {
								label : label1,
								data : [ data1, data2, data3 ],
								backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(0, 0, 0, 0)',
										'rgba(255, 99, 132, 0.2)',
										'rgba(54, 162, 235, 0.2)' ],
								borderColor : [ 'rgba(255,99,132,1)',
										'rgba(54, 162, 235, 1)',
										'rgba(0, 0, 0, 0)',
										'rgba(255,99,132,1)',
										'rgba(54, 162, 235, 1)' ],
								borderWidth : 1
							} ]
						},
						options : {
							scales : {
								yAxes : [ {
									ticks : {
										beginAtZero : true
									}
								} ]
							}
						}
					});

			//right

			var _response = $('#noticeVal');
			var admin = new Object();

			$.ajax({
				type : 'GET', // method
				url : '/notice/noticeVal',
				//url       : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
				async : 'true', // true
				data : admin, // GET 요청은 지원되지 않습니다.
				processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
				contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
				cache : false,
				//dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
				success : function(data, status, xhr) {
					//alert("Login1 :: " + data);
					_response.html(data)
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});

		});
	</script>
</body>
</html>