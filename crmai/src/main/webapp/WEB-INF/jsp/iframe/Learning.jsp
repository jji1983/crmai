<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AI학습결과</title> 

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
  
   <!-- Select2 -->
  <link rel="stylesheet" href="/resources/bower_components/select2/dist/css/select2.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
   
  <style>
        #ds_campaign {border-collapse: collapse;}
        #ds_campaign td, #ds_campaign th{padding:20px;}
        #ds_campaign th{background-color: #ccc;}
         
        #ds_campaign tr.selected{background-color: navy;color: #fff; font-weight: bold;}
  </style>
  
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
  <!-- Select2 -->
  <script src="/resources/bower_components/select2/dist/js/select2.full.min.js"></script>
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
  <!-- DataTables -->
  <script src="/resources/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
  <script src="/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
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
  
  <script src="/resources/js/jquery.twbsPagination.min.js"></script>
	
  <script src="/resources/js/ai_learning_result.js"></script>

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
           AI학습결과
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">AI학습결과</li>
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
		            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		            <!-- <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button> -->
		          </div>
		        </div>
		        <!-- /.box-header -->
		        <div class="box-body">
		          <div class="row">
		            <div class="col-md-3">
					  <div class="form-group">
		                  <div class="col-sm-10">
		                    <label>캠페인명</label>
		                    <input type="text" class="form-control" id="cam_name" placeholder="캠페인명">
		                  </div>
   	                  </div>
   	                  <!-- /.form-group -->
   	                </div>
   	                <!-- /.col -->
   	                
   	                <div class="col-md-3">
   	                  <div class="form-group">
	                	<div class="col-sm-10">
	                		<label>캠페인목적</label>
	                		<select id="cam_type" class="form-control select2" style="width: 100%;" data-placeholder="Acquisition">
	                		<option selected="selected">ALL</option>
	                  		<option>Acquisition</option>
	                  		</select>
	                    </div>
		              </div>
					  <!-- /.form-group -->
		            </div>
		            <!-- /.col -->
		            
		            <div class="col-md-3">
		              <div class="form-group">
		                <div class="col-sm-10">
		                	<label>캠페인상태</label>
			                <select id="cam_status" class="form-control select2" style="width: 100%;" data-placeholder="캠페인상태">
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
                		   <label>생성자</label>
		                   <input type="text" class="form-control" id="adm_name" disabled>
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
		          <button type="button" onclick="newCampaignPage();" class="btn btn-info pull-right">검색</button>
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

   <!-- 학습모델 보기 -->
   <div class="row">
      <div class="col-xs-12">
         <div class="box">
			<div class="box-header">
	          <h3 class="box-title">학습모델</h3>
	          <div class="box-tools pull-right">
		          <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		          <!-- <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button> -->
		      </div>
	        </div>
	        <!-- /.box-header -->
	        
	        <div id="div_learning_result" class="box-body">
	            
	        </div>
	        <!-- /.box-body -->
	     </div>
      </div>
   </div>
   <!-- /.학습모델 보기 -->
   
   <!-- 항목별 중요도 보기 -->
   <div class="row">
	 <div class="col-xs-12">
        <div class="box">
			<div class="box-header">
	          <h3 class="box-title">항목별 중요도(TOP10)</h3>
	          <div class="box-tools pull-right">
		            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		            <!-- <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button> -->
		      </div>
	        </div>
	        <!-- /.box-header -->
	        
	        <div id="div_learning_weight" class="box-body">
	            
	        </div>
	    	<!-- /.box-body -->
	    </div>
	 </div>
   </div>
   <!-- /.항목별 중요도 보기 -->
   
</section>
<!-- /.Main content -->

</body>
</html>