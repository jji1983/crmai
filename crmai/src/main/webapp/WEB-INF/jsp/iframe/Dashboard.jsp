<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        Dashboard
        <small>Control panel</small>
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
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">
          <p id="noticeVal"></p>
        </div>
      </div>
      <!-- /.box -->
    </div>
	<!-- /.row -->  

	<!-- Info boxes -->
    <div class="row">
      <!-- Default box -->
      <div class="box">
          <div class="box-header with-border">
	          <h4 class="box-title">전체 실시간 현황</h4>
	
	          <div class="box-tools pull-right">
	            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
	              <i class="fa fa-minus"></i></button>
	            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
	              <i class="fa fa-times"></i></button>
	          </div>
         </div>
         <div class="box-body">
         
	        <div class="col-md-4 col-sm-6 col-xs-12">
	          <div class="info-box">
	            <span class="info-box-icon bg-aqua"><i class="ion ion-ios-gear-outline"></i></span>
	
	            <div class="info-box-content">
	              <span class="info-box-text" style="text-align:center">AI학습</span>
	              <span class="info-box-number" style="text-align:center">90<small>%</small></span>
	            </div>
	            <!-- /.info-box-content -->
	          </div>
	          <!-- /.info-box -->
	        </div>
	        <!-- /.col -->
	        <div class="col-md-4 col-sm-6 col-xs-12">
	          <div class="info-box">
	            <span class="info-box-icon bg-red"><i class="ion ion-ios-eye"></i></span>
	
	            <div class="info-box-content">
	              <span class="info-box-text" style="text-align:center">AI예측</span>
	              <span class="info-box-number" style="text-align:center">41,410</span>
	            </div>
	            <!-- /.info-box-content -->
	          </div>
	          <!-- /.info-box -->
	        </div>
	        <!-- /.col -->
	
	        <!-- fix for small devices only -->
	        <div class="clearfix visible-sm-block"></div>
	
	        <div class="col-md-4 col-sm-6 col-xs-12">
	          <div class="info-box">
	            <span class="info-box-icon bg-green"><i class="ion ion-ios-cart-outline"></i></span>
	
	            <div class="info-box-content">
	              <span class="info-box-text" style="text-align:center">AI결과</span>
	              <span class="info-box-number" style="text-align:center">760</span>
	            </div>
	            <!-- /.info-box-content -->
	          </div>
	          <!-- /.info-box -->
	        </div>
	        
	            
         </div>
         <!-- /.box -->
      </div>
      <!-- /.box -->
    </div>
    <!-- /.row -->

	<!-- Info boxes -->
    <div class="row">
    
	    <div class="col-md-3">
			<!-- BAR CHART -->
		    <div class="box box-success">
		     
		      <div class="box-header with-border">
		        <h3 class="box-title">캠페인 예측율 증가 학습</h3>
		
		        <div class="box-tools pull-right">
		          <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
		          </button>
		          <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
		        </div>
		      </div>
		      <div class="box-body">
		        <div class="chart">
		          <canvas id="chBar1" style="height:230px"></canvas>
		        </div>
		      </div>
		      <!-- /.box-body -->
		    </div>
		    <!-- /.box -->
	   	</div>
	   
	   	<div class="col-md-3">
			<!-- BAR CHART -->
		    <div class="box box-success">
		     
		      <div class="box-header with-border">
		        <h3 class="box-title">캠페인 예측율 증가 학습</h3>
		
		        <div class="box-tools pull-right">
		          <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
		          </button>
		          <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
		        </div>
		      </div>
		      <div class="box-body">
		        <div class="chart">
		          <canvas id="chBar2" style="height:230px"></canvas>
		        </div>
		      </div>
		      <!-- /.box-body -->
		    </div>
		    <!-- /.box -->
	   	</div>
	   
	   	<div class="col-md-3">
			<!-- BAR CHART -->
		    <div class="box box-success">
		     
		      <div class="box-header with-border">
		        <h3 class="box-title">캠페인 예측율 증가 학습</h3>
		
		        <div class="box-tools pull-right">
		          <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
		          </button>
		          <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
		        </div>
		      </div>
		      <div class="box-body">
		        <div class="chart">
		          <canvas id="chBar3" style="height:230px"></canvas>
		        </div>
		      </div>
		      <!-- /.box-body -->
		    </div>
		    <!-- /.box -->
	   	</div>
	   
	   	<div class="col-md-3">
			<!-- BAR CHART -->
		    <div class="box box-success">
		     
		      <div class="box-header with-border">
		        <h3 class="box-title">캠페인 예측율 증가 학습</h3>
		
		        <div class="box-tools pull-right">
		          <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
		          </button>
		          <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
		        </div>
		      </div>
		      <div class="box-body">
		        <div class="chart">
		          <canvas id="chBar4" style="height:230px"></canvas>
		        </div>
		      </div>
		      <!-- /.box-body -->
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
<script src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- ChartJS -->
<!-- <script src="/resources/bower_components/Chart.js/Chart.js"></script> -->
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

<!-- MDB charts ADD -->
<script src="/resources/js/chart.js"></script>

<!-- page script -->
<script>
$(function () {
	
	var label1 = '# 예측율 증가 학습';
	var label2 = '# 예측율 감소 학습';
	var label3 = '# 수행율 증가 학습';
	var label4 = '# 수행율 감소 학습';
	
	var label0 = ["학습전", "학습전"," ", "학습후", "학습후"]
	
	var data1 = [42, 59, 0, 139, 150];
	var data2 = [91, 70, 0, 128, 84];
	var data3 = [42, 59, 0, 139, 150];
	var data4 = [91, 70, 0, 128, 84];
	
	var ctx1 = document.getElementById("chBar1").getContext('2d');
	var ctx2 = document.getElementById("chBar2").getContext('2d');
	var ctx3 = document.getElementById("chBar3").getContext('2d');
	var ctx4 = document.getElementById("chBar4").getContext('2d');
	
	var myChart1 = new Chart(ctx1, {
	    type: 'bar',
	    data: {
	        labels: label0,
	        datasets: [{
	            label: label1,
	            data: data1,
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(0, 0, 0, 0)',
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(0, 0, 0, 0)',
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        }
	    }
	});
	
	var myChart2 = new Chart(ctx2, {
	    type: 'bar',
	    data: {
	        labels: label0,
	        datasets: [{
	            label: label2,
	            data: data2,
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(0, 0, 0, 0)',
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(0, 0, 0, 0)',
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        }
	    }
	});
	
	var myChart3 = new Chart(ctx3, {
	    type: 'bar',
	    data: {
	        labels: label0,
	        datasets: [{
	            label: label3,
	            data: data3,
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(0, 0, 0, 0)',
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(0, 0, 0, 0)',
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        }
	    }
	});
	
	var myChart4 = new Chart(ctx4, {
	    type: 'bar',
	    data: {
	        labels: label0,
	        datasets: [{
	            label: label4,
	            data: data4,
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(0, 0, 0, 0)',
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(0, 0, 0, 0)',
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        }
	    }
	});
	

	var _response = $('#noticeVal');
	var admin = new Object();

	    $.ajax({
	        type    : 'GET', // method
	        url     : '/notice/noticeVal',
	        //url       : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
	        async   : 'true', // true
	        data    : admin, // GET 요청은 지원되지 않습니다.
	        processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
	        contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
	        cache: false,
	        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
	        success : function(data, status, xhr){
	        		//alert("Login1 :: " + data);
	        		_response.html(data)
	        },
	        error   : function(request,status,error){
	        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});

	
});
</script>
</body>
</html>