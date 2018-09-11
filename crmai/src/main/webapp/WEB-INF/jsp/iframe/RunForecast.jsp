<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예측실행</title>

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
        예측실행
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">예측실행</li>
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
	          <table id="ds_campaign" class="table table-bordered table-hover text-center"></table>
	          
	          <div class="col-lg-12" id="ex1_Result1" ></div> 
			  <div class="col-lg-12" id="ex1_Result2" ></div>
	          
	          <button id="selectBtn" type="button" class="btn btn-info pull-right" >예측실행</button>&nbsp;
	        </div>
	        </div>
        </div>
   </div>
   <!-- /.캠페인목록 -->
   
   <!-- 예측실행 -->
	<div class="row">
          <div class="col-xs-12">
          <div class="box">
			<div class="box-header">
	          <h3 class="box-title">예측실행</h3>
	          <div class="box-tools pull-right">
		            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		            <!-- <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button> -->
		      </div>
	        </div>
	        <!-- /.box-header -->
	        
	         <!-- box-body -->
	        <div class="box-body">
	        	<div>
	        	   <button id="runForecast_tobe" type="button" class="btn btn-info pull-right">예측실행후</button>&nbsp;
	        	   <button id="runForecast_asis" type="button" class="btn btn-info pull-right">예측실행전</button>&nbsp;
	        	</div>  
	            <div>
		            <table id="runForecast_info" class="table table-bordered table-hover text-center"></table>
	            </div>
	        </div>
	         <!-- /.box-body -->
	        </div>
        </div>
   </div>
   <!-- /.예측 실행 -->
   
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
    
    $('#ds_campaign_info').DataTable();
  });

  function search_campaign(){
	  	//alert("search value :: " + $('#inputname').val() + " :: "+ $('#select_option1').val()+ " :: "+ $('#select_option2').val()+ " :: "+ $('#input_crea_by').val());
	  	
	  	var campaign = new Object();
	  	campaign.name = $('#inputname').val();
	  	campaign.type = $('#select_type').val();
	  	if(campaign.type == "ALL"){
	  		campaign.type = "";
	  	}
	  	campaign.status = $('#select_status').val();
	  	if(campaign.status == "ALL"){
	  		campaign.status = "";
	  	}
	  	campaign.created_by = $('#input_crea_by').val();

	    $.ajax({
	        type    : 'GET', // method
	        url     : '/Pretreatment/list',
	        //url       : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
	        async   : 'true', // true
	        data    : campaign, // GET 요청은 지원되지 않습니다.
	        processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
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
	  var div = document.querySelector('#ds_campaign');
      //alert("grid_table_campaign :: " + obj);

      html = '<table class="table table-bordered table-hover">';
      html += '<thead><tr><th>선택</th><th>캠페인코드</th><th>캠페인명</th><th>캠페인목적</th><th>켐페인상태</th><th>시작일자</th><th>종료일자</th><th>생성자</th><th>생성일자</th><th>수정일자</th><th>대상건수</th><th>전처리상태</th><th>전처리시작</th><th>전처리종료</th><tr></thead>';
      html += '<tbody>';

      var json = $.parseJSON(obj);
   	  $(json).each(function(i,val){
   		html += '<tr>';
   		html += '<td><input type="checkbox" name="camCheck"/></td>';
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
      
      //alert("Table == " + html);
      div.innerHTML = html;
      //$('#ds_campaign').DataTable();
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
		
		runForecast_asis(row_id);
	});
  
  //상단 선택버튼 클릭시 체크된 Row의 값을 가져온다.
  $("#runForecast_asis").click(function(){ 
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
		runForecast_asis(row_id);
	});
  
  
  function runForecast_asis(row_id){
	  	var campaign = new Object();
	  	campaign.row_id = row_id;

	  	if(row_id == ""){
	  		alert("체크박스를 선택 하세요.");
	  		return;
	  	}
	  	
	    $.ajax({
	        type    : 'GET', // method
	        url     : '/Pretreatment/info',
	        //url       : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
	        async   : 'true', // true
	        data    : campaign, // GET 요청은 지원되지 않습니다.
	        processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
	        contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
	        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
	        success : function(data){
	        	
	        	var obj = JSON.stringify(data, true, 2);
	        	alert("search_runForecast result :: " + obj);
	        	
	        	grid_table_runForecast(obj);
	        	
	        },
	        error : function(request,status,error){
	        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});
  }
  
  function grid_table_runForecast(obj){
	  var div = document.querySelector('#runForecast_info');
	  
      //alert("grid_table_pretreatment :: " + obj);

      html = '<table class="table table-bordered table-hover">';
      html += '<thead><tr><th>캠페인ID</th><th>이름</th><th>성별</th><th>나이</th><th>IPTV결합여부</th><th>미납여부</th><th>인터넷가입여부</th><th>고객등급</th><th>약정여부</th><th>반응1</th><tr></thead>';
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
      
      grid_table_paging();
  }
  
  function grid_table_paging(){
      //alert("paging :: ");
      $('#runForecast_info').DataTable(
  		  {
  			 "pagingType": "simple_numbers", // "simple" option for 'Previous' and 'Next' buttons only
  			"bDestroy": true,
  			 "searching" : false,
  			 "paging"    : true,
  			 "autoWidth" : false
  		  }	  
      );
  }
  
  search_campaign();


 </script>

</body>
</html>