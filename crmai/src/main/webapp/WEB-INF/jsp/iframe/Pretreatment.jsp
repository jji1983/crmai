<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전처리수행</title>
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
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="/resources/dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

</head>
<body class="hold-transition skin-blue sidebar-mini">


	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			대상자 로딩 <small>Control panel</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/iframe/Dashboard"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">대상자 로딩</li>
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
						<table id="ai_campaign"
							class="table table-bordered table-hover text-center"></table>

						<!-- Button trigger modal -->
						<div class="box-footer">
							<button id='newBtn' type="button" class="btn btn-info pull-right"
								data-toggle="modal" data-target="#newModal">캠페인 신규등록</button>
							&nbsp;
						</div>


						<!-- Modal -->
						<div class="modal fade" id="newModal" tabindex="-1" role="dialog"
							aria-labelledby="newModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="newModalLabel">캠페인 신규 생성</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<!-- form start -->
										<form class="form-horizontal" id="newUploadForm"
											action="fileUpload" method="post"
											enctype="multipart/form-data">
											<div class="box-body">

												<input type="hidden" id="user_id" name="user_id"
													value=<%=session.getAttribute("sessionID") %>>

												<div class="form-group">
													<label for="inputCamName" class="col-sm-2 control-label">캠페인명</label>

													<div class="col-sm-10">
														<input id="inputCamName" name="inputCamName" type="text"
															class="form-control" placeholder="캠페인명">
													</div>
												</div>

												<div class="form-group">
													<label for="inputCamDesc" class="col-sm-2 control-label">설명</label>

													<div class="col-sm-10">
														<input id="inputCamDesc" name="inputCamDesc" type="text"
															class="form-control" placeholder="설명">
													</div>
												</div>

												<div class="form-group">
													<label for="cam_type" class="col-sm-2 control-label">목적</label>
													<div class="col-sm-10">
														<select id="cam_type" name="cam_type"
															class="form-control select2" style="width: 100%;">
															<option selected="selected">Acquisition</option>
															<option>Retention</option>
															<option>Cultivation</option>
															<option>KeepCare</option>
														</select>
													</div>
												</div>
												
												<div class="form-group">
													<label for="cam_autoyn" class="col-sm-2 control-label">AI처리</label>
													<div class="col-sm-10">
														<select id="cam_autoyn" name="cam_autoyn"
															class="form-control select2" style="width: 100%;">
															<option value="Y" selected="selected">자동</option>
															<option value="N" >수동</option>
														</select>
													</div>
												</div>												
												

												<div class="form-group">
													<label for="InputFile" class="col-sm-2 control-label">파일 등록(학습CSV)</label>
													<div class="col-sm-10">
														<input type="file" name="file" id="InputFile" accept=".csv">
													</div>
												</div>

											</div>
											<!-- /.box-body -->
											<div class="box-footer">
												<button id="bthNew" type="submit" class="btn btn-primary">등록</button>
												<button id="bthClose" type="button"	class="btn btn-secondary" data-dismiss="modal">Close</button>
											</div>
											<!-- /.box-footer -->
										</form>
									</div>
									<div class="modal-footer">캠페인등록화면</div>
								</div>
							</div>
						</div>
						<!--/. Modal -->

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
  
  
  $(document).ready(function () {
    
  	//체크 박스 체크 시.
  	var tbl = $("#ai_campaign");
    //radio버튼처럼 Checkbox name값 설정
    $('input[type="checkbox"][name="camCheck"]').click(function(){
  	 //click이벤트가 발생했는지 체크
  	 if($(this).prop('checked')){
  		//checkbox 전체를 checked 해제후 click한 요소만 true지정
  		$('input[type="checkbox"][name="camCheck"]').prop('checked', false);
  		$(this).prop('checked',true);
  	 }
    });
    
    //모달 처리(신규).
    $("#bthNew").click(function(event) {
    	//stop submit the form, we will post it manually.
        event.preventDefault();
    	
        //alert('클릭 신규~!!');
        
        submit_newCampagin();
        
    });
    
  });
  
  function submit_newCampagin(){
	//alert('-- submit_newCampagin -- ');
	  
	// Get form
    var form = $('#newUploadForm')[0];
    var data = new FormData(form);
    $("#bthNew").prop("disabled", true);
    $("bthClose").prop("disabled", true);
    
    
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/file/Upload_Pretreatment",
        data: data,
        //http://api.jquery.com/jQuery.ajax/
        //https://developer.mozilla.org/en-US/docs/Web/API/FormData/Using_FormData_Objects
        processData: false, //prevent jQuery from automatically transforming the data into a query string
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (data) {
        	//alert(data);
            //console.log("SUCCESS : ", data);
            $("#bthNew").prop("disabled", false);
            
            //alert('모달 종료.');
            form.reset();
            $('#newModal').modal('hide');
    	    
    	   // alert('캠페인 리프리시');
    	    search_campaign();
        },
        error: function (e) {
            alert("error :: " + e.responseText);
            console.log("ERROR : ", e);
            $("#bthNew").prop("disabled", false);
        }
    });
  
  }
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
	  var div = document.querySelector('#ai_campaign');

      html = '<table width="100%" class="table table-bordered table-hover">';
      html += '<thead><tr>';
      html += 	'<th>캠페인ID</th>';
      html += 	'<th>캠페인이름</th>';
      html += 	'<th>등록자</th>';
      html += 	'<th>캠페인목적</th>';
      html += 	'<th>캠페인상태</th>';
      html += 	'<th>AI진행상태</th>';
      /* html += 	'<th><center>AI버튼</center></th>'; */
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
   					
   				}
   				if(v == '1'){
   					html += '<td><span class="label label-warning">데이터 엑셀 로딩중</span></td>';
   					
   				}
   				if(v == '2'){
   					html += '<td><span class="label label-warning">데이터 엑셀 처리중</span></td>';
   					
   				}
   				if(v == '3'){
   					html += '<td><span class="label label-danger">데이터 엑셀 처리 오류</span></td>';
   					
   				}
   				if(v == '4'){
   					html += '<td><span class="label label-primary">데이터 엑셀 처리 종료</span></td>';
   					
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
  
  //상단 선택버튼 클릭시 체크된 Row의 값을 가져온다.
  $("#ai_campaign").click(function(){
	  	//alert("check !!! ");
		var tdArr = new Array();
		var checkbox = $("input[name=camCheck]:checked");
		
		var row_id = '';
		
		// 체크된 체크박스 값을 가져온다
		checkbox.each(function(i) {
			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			row_id = td.eq(1).text();
		});
		pretreatment_asis(row_id);	
		
  });
  
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