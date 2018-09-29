<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AI 캠페인 자동 처리</title>
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
  
  <!-- twbsPagination :: https://github.com/josecebe/twbs-pagination -->
  <script src="/resources/js/jquery.twbsPagination.js"></script>
  <script src="/resources/js/jquery.twbsPagination.min.js"></script>
  
</head>
<!-- ADD THE CLASS layout-boxed TO GET A BOXED LAYOUT -->
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

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">AI 캠페인 진행현황</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
            <!-- <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"> <i class="fa fa-times"></i></button>-->
          </div>
        </div>
        <div class="box-body">
 			  
		<div class="row">
		
	        <div class="col-md-2.5 col-sm-2">
	          <div class="box box-default box-solid">
	            <div class="box-header with-border">
	              <h3 class="box-title">학습데이터 로딩</h3>
	            </div>
	            <!-- /.box-header -->
	            <div class="box-body">
	            	학습 데이터 처리중
	            </div>
	            <!-- /.box-body -->
	          </div>
	          <!-- /.box -->
	        </div>
	        <!-- /.col -->

	        <div class="col-md-2.5 col-sm-2">
	          <div class="box box-success box-solid">
	            <div class="box-header with-border">
	              <h3 class="box-title text-center">전처리 중</h3>
	            </div>
	            <!-- /.box-header -->
	            <div class="box-body">
	              The body of the box
	            </div>
	            <!-- /.box-body -->
	          </div>
	          <!-- /.box -->
	        </div>
	        <!-- /.col -->
	        
	 
	        
	        <div class="col-md-2.5 col-sm-2">
	          <div class="box box-warning box-solid">
	            <div class="box-header with-border">
	              <h3 class="box-title">AI학습중</h3>
	            </div>
	            <!-- /.box-header -->
	            <div class="box-body">
	              The body of the box
	            </div>
	            <!-- /.box-body -->
	          </div>
	          <!-- /.box -->
	        </div>
	        <!-- /.col -->
	  
	        
	        <div class="col-md-2.5 col-sm-2">
	          <div class="box box-default box-solid">
	            <div class="box-header with-border">
	              <h3 class="box-title">대상자데이터 로딩</h3>
	            </div>
	            <!-- /.box-header -->
	            <div class="box-body">
	            	대상자 데이터 처리
	            </div>
	            <!-- /.box-body -->
	          </div>
	          <!-- /.box -->
	        </div>
	        <!-- /.col -->

	        
	        <div class="col-md-2.5 col-sm-2">
	          <div class="box box-danger box-solid">
	            <div class="box-header">
	              <h3 class="box-title">예측실행</h3>
	            </div>
	            <div class="box-body">
	              The body of the box
	            </div>
	            <!-- /.box-body -->
	            
	            <!-- Loading (remove the following to stop the loading)-->
	            <div class="overlay"><i class="fa fa-refresh fa-spin"></i></div>
	            <!-- end loading -->
	            
	          </div>
	          <!-- /.box -->
	        </div>
	        <!-- /.col -->
	        
      </div>
      <!-- /.row -->

      <!-- =========================================================== -->
 			
        </div>
        
         <div class="box-footer">
         
	       <div class="row">
	 			<table id="ai_campaign"	class="table table-bordered table-hover text-center"></table>
	 	   </div>
 		 
 		   <div class="row">
				<nav aria-label="Page navigation example" style="text-align: center;">
				<ul class="pagination-sm" id="pagination"></ul></nav>
 		   </div>
 		   
        </div>
        
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
      
      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Title</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">
          Start creating your amazing application!
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          Footer
        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
      
	</section>
	<!-- /.Main content -->
	
  <script type="text/javascript">
  
	  var nowPages = 1;
	  var totalPages = 1;
	  var visiblePages = 5;
	  
	  var page_st = 1;
	  var page_end = 5;
  	  
	  var selectRadio = 0;
	  
	  function handleClick(myRadio) {
	      alert('Old value: ' + selectRadio);
	      alert('New value: ' + myRadio.value);
	      currentValue = myRadio.value;
	  }
	  
	  function campaignPage(){
			

		  
			var admin = new Object();

			alert("campaignPage call ");
		    $.ajax({
		        type    : 'GET', // method
		        url     : '/campaign/totalPage',
		        //url       : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
		        async   : 'true', // true
		        data    : admin, // GET 요청은 지원되지 않습니다.
		        processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
		        contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
		        cache: false,
		        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
		        success : function(data, status, xhr){
	        		alert( "data :: " + data[0]);
	        		
	        		totalPages = Math.ceil(data[0] / visiblePages);
	        		
	        		alert( "totalPages :: " + totalPages);
	        		grid_pagination(totalPages, visiblePages);
	        		
		        },
		        error   : function(request,status,error){
		        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        	 
		        	 responseError(error);
		        	 
		        	 $('#msg').html(error);
		        }
			});
	  }
	  
	  function grid_pagination(totalPages, visiblePages){
			alert("grid_pagination :: " + totalPages + " :: " + visiblePages);
			  
		 	$('#pagination').twbsPagination({
		          totalPages: totalPages,
		          visiblePages: visiblePages,
		          onPageClick: function (event, page) {
		        	  
		        	  page_st = ((1 * visiblePages) * page) - (visiblePages - 1);
		        	  
		        	  page_end = (page_st + visiblePages) - 1;
		        	  
		        	  
		              search_campaign(page, page_st, page_end);
		          }
		    });
		 	
	  }
	   
	  
	  
	  function search_campaign(now_page, page_st, page_end){
		  
		  	alert("search_campaign call :: now[" + now_page + "] :: interval[" +visiblePages +"] :: st[" + page_st + "] :: end[" + page_end + "]" );
		  	
		  	var campaign = new Object();
		  	campaign.page_st = page_st;
		  	campaign.page_end = page_end;
		  	
		    $.ajax({
		        type    : 'GET', // method
		        url     : '/campaign/listPage',
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
	    html += 	'<th>체크</th>';
	    html += 	'<th>캠페인ID</th>';
	    html += 	'<th>캠페인이름</th>';
	    html += 	'<th>등록자</th>';
	    html += 	'<th>캠페인목적</th>';
	    html += 	'<th>캠페인상태</th>';
	    html += 	'<th>AI진행상태</th>';
	    html += 	'<th>캠페인 등록일자</th>';
	    html += 	'<th>설명</th>';
	    html += 	'<th>메시지</th>';
	    html += 	'<tr></thead>';
	    html += '<tbody>';
	    
	    var json = $.parseJSON(obj);
	 	  $(json).each(function(i,val){
	 		html += '<tr>';
	 		
	 		$.each(val,function(k,v){
	 			flag = 0;
	 			if(k == 'cam_id'){
	 				html += '<td><input type="radio" name="camCheck" onclick="handleClick(this);" value="'+v+'" /></td>';
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
	}
	
	$(document).ready(function () {
		campaignPage();
	});

  </script>

</body>
</html>