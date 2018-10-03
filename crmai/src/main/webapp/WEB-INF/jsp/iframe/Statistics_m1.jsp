<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <script type="text/javascript">
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
       	 선정대상에 대한 실질반응1
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">선정대상에 대한 실질반응1</li>
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
			              		<label for="cam_name">캠페인명</label> <input type="text" class="form-control" id="cam_name" placeholder="캠페인명">
			              	</div>
			              </div>
			            </div>
			            <!-- /.col -->
			            <div class="col-md-3">
			              <div class="form-group">
			              	<div class="col-sm-10">
			              		<label for="cam_type">캠페인목적</label>
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
			              		<label for="cam_status">캠페인상태</label>
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
			              		<label for="const">생성자</label> <input type="text" class="form-control" id="const" placeholder="생성자">
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
			              		<label for="lv1_learn">1단계 학습 모델</label>
			              		<select id="lv1_learn" class="form-control select2" style="width: 100%;">
									<option selected="selected">ALL</option>
									<option>의사결정나무</option>
									<option>Random Forest</option>
									<option>SVM</option>
									<option>선형회귀</option>
								</select>
			              	</div>
			              </div>
			            </div>
			            <!-- /.col -->
			            <div class="col-md-4">
			              <div class="form-group">
			              	<div class="col-sm-10">
			              		<label for="lv2_learn">2단계 학습 모델</label>
			              		<select id="lv2_learn" class="form-control select2" style="width: 100%;">
									<option selected="selected">ALL</option>
									<option>의사결정나무</option>
									<option>Random Forest</option>
									<option>SVM</option>
									<option>선형회귀</option>
								</select>
			              	</div>
			              </div>
			            </div>
			            <!-- /.col -->
			            <div class="col-md-4">
			              <div class="form-group">
			              	<div class="col-sm-10">
			              		<label for="feature">Feature</label> <input type="text" class="form-control" id="feature" placeholder="Feature">
			              	</div>
			              </div>
			            </div>
			            <!-- /.col -->
			          </div>
			          <!-- /.row -->
			        </div>
			        <!-- /.box-body -->
			        
			        <div class="box-footer">
						<button type="button" onclick="search_campaign();" class="btn btn-info pull-right">상세조회</button>
					</div>
					<!-- /.box-footer -->
					
					<div id="div_table" class="box-body">
			          <table id="cam_table" class="table table-bordered table-hover">
			          	<thead>
			          	  <tr>
			          	  	<th class="text-center">학습모델</th>
			          	  	<th class="text-center">캠페인 코드</th>
			          	  	<th class="text-center">캠페인명</th>
			          	  	<th class="text-center">캠페인 목적</th>
			          	  	<th class="text-center">캠페인 상태</th>
			          	  	<th class="text-center">시작일자</th>
			          	  	<th class="text-center">종료일자</th>
			          	  	<th class="text-center">생성자</th>
			          	  	<th class="text-center">생성일자</th>
			          	  	<th class="text-center">수정일자</th>
			          	  	<th class="text-center">대상건수</th>
			          	  </tr>
			          	</thead>
			          	<tbody>
			          	  <tr>
			          	  	<td></td>
			          	  	<td></td>
			          	  	<td></td>
			          	  	<td></td>
			          	  	<td></td>
			          	  	<td></td>
			          	  	<td></td>
			          	  	<td></td>
			          	  	<td></td>
			          	  	<td></td>
			          	  	<td></td>
			          	  </tr>
			          	</tbody>
			          </table>
			        </div>
			        <!-- /.box-body, table -->
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
              <h3 class="box-title">학습모델 성공율</h3>

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
	  	
	  	<div class="col-md-6">
          <!-- LINE CHART -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">학습모델 정확도</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <!-- <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="lineChart" style="height:270px"></canvas>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
	  </div>  
	  <!-- /.row -->
    </section>
     <!-- /.content -->


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
$(function() {
	// 임시로 테이블 안 보이게 처리, 데이터 확정 시 조건에 따라 변경 예정
	$("#div_table").css("display", "none");
	
	var areaChartData = {
		labels  : ["9월 기가지니", "8월 기가지니", "7월 기가지니"],
		datasets: [
		    {
		       label               : '2단계',
		       fillColor           : 'rgba(210, 214, 222, 1)',
		       strokeColor         : 'rgba(210, 214, 222, 1)',
		       pointColor          : 'rgba(210, 214, 222, 1)',
		       pointStrokeColor    : '#c1c7d1',
		       pointHighlightFill  : '#fff',
		       pointHighlightStroke: 'rgba(220,220,220,1)',
		       data                : [70, 75, 55]
		    },
		    {
		       label               : '1단계',
		       fillColor           : 'rgba(60,141,188,0.9)',
		       strokeColor         : 'rgba(60,141,188,0.8)',
		       pointColor          : '#3b8bba',
		       pointStrokeColor    : 'rgba(60,141,188,1)',
		       pointHighlightFill  : '#fff',
		       pointHighlightStroke: 'rgba(60,141,188,1)',
		       data                : [55, 65, 68]
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
    //- LINE CHART -
    //--------------
    var lineChartCanvas          = $('#lineChart').get(0).getContext('2d');
    var lineChart                = new Chart(lineChartCanvas);
    var lineChartOptions         = areaChartOptions;
    
    lineChartOptions.datasetFill = false;
    lineChart.Line(areaChartData, lineChartOptions);
});
</script>
</body>
</html>