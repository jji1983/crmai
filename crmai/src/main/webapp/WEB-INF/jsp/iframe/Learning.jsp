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
		            <div class="col-md-6">
					  <div class="form-group">
		                  <div class="col-sm-10">
		                    <label for="inputname" >캠페인명</label>
		                    <input type="text" class="form-control" id="inputname" placeholder="캠페인명">
		                  </div>
   	                  </div>
   	                   <!-- /.form-group -->
   	                  <div class="form-group">
	                	<div class="col-sm-10">
	                		<label for="select_type" >캠페인목적</label>
	                		<select id="select_type" class="form-control select2" style="width: 100%;" data-placeholder="Acquisition">
	                		<option selected="selected">ALL</option>
	                  		<option>Acquisition</option>
	                  		</select>
	                    </div>
		              </div>
					  <!-- /.form-group -->
		            </div>
		            
		            <!-- /.col -->
		            <div class="col-md-6">
		              <div class="form-group">
		                <div class="col-sm-10">
		                	<label for="select_status" >캠페인상태</label>
			                <select id="select_status" class="form-control select2" style="width: 100%;" data-placeholder="캠페인상태">
			                  <option selected="selected">ALL</option>
			                  <option>시작</option>
			                  <option>종료</option>
			                </select>
			          	</div>      
		              </div>
		              <!-- /.form-group -->
		              <div class="form-group">
		              	<div class="col-sm-10">
                		   <label for="input_crea_by" >생성자</label>
		                   <input type="text" class="form-control" id="input_crea_by" placeholder="생성자">
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
	          <table id="ai_campaign" class="table table-bordered table-hover text-center"></table>
	          
	          <button id="selectBtn" type="button" class="btn btn-info pull-right" >학습모델 보기</button>
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
	        
	         <!-- box-body -->
	        <div class="box-body">
	        	<div>
	        	   <button id="learning_asis" type="button" class="btn btn-flat">학습모델</button>&nbsp;
	        	   <button id="learning_tobe" type="button" class="btn btn-flat">학습결과</button>
	        	</div>  
	            <div>
		            <table id="ds_learning_info" class="table table-bordered table-hover text-center"></table>
	            </div>
	        </div>
	         <!-- /.box-body -->
	        </div>
        </div>
   </div>
   <!-- /.학습모델 보기 -->
   
   <!-- 항목별 중요도 -->
   <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">항목별 중요도(TOP 10)</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tr>
                  <th style="width: 10px">#</th>
                  <th>Task</th>
                  <th>Progress</th>
                  <th style="width: 40px">Label</th>
                </tr>
                <tr>
                  <td>1.</td>
                  <td>Update software</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-danger" style="width: 55%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-red">55%</span></td>
                </tr>
                <tr>
                  <td>2.</td>
                  <td>Clean database</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-yellow" style="width: 70%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-yellow">70%</span></td>
                </tr>
                <tr>
                  <td>3.</td>
                  <td>Cron job running</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-primary" style="width: 30%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-light-blue">30%</span></td>
                </tr>
                <tr>
                  <td>4.</td>
                  <td>Fix and squish bugs</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 90%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-green">90%</span></td>
                </tr>
              </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
              <ul class="pagination pagination-sm no-margin pull-right">
                <li><a href="#">&laquo;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">&raquo;</a></li>
              </ul>
            </div>
          </div>
          <!-- /.box -->
       </div>
   </div>
   <!-- /.항목별 중요도 -->
   
   
   
</section>
<!-- /.Main content -->

<!-- jQuery UI 1.11.4 -->
<script src="/resources/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- jQuery 3 -->
<script src="/resources/bower_components/jquery/dist/jquery.min.js"></script>
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

