<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선정대상에 대한 실질반응</title>

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
<!-- ChartJS -->
<script src="/resources/bower_components/chart.js/Chart.js"></script>
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


  <script type="text/javascript">
  	!function(a) {
		a.fn.datepicker.dates.kr = {
		    days : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
		    daysShort : [ "일", "월", "화", "수", "목", "금", "토" ],
		    daysMin : [ "일", "월", "화", "수", "목", "금", "토" ],
		    months : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월",
		        "11월", "12월" ],
		    monthsShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월",
		        "10월", "11월", "12월" ],
		    titleFormat : "yyyy년 MM" /* Leverages same syntax as 'format' */
		}
  	}(jQuery);

  	$(function() {
		$("#before_date").css("cursor", "pointer");
		$("#after_date").css("cursor", "pointer");
		
		$("#before_date").datepicker({
			format: "yyyy-mm-dd",
			language: "kr",
		    autoclose : true,
		    todayHighlight : true              
	    }).on('hide', function(e) {
	      e.stopPropagation(); // 모달 팝업도 같이 닫히는걸 막아준다.
	    });
		
		$("#after_date").datepicker({
			format: "yyyy-mm-dd",
			language: "kr",
		    autoclose : true,
		    todayHighlight : true          
	    }).on('hide', function(e) {
	      e.stopPropagation(); // 모달 팝업도 같이 닫히는걸 막아준다.
	    });
		
		search_statistics();	// 처음에 불러오기
  	});
  
  	function Content_Learning() {
		//alert("call Content_Learning!!");
		document.getElementById("main_frame").src = "/Learning/data";
	}
	
	function search_statistics() {
		$.ajax({
			url:"/statistics/list",
			data:{
				camName : $("#cam_name").val(),
				camType : $("#cam_type").val(),
				camStatus : $("#cam_status").val(),
				admName : $("#const").val(),
				beforeDate : $("#before_date").val(),
				afterDate : $("#after_date").val()
			},
			success:function(data) {
				createTable(data);
				createChart(data);
			}
		});
	}
	
	function createTable(arr) {
		var html = "<table id='cam_table' class='table table-bordered table-hover'>";
		
		html += "<thead><tr><th class='text-center'>캠페인명</th>";
		html += "<th class='text-center'>캠페인 목적</th>";
		html += "<th class='text-center'>캠페인 상태</th>";
		html += "<th class='text-center'>생성자</th>";
		html += "<th class='text-center'>생성일자</th>";
		html += "<th class='text-center'>대상건수</th>";
		html += "<th class='text-center'>정확도</th>";
		html += "<th class='text-center'>학습모델</th>";
		html += "<th class='text-center'>예측</th>";
		html += "<th class='text-center'>결과</th>";
		html += "<th class='text-center'>산업군</th>";
		html += "<th class='text-center'>생성자ID</th>";
		html += "<th class='text-center'>캠페인ID</th></tr></thead><tbody>";
		
		// 데이터 존재 미존재 여부에 따른 표 표시
		if(arr.length != 0) {
			for (var i = 0; i < arr.length; i++) {
				html += "<tr><td>" + arr[i]["camName"] + "</td>";
				html += "<td>" + arr[i]["camType"] + "</td>";
				html += "<td>" + arr[i]["camStatus"] + "</td>";
				html += "<td>" + arr[i]["admName"] + "</td>";
				html += "<td>" + arr[i]["camCdate"] + "</td>";
				html += "<td>" + arr[i]["testCnt"] + "</td>";
				html += "<td>" + arr[i]["originalAcc"] + "</td>";
				html += "<td>" + arr[i]["trainMethod"] + "</td>";
				html += "<td>" + arr[i]["soAcc"] + "</td>";
				html += "<td>" + arr[i]["realAcc"] + "</td>";
				html += "<td>" + arr[i]["admType"] + "</td>";
				html += "<td>" + arr[i]["admId"] + "</td>";
				html += "<td>" + arr[i]["camId"] + "</td></tr>";
			}
		} else {
			html += "<tr><td class='text-center' colspan='13'>조회된 데이터가 없습니다.</td></tr>";
		}
		
  	  	html += "</tbody></table>";
  	  	
  	  	$("#div_table").html(html);					// innerHtml jquery버전
	}
	
	function createChart(arr) {
		var camNameArr = new Array();			// 캠페인명 배열
		var originalAccArr = new Array();		// 정확도 배열
		var soAccArr = new Array();				// 예측 배열
		var realAccArr = new Array();			// 결과 배열
		var trainMethodArr = new Array();		// 학습모델 배열
		
		for (var i = 0; i < arr.length; i++) {
			camNameArr[i] = arr[i]["camName"];
			originalAccArr[i] = arr[i]["originalAcc"];
			soAccArr[i] = arr[i]["soAcc"];
			realAccArr[i] = arr[i]["realAcc"];
			trainMethodArr[i] = arr[i]["trainMethod"];
		}
		
		var areaChartData = {
				labels : camNameArr,
				datasets: [
				    {
				       label               : '정확도',
				       fillColor           : 'rgba(210, 214, 222, 1)',
				       strokeColor         : 'rgba(210, 214, 222, 1)',
				       pointColor          : 'rgba(210, 214, 222, 1)',
				       pointStrokeColor    : '#c1c7d1',
				       pointHighlightFill  : '#fff',
				       pointHighlightStroke: 'rgba(220,220,220,1)',
				       data                : originalAccArr
				    },
				    {
				       label               : '예측',
				       fillColor           : 'rgba(60,141,188,0.9)',
				       strokeColor         : 'rgba(60,141,188,0.8)',
				       pointColor          : '#3b8bba',
				       pointStrokeColor    : 'rgba(60,141,188,1)',
				       pointHighlightFill  : '#fff',
				       pointHighlightStroke: 'rgba(60,141,188,1)',
				       data                : soAccArr
				    },
				    {
					   label               : '결과',
					   fillColor           : 'rgba(60,141,188,0.9)',
					   strokeColor         : 'rgba(60,141,188,0.8)',
					   pointColor          : '#3b8bba',
					   pointStrokeColor    : 'rgba(60,141,188,1)',
					   pointHighlightFill  : '#fff',
					   pointHighlightStroke: 'rgba(60,141,188,1)',
					   data                : realAccArr
					}
				]
		};
		
		var radarChartData = {
				labels : trainMethodArr,
				datasets: [
				    {
				       label               : '정확도',
				       fillColor           : 'rgba(210, 214, 222, 1)',
				       strokeColor         : 'rgba(210, 214, 222, 1)',
				       pointColor          : 'rgba(210, 214, 222, 1)',
				       pointStrokeColor    : '#c1c7d1',
				       pointHighlightFill  : '#fff',
				       pointHighlightStroke: 'rgba(220,220,220,1)',
				       data                : originalAccArr
				    },
				    {
				       label               : '예측',
				       fillColor           : 'rgba(60,141,188,0.9)',
				       strokeColor         : 'rgba(60,141,188,0.8)',
				       pointColor          : '#3b8bba',
				       pointStrokeColor    : 'rgba(60,141,188,1)',
				       pointHighlightFill  : '#fff',
				       pointHighlightStroke: 'rgba(60,141,188,1)',
				       data                : soAccArr
				    },
				    {
					   label               : '결과',
					   fillColor           : 'rgba(60,141,188,0.9)',
					   strokeColor         : 'rgba(60,141,188,0.8)',
					   pointColor          : '#3b8bba',
					   pointStrokeColor    : 'rgba(60,141,188,1)',
					   pointHighlightFill  : '#fff',
					   pointHighlightStroke: 'rgba(60,141,188,1)',
					   data                : realAccArr
					}
				]
		};
			
		//-------------
		//- BAR CHART -
		//-------------
		var barChartCanvas                   = $('#barChart').get(0).getContext('2d');
		var barChart                         = new Chart(barChartCanvas);
		var barChartData                     = areaChartData;
		    
		barChartData.datasets[1].fillColor   = '#00a65a';
		barChartData.datasets[1].strokeColor = '#00a65a';
		barChartData.datasets[1].pointColor  = '#00a65a';
		    
		var barChartOptions                  = {
		      //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
		      scaleBeginAtZero        : true,
		      //Boolean - Whether grid lines are shown across the chart
		      scaleShowGridLines      : true,
		      //String - Colour of the grid lines
		      scaleGridLineColor      : 'rgba(0,0,0,.05)',
		      //Number - Width of the grid lines
		      scaleGridLineWidth      : 1,
		      //Boolean - Whether to show horizontal lines (except X axis)
		      scaleShowHorizontalLines: true,
		      //Boolean - Whether to show vertical lines (except Y axis)
		      scaleShowVerticalLines  : true,
		      //Boolean - If there is a stroke on each bar
		      barShowStroke           : true,
		      //Number - Pixel width of the bar stroke
		      barStrokeWidth          : 2,
		      //Number - Spacing between each of the X value sets
		      barValueSpacing         : 5,
		      //Number - Spacing between data sets within X values
		      barDatasetSpacing       : 1,
		      //String - A legend template
		      //Boolean - whether to make the chart responsive
		      responsive              : true,
		      maintainAspectRatio     : true
		};
		    
		var areaChartOptions = {
		        //Boolean - If we should show the scale at all
		    	showScale               : true,
		    	//Boolean - Whether grid lines are shown across the chart
		    	scaleShowGridLines      : false,
		    	//String - Colour of the grid lines
		    	scaleGridLineColor      : 'rgba(0,0,0,.05)',
		    	//Number - Width of the grid lines
		    	scaleGridLineWidth      : 1,
		    	//Boolean - Whether to show horizontal lines (except X axis)
		    	scaleShowHorizontalLines: true,
		    	//Boolean - Whether to show vertical lines (except Y axis)
		    	scaleShowVerticalLines  : true,
		    	//Boolean - Whether the line is curved between points
		    	bezierCurve             : true,
		    	//Number - Tension of the bezier curve between points
		    	bezierCurveTension      : 0.3,
		    	//Boolean - Whether to show a dot for each point
		    	pointDot                : false,
		    	//Number - Radius of each point dot in pixels
		    	pointDotRadius          : 4,
		    	//Number - Pixel width of point dot stroke
		    	pointDotStrokeWidth     : 1,
		    	//Number - amount extra to add to the radius to cater for hit detection outside the drawn point
		    	pointHitDetectionRadius : 20,
		    	//Boolean - Whether to show a stroke for datasets
		    	datasetStroke           : true,
		    	//Number - Pixel width of dataset stroke
		    	datasetStrokeWidth      : 2,
		    	//Boolean - Whether to fill the dataset with a color
		    	datasetFill             : true,
		    	//Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
		    	maintainAspectRatio     : true,
		    	//Boolean - whether to make the chart responsive to window resizing
		    	responsive              : true
		}

		barChartOptions.datasetFill = false;
		barChart.Bar(barChartData, barChartOptions);
		
		//-------------
	    //- RADAR CHART -
	    //-------------
	    var radarChartCanvas = $('#radarChart').get(0).getContext('2d');
		var radarChart = new Chart(radarChartCanvas);
		
		radarChart.Radar(radarChartData, barChartOptions);
	}
  </script>

