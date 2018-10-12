<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전처리결과</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="/resources/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="/resources/bower_components/Ionicons/css/ionicons.min.css">
<!-- DataTables -->
  <link rel="stylesheet" href="/resources/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
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

<!-- Select2 -->
<link rel="stylesheet" href="/resources/bower_components/select2/dist/css/select2.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"></link>

<!-- jQuery 3 -->
<script src="/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="/resources/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="/resources/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/dist/js/demo.js"></script>

<script src="/resources/js/jquery.twbsPagination.min.js"></script>
	
<script src="/resources/js/ai_preprocess_result.js"></script>

<script type="text/javascript">
$(function() {
	$("#adm_name").val($("input[name='session_name']", parent.document).val());
	
	newCampaignPage();
});
</script>
	
</head>
<body class="hold-transition skin-blue sidebar-mini">

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			전처리결과 <small>Control panel</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/iframe/Dashboard"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">전처리결과</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">

		<!-- Search -->
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box box-default">
						<div class="box-header with-border">
							<h3 class="box-title">검색창</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
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
									<!-- /.form-group -->
								</div>
								<!-- /.col -->

								<div class="col-md-3">
									<div class="form-group">
										<div class="col-sm-10">
											<label>캠페인목적</label> <select id="cam_type"	class="form-control select2" style="width: 100%;">
												<option selected="selected">ALL</option>
												<option>Acquisition</option>
												<option>Retention</option>
												<option>Cultivation</option>
												<option>KeepCare</option>
											</select>
										</div>
									</div>
									<!-- /.form-group -->
								</div>
								<!-- /.col -->

								<div class="col-md-3">
									<div class="form-group">
										<div class="col-sm-10">
											<label>캠페인상태</label> <select id="cam_status" class="form-control select2" style="width: 100%;">
												<option selected="selected">ALL</option>
												<option>시작</option>
												<option>종료</option>
											</select>
										</div>
									</div>
									<!-- /.form-group -->
								</div>
								<!-- /.col -->

								<div class="col-md-3">
									<div class="form-group">
										<div class="col-sm-10">
											<label>생성자</label> <input type="text"	class="form-control" id="adm_name" disabled>
										</div>
									</div>
									<!-- /.form-group -->
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->
						</div>
						<!-- /.box-body -->
						<div class="box-footer">
							<button type="button" onclick="newSearchCampaign();" class="btn btn-info pull-right">검색</button>
						</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
		</div>
		<!-- /.Search -->

		<!-- 캠페인목록 -->
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">캠페인 목록</h3>
					</div>

					<!-- /.box-header -->
					<div id="div_campaign" class="box-body">
						
					</div>
					<div class="text-center">
			        	<ul class="pagination-sm" id="pagination_cam"></ul>
			        </div>
				</div>
			</div>
		</div>
		<!-- /.캠페인목록 -->
		
		<!-- 전처리목록 -->
		<div class="row">
	       <div class="col-xs-12">
	         <div class="box">
				<div class="box-header">
		          <h3 class="box-title">전처리데이터 상세보기</h3>
		        </div>
		        
		        <div class="box-body">
		          <div class="row">
		          	<div class="col-md-2">
		          		<span id="id_span_msg" class="label label-success"></span>
		          	</div>
		          	<div class="col-md-2"></div>
		          	<div class="col-md-2">
		          	  <div class="form-group">
		          		<button id="pre_learning" type="button" class="btn btn-block btn-primary" onclick="choiceData(1);">학습데이터전처리전</button>
		          	  </div>
		          	</div>
		          	<div class="col-md-2">
		          	  <div class="form-group">
		          		<button id="post_learning" type="button" class="btn btn-block btn-info" onclick="choiceData(3);">학습데이터전처리후</button>
		          	  </div>
		          	</div>
		          	<div class="col-md-2">
		          	  <div class="form-group">
		          		<button id="pre_client" type="button" class="btn btn-block btn-primary" onclick="choiceData(2);">대상자데이터전처리전</button>
		          	  </div>
		          	</div>
		          	<div class="col-md-2">
		          	  <div class="form-group">
		          		<button id="post_client" type="button" class="btn btn-block btn-info" onclick="choiceData(4);">대상자데이터전처리후</button>
		          	  </div>
		          	</div>
		          </div>
		        </div>
		        
		        <div id="div_preprocess" class="box-body">
		          
		        </div>
		        <div class="text-center">
		        	<ul class="pagination-sm" id="pagination_preprocess"></ul>
		        </div>
		     </div>
		   </div>
		</div>
		<!-- /.전처리목록 -->

	</section>
	<!-- /.Main content -->

</body>
</html>