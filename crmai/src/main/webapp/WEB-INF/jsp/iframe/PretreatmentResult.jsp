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
        #ai_campaign {border-collapse: collapse;}
        #ai_campaign td, #ai_campaign th{padding:20px;}
        #ai_campaign th{background-color: #ccc;}
         
        #ai_campaign tr.selected{background-color: navy;color: #fff; font-weight: bold;}
  </style>

</head>
<body class="hold-transition skin-blue sidebar-mini">


    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
          전처리결과
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/iframe/Dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
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
		                    <label for="cam_name" >캠페인명</label>
		                    <input type="text" class="form-control" id="cam_name" placeholder="캠페인명">
		                  </div>
   	                  </div>
   	                   <!-- /.form-group -->
   	                   
   	                   <!-- form-group -->
   	                   <div class="form-group">
	                	<div class="col-sm-10">
	                		<label for="cam_type" >캠페인목적</label>
	                		<select id="cam_type" class="form-control select2" style="width: 100%;">
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
		                	<label for="cam_status" >캠페인상태</label>
			                <select id="cam_status" class="form-control select2" style="width: 100%;">
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
                		   <label for="adm_id" >생성자</label>
		                   <input type="text" class="form-control" id="adm_id" placeholder="생성자">
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
	          <div class="row">
	          	<table id="ai_campaign" class="table table-bordered table-hover text-center"></table>
	          </div>
	        </div>
        </div>
   	  </div>
   </div>
   <!-- /.캠페인목록 -->
   
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
      //alert("grid_table_campaign :: " + obj);

      html = '<table class="table table-bordered table-hover">';
      //html += '<thead><tr><th>체크</th><th>캠페인이름</th><th>등록자</th><th>캠페인목적</th><th>캠페인상태</th><th>AI상태</th><th>캠페인 등록일자</th><th>설명</th><th>메시지</th><tr></thead>';
      html += '<thead><tr><th>캠페인이름</th><th>등록자</th><th>캠페인목적</th><th>캠페인상태</th><th>AI상태</th><th>캠페인 등록일자</th><th>설명</th><th>메시지</th><tr></thead>';
      html += '<tbody>';
      var json = $.parseJSON(obj);
      
   	  $(json).each(function(i,val){
   		html += '<tr>';
   		//html += '<td><input type="checkbox" name="camCheck"/></td>';
   		$.each(val,function(k,v){

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
   					html += '<td>데이터 로딩 필요</br>' + '<button id="itype_bt" type="button" class="btn btn-info pull-center">데이터등록</button>' +'</td>';	
   				}
   				if(v == '1'){
   					html += '<td>데이터 엑셀 로딩중</td>';
   				}
   				if(v == '2'){
   					html += '<td>데이터 엑셀 처리중</td>';
   				}
   				if(v == '3'){
   					html += '<td>데이터 엑셀 처리 오류</td>';
   				}
   				if(v == '4'){
   					html += '<td>데이터 엑셀 처리 종료</td>';
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
  }
  
	//테이블의 Row 클릭시 값 가져오기
	$("#ai_campaign tr").click(function(){ 	

		alert('xxxxxxxxxxxx');
		
		var str = ""
		var tdArr = new Array();	// 배열 선언
		
		// 현재 클릭된 Row(<tr>)
		var tr = $(this);
		var td = tr.children();
		
		// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
		console.log("클릭한 Row의 모든 데이터 : "+tr.text());
		
		// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
		td.each(function(i){
			tdArr.push(td.eq(i).text());
		});
		
		console.log("배열에 담긴 값 : "+tdArr);
		
		// td.eq(index)를 통해 값을 가져올 수도 있다.
		var no = td.eq(0).text();
		var userid = td.eq(1).text();
		var name = td.eq(2).text();
		var email = td.eq(3).text();
		
		
		str +=	" * 클릭된 Row의 td값 = No. : <font color='red'>" + no + "</font>" +
				", 아이디 : <font color='red'>" + userid + "</font>" +
				", 이름 : <font color='red'>" + name + "</font>" +
				", 이메일 : <font color='red'>" + email + "</font>";		
		
		$("#ex1_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());		
		$("#ex1_Result2").html(str);
	});
  
  
  // 60초에 한번씩 서버의 정보를 받아서 화면에 출력
  function startCallback() {
	  setInterval("search_campaign();", 60000);
  }

  
  search_campaign();
  startCallback();
  
 </script>

</body>
</html>