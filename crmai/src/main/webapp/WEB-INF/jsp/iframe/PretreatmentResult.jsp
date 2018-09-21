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
								<div class="col-md-6">
									<div class="form-group">
										<div class="col-sm-10">
											<label for="cam_name">캠페인명</label> <input type="text" class="form-control" id="cam_name" placeholder="캠페인명">
										</div>
									</div>
									<!-- /.form-group -->

									<!-- form-group -->
									<div class="form-group">
										<div class="col-sm-10">
											<label for="cam_type">캠페인목적</label> <select id="cam_type"	class="form-control select2" style="width: 100%;">
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

								<div class="col-md-6">
									<!-- form-group -->
									<div class="form-group">
										<div class="col-sm-10">
											<label for="cam_status">캠페인상태</label> <select id="cam_status" class="form-control select2" style="width: 100%;">
												<option selected="selected">ALL</option>
												<option>시작</option>
												<option>종료</option>
											</select>
										</div>
									</div>
									<!-- /.form-group -->

									<!-- form-group -->
									<div class="form-group">
										<div class="col-sm-10">
											<label for="adm_id">생성자</label> <input type="text"	class="form-control" id="adm_id" placeholder="생성자">
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
							<button type="button" onclick="search_campaign();" class="btn btn-info pull-right">검색</button>
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
					<div class="box-body">
						<!-- campaign table -->
						<table id="ai_campaign" class="table table-bordered table-hover"></table>
					</div>
				</div>
			</div>
		</div>
		<!-- /.캠페인목록 -->
		
		<!-- 캠페인상세보기 -->
		<div id="detailView" class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">상세보기 (최대 100건 만 출력 됩니다.)</h3>
					</div>

					<!-- /.box-header -->
					<div class="box-body">
						<div class="col-sm-12">
							<button id="pretreatment_tobe_bt" type="button" class="btn btn-info pull-right">전처리결과</button>
							<button id="pretreatment_asis_bt" type="button" class="btn btn-success pull-right">원본데이터</button>
						</div>
						<!-- campaign table -->
						<table id="ai_campaignPretreatment" class="table table-bordered table-hover"></table>
					</div>
				</div>
			</div>
		</div>
		<!-- /.캠페인목록 -->

	</section>
	<!-- /.Main content -->

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
	
	<script type="text/javascript">
  
	var flag = '';
	
  $(document).ready(function () {
	
	//상세보기 화면 숨김
	$('#detailView').hide();
	
	
	/*큼릭시 low 값 가져옴.*/ 
    $("#ai_campaign tr").click(function(){
    	//alert("ai_campaign tr click ~~!!! ");
    	
 		// 현재 클릭된 Row(<tr>)
        var tr = $(this);
        var td = tr.children()

 	    // tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
        //alert("클릭한 Row의 모든 데이터 : "+tr.text());
 	    
        // td.eq(index)를 통해 값을 가져올 수도 있다.
		var cam_id = td.eq(0).text(); 
         
		//alert("cam_id : "+cam_id);
		
		if($.isNumeric(cam_id) == false){
			alert('숫자가 아닙니다. :: ' + cam_id );
			//상세보기 화면 숨김
			$('#detailView').hide();
			return;
		}else{
			
			flag = cam_id;
			//상세보기 화면 보이기
	     	$('#detailView').show();	
		}
		
		//search_campaignDetail(cam_id);
        
 	});
	

     
  });
  
  function search_campaign(){
	  	var campaign = new Object();
	  	campaign.cam_name = $('#cam_name').val();
	  	campaign.cam_type = $('#cam_type').val();
	  	if(campaign.cam_type == 'ALL'){
	  		campaign.cam_type = '';
	  	}
	  	campaign.cam_status = $('#cam_status').val();
	  	if(campaign.cam_status == 'ALL'){
	  		campaign.cam_status = '';
	  	}
	  	campaign.adm_id = $('#adm_id').val();
	    $.ajax({
	        type    : 'GET', // method
	        url     : '/Pretreatment/list',
	        //url       : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
	        async   : 'true', // true
	        data    : campaign, // GET 요청은 지원되지 않습니다.
	        processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
	        cache: false,
	        contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
	        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
	        success : function(data){
	        	
	        	var obj = JSON.stringify(data, true, 2);
	        	//alert("search_campaign result :: " + obj);
	        	
	        	grid_table_campaign(obj);
	        	
	        },
	        error : function(request,status,error){
	        	 //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});
  }
  
  function grid_table_campaign(obj){
	  //alert("grid_table_campaign :: " + obj);
	  var div = document.querySelector('#ai_campaign');
      
      html = '<table width="100%" class="table table-bordered table-hover">';
      html += '<thead><tr>';
      html += 	'<th>캠페인ID</th>';
      html += 	'<th>캠페인이름</th>';
      html += 	'<th>등록자</th>';
      html += 	'<th>캠페인목적</th>';
      html += 	'<th>캠페인상태</th>';
      html += 	'<th>AI진행상태</th>';
      html += 	'<th><center>AI버튼</center></th>';
      html += 	'<th>캠페인 등록일자</th>';
      html += 	'<th>설명</th>';
      html += 	'<th>메시지</th>';
      html += 	'<tr></thead>';
      html += '<tbody>';
      
      var json = $.parseJSON(obj);
   	  $(json).each(function(i,val){
   		html += '<tr>';
   		//html += '<td><input type="checkbox" name="camCheck"/></td>';
   		$.each(val,function(k,v){
   			flag = 0;
   			if(k == 'cam_id'){
   				html += '<td><center>' + v + '</center></td>';	
   			}
   			if(k == 'cam_name'){
   				html += '<td>' + v + '</td>';	
   			}
   			if(k == 'adm_id'){
   				html += '<td>' + v + '</td>';	
   			}
   			
   			if(k == 'cam_type'){
   				html += '<td>' + v + '</td>';	
   			}
   			
   			if(k == 'cam_status'){
   				html += '<td>' + v + '</td>';	
   			}
   			
   			if(k == 'cam_itype'){
   				if(v == '0'){
   					html += '<td><span class="label label-info">데이터 로딩 필요</span></td>';
   					html += '<td>';
   					html += '<button type="button" class="btn btn-info btn-xs">데이터등록</button>';
   					html += '</td>';
   				}
   				if(v == '1'){
   					html += '<td><span class="label label-warning">데이터 엑셀 로딩중</span></td>';
   					html += '<td></td>';
   				}
   				if(v == '2'){
   					html += '<td><span class="label label-warning">데이터 엑셀 처리중</span></td>';
   					html += '<td></td>';
   				}
   				if(v == '3'){
   					html += '<td><span class="label label-danger">데이터 엑셀 처리 오류</span></td>';
   					html += '<td>';
   					html += '<button type="button" class="btn btn-info btn-xs">데이터 재등록</button>';
   					html += '</td>';
   				}
   				if(v == '4'){
   					html += '<td><span class="label label-primary">데이터 엑셀 처리 종료</span></td>';
   					html += '<td>';
   					html += '<button type="button" class="btn btn-success btn-xs" onclick="search_campaignDetail();">학습데이터 보기</button>';
   					html += '<button type="button" class="btn btn-success btn-xs">전처리시작</button>';
   					html += '</td>';
   				}
   			}
   			if(k == 'cam_cdate'){
   				html += '<td>' + v + '</td>';	
   			}
   			if(k == 'cam_desc'){
   				html += '<td>' + v + '</td>';	
   			}
   			
   			if(k == 'cam_msg'){
   				
   				if(v == '' || v == null || v == 'null' ){
   					html += '<td></td>';
   				}else{
   					html += '<td>' + v + '</td>';
   				}
   			}
   		});
   		html += '</tr>';
  	  });
   	  
   	  html += '</tbody>';
      html += '</table>';
      
      div.innerHTML = html;
      
      tableDataRe();
  }

  
  $('#pretreatment_asis_bt').click(function(){
	  //alert("pretreatment_asis_bt :: " + flag);
	  
	  search_campaignDetail();
  });
  
  $('#pretreatment_tobe_bt').click(function(){
	  //alert("pretreatment_tobe_bt :: " + flag);
	  
	  search_campaignDetailResult();
  });
  
  
  function search_campaignDetail(){
	  
	  	cam_id = flag;
	  	//flag = cam_id;
	  
	  	var campaign = new Object();
	  	campaign.cam_id = cam_id;
	  	
	    $.ajax({
	        type    : 'GET', // method
	        url     : '/Pretreatment/detail',
	        //url       : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
	        async   : 'true', // true
	        data    : campaign, // GET 요청은 지원되지 않습니다.
	        processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
	        cache: false,
	        contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
	        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
	        success : function(data){
	        	
	        	var obj = JSON.stringify(data, true, 2);
	        	//alert("search_campaignDetail result :: " + obj);
	        	
	        	grid_tableStagingTrain(obj);
	        	
	        },
	        error : function(request,status,error){
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});
  }
  
  
  function search_campaignDetailResult(){
	  
	  	cam_id = flag;
	  
	  	var campaign = new Object();
	  	campaign.cam_id = cam_id;
	  	
	    $.ajax({
	        type    : 'GET', // method
	        url     : '/Pretreatment/detailResult',
	        //url       : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
	        async   : 'true', // true
	        data    : campaign, // GET 요청은 지원되지 않습니다.
	        processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
	        cache: false,
	        contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
	        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
	        success : function(data){
	        	
	        	var obj = JSON.stringify(data, true, 2);
	        	//alert("search_campaignDetail result :: " + obj);
	        	
	        	grid_tableStagingTrain(obj);
	        	
	        },
	        error : function(request,status,error){
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});
}
  
  function grid_tableStagingTrain(obj){
	  //alert("grid_table_campaign :: " + obj);
	  var div = document.querySelector('#ai_campaignPretreatment');
      
      html = '<table width="100%" class="table table-bordered table-hover">';
      html += '<thead><tr>';
      html += 	'<th>SEQ</th>';
      html += 	'<th>캠페인ID</th>';
      html += 	'<th>컬럼1</th>';
      html += 	'<th>컬럼2</th>';
      html += 	'<th>컬럼3</th>';
      html += 	'<th>컬럼4</th>';
      html += 	'<th>컴럼5</th>';
      html += 	'<th>컴럼6</th>';
      html += 	'<th>컴럼7</th>';
      html += 	'<th>컬럼8</th>';
      html += 	'<th>컬럼9</th>';
      html += 	'<th>컬럼10</th>';
      html += 	'<tr></thead>';
      html += '<tbody>';
      
      var json = $.parseJSON(obj);
   	  $(json).each(function(i,val){
   		html += '<tr>';
   		//html += '<td><input type="checkbox" name="camCheck"/></td>';
   		$.each(val,function(k,v){
   			
   			if(k == 'st_seq' || k == 'cam_id') {
   				html += '<td>' + v + '</td>';
   			}
   			
   			if(k == 'st_c1' 
   			 || k == 'st_c2'
   			 || k == 'st_c3'
   	   		 || k == 'st_c4'
   	   		 || k == 'st_c5'
   	   		 || k == 'st_c6'
   	   		 || k == 'st_c7'
   	   		 || k == 'st_c8'
   	   		 || k == 'st_c9'
   	   		 || k == 'st_c10'
   			){
   				html += '<td>' + v + '</td>';
   			}
   		});
   		html += '</tr>';
  	  });
   	  
   	  html += '</tbody>';
      html += '</table>';
      
      div.innerHTML = html;
      tableDataRe();
  }
  
  function tableDataRe(){

	  $('#ai_campaign').destroy();
      $('#ai_campaign').DataTable({
		      "aLengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]],
		      "pageLength"  : 5,
		      'paging'      : true,
		      'searching'   : true,
		      'destroy'     : true,
		      'autoWidth'   : true
	  });
	  
	   
	 $('#ai_campaignPretreatment').destroy();
	 $('#ai_campaignPretreatment').DataTable({
			 "aLengthMenu": [[10, 30, 50, -1], [10, 30, 50, "All"]],
		      "pageLength"  : 10,
		      'paging'      : true,
		      'searching'   : true,
		      'destroy'     : true,
		      'autoWidth'   : true
	  });
	  
  }
  
  // 60초에 한번씩 서버의 정보를 받아서 화면에 출력
  function startCallback() {
	  //setInterval("search_campaign();", 60000);
  }
    
  search_campaign();
  startCallback();
  
 </script>



</body>
</html>