<script type="text/javascript">
  
  //체크 박스 체크 시
  $(document).ready(function () {
    var tbl = $("#ds_campaign");
    //radio버튼처럼 Checkbox name값 설정
    $('input[type="checkbox"][name="camCheck"]').click(function(){
  	 //click이벤트가 발생했는지 체크
  	 if($(this).prop('checked')){
  		//checkbox 전체를 checked 해제후 click한 요소만 true지정
  		$('input[type="checkbox"][name="camCheck"]').prop('checked', false);
  		$(this).prop('checked',true);
  	 }
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
  
  //상단 선택버튼 클릭시 체크된 Row의 값을 가져온다.
  $("#selectBtn").click(function(){ 
		
		var rowData = new Array();
		var tdArr = new Array();
		var checkbox = $("input[name=camCheck]:checked");
		
		var row_id = '';
		
		// 체크된 체크박스 값을 가져온다
		checkbox.each(function(i) {

			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			// 체크된 row의 모든 값을 배열에 담는다.
			rowData.push(tr.text());
			
			row_id = td.eq(1).text();
			
		});
		
		//$("#ex3_Result1").html(" * 체크된 Row의 모든 데이터 = "+rowData);	
		//$("#ex3_Result2").html(tdArr);	
		
		//alert("rowData :: " + rowData);
		
		//alert("row_id :: " + row_id);
		
		getLearning_asis(row_id);
	});
  
  //상단 선택버튼 클릭시 체크된 Row의 값을 가져온다.
  $("#learning_asis").click(function(){ 
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

		//alert("row_id :: " + row_id);
		getLearning_asis(row_id);
	});
  
  
  function getLearning_asis(row_id){
	  	var campaign = new Object();
	  	campaign.row_id = row_id;

	  	if(row_id == ""){
	  		alert("체크박스를 선택 하세요.");
	  		return;
	  	}
	  	
	    $.ajax({
	        type    : 'GET', // method
	        url     : '/Learning/info',
	        //url       : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
	        async   : 'true', // true
	        data    : campaign, // GET 요청은 지원되지 않습니다.
	        processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
	        contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
	        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
	        success : function(data){
	        	
	        	var obj = JSON.stringify(data, true, 2);
	        	//alert("search_learning result :: " + obj);
	        	
	        	grid_table_learning_asis(obj);
	        	
	        },
	        error : function(request,status,error){
	        	 //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});
  }
  
  function grid_table_learning_asis(obj){
	  var div = document.querySelector('#ds_learning_info');
	  
      //alert("grid_table_learning_asis :: " + obj);

      html = '<table class="table table-bordered table-hover">';
      html += '<thead><tr><th>학승방법</th><th>학습설명</th><th>정확도</th><th>분류별확률(성공->성공))</th><th>분류별확률(실패->실패)</th></tr></thead>';
      html += '<tbody>';

      var json = $.parseJSON(obj);
   	  $(json).each(function(i,val){
   		html += '<tr>';
   		$.each(val,function(k,v){
   			if(v == 'null' || v == ''){
   				html += '<td></td>';
   			}else{
   				html += '<td>' + v + '</td>';
   			}
   		});
   		
   		html += '</tr>';
  	  });
   	  html += '</tbody>';
      html += '</table>';
      
      //alert("Table :: " + html);
      div.innerHTML = html;
  
  }
  
  //상단 선택버튼 클릭시 체크된 Row의 값을 가져온다.
  $("#learning_tobe").click(function(){ 
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

		//alert("row_id :: " + row_id);
		getLearning_tobe(row_id);
	});
  
  
  function getLearning_tobe(row_id){
	  	var campaign = new Object();
	  	campaign.row_id = row_id;

	    $.ajax({
	        type    : 'GET', // method
	        url     : '/Learning/res',
	        //url       : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
	        async   : 'true', // true
	        data    : campaign, // GET 요청은 지원되지 않습니다.
	        processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
	        contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
	        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
	        success : function(data){
	        	
	        	var obj = JSON.stringify(data, true, 2);
	        	//alert("search_learning result :: " + obj);
	        	
	        	grid_table_learning_tobe(obj);
	        	
	        },
	        error : function(request,status,error){
	        	 //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});
  }
  
  function grid_table_learning_tobe(obj){
	  var div = document.querySelector('#ds_learning_info');
	  
      //alert("grid_table_learning :: " + obj);

      html = '<table class="table table-bordered table-hover">';
      html += '<thead><tr><th>학승방법</th><th>모델이름</th><th>생성일자</th><th>수정일자</th><th>모델경로</th></tr></thead>';
      html += '<tbody>';

      var json = $.parseJSON(obj);
   	  $(json).each(function(i,val){
   		html += '<tr>';
   		$.each(val,function(k,v){
   			if(v == 'null' || v == ''){
   				html += '<td></td>';
   			}else{
   				html += '<td>' + v + '</td>';
   			}
   		});
   		
   		html += '</tr>';
  	  });
   	  html += '</tbody>';
      html += '</table>';
      
      //alert("Table :: " + html);
      div.innerHTML = html;
  
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