</head>
<body class="hold-transition skin-blue sidebar-mini">

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       	 선정대상에 대한 실질반응3
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">선정대상에 대한 실질반응3</li>
      </ol>
    </section>
    
    <!-- Main content -->
    <section class="content">
      <div class="row">
	   	<div class="col-xs-12">
			<div class="box">
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title">검색창</h3>

						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
							</button>
						<!-- <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button> -->
						</div>
					</div>
					<!-- /.box-header -->
					
					<div class="box-body">
			          <div class="row">
			            <div class="col-md-3">
			              <div class="form-group">
			              	<div class="col-sm-10">
			              		<label>캠페인명</label> <input type="text" class="form-control" id="cam_name" placeholder="캠페인명">
			              	</div>
			              </div>
			            </div>
			            <!-- /.col -->
			            <div class="col-md-3">
			              <div class="form-group">
			              	<div class="col-sm-10">
			              		<label>캠페인목적</label>
			              		<select id="cam_type" class="form-control select2" style="width: 100%;">
									<option selected="selected">ALL</option>
									<option>Acquisition</option>
									<option>Retention</option>
									<option>Cultivation</option>
									<option>KeepCare</option>
								</select>
			              	</div>
			              </div>
			            </div>
			            <!-- /.col -->
			            <div class="col-md-3">
			              <div class="form-group">
			              	<div class="col-sm-10">
			              		<label>캠페인상태</label>
			              		<select id="cam_status" class="form-control select2" style="width: 100%;">
									<option selected="selected">ALL</option>
									<option>시작</option>
									<option>종료</option>
								</select>
			              	</div>
			              </div>
			            </div>
			            <!-- /.col -->
			            <div class="col-md-3">
			              <div class="form-group">
			              	<div class="col-sm-10">
			              		<label>생성자</label> <input type="text" class="form-control" id="const" placeholder="생성자">
			              	</div>
			              </div>
			            </div>
			            <!-- /.col -->
			          </div>
			          <!-- /.row -->
			          
			          <div class="row">
			          	<div class="col-md-4">
			              <div class="form-group">
			              	<div class="col-sm-10">
			              		<label for="">기간</label>
			              		<div class="input-group date">
				                  <input type="text" class="form-control" id="before_date">
				                  <div class="input-group-addon">
				                    <i class="fa fa-calendar"></i>
				                  </div>
				                  <input type="text" class="form-control" id="after_date">
				                  <div class="input-group-addon">
				                    <i class="fa fa-calendar"></i>
				                  </div>
				                </div>
				                <!-- /.input group -->
			              	</div>
			              </div>
			              <!-- /.form group -->
			            </div>
			          </div>
			          <!-- /.row -->
			        </div>
			        <!-- /.box-body -->
			        
			        <div class="box-footer">
						<button type="button" onclick="search_statistics();" class="btn btn-info pull-right">조회</button>
					</div>
					<!-- /.box-footer -->
					
					<div id="div_table" class="box-body">
			          
			        </div>
			        <!-- /.box-body, 통계 table -->
				</div>
			</div>
			<!-- /.box -->
		</div>
	  </div>
	  <!-- /.row -->
	  
	  <div class="row">
	  	<div class="col-md-6">
	  	  <!-- BAR CHART -->
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">캠페인별 정확도 예측 결과</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <!-- <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="barChart" style="height:270px"></canvas>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
	  	</div>
	  	<!-- /.col -->
	  	
	  	<!-- RADAR CHART -->
	  	<div class="col-md-6">
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">학습모델별 정확도 예측 결과</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <!-- <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
              </div>
            </div>
            <div class="box-body">
              <canvas id="radarChart" style="height:270px"></canvas>
            </div>
            <!-- /.box-body -->
          </div>
        </div>
        <!-- /.box -->
	  </div>  
	  <!-- /.row -->   
    </section>
     <!-- /.content -->

</body>
</html>