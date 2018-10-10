<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<meta charset="UTF-8">
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="/resources/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="/resources/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="/resources/dist/css/skins/_all-skins.min.css">
<!-- Morris chart -->
<link rel="stylesheet"
	href="/resources/bower_components/morris.js/morris.css">
<!-- jvectormap -->
<link rel="stylesheet"
	href="/resources/bower_components/jvectormap/jquery-jvectormap.css">
<!-- Date Picker -->
<link rel="stylesheet"
	href="/resources/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="/resources/bower_components/bootstrap-daterangepicker/daterangepicker.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet"
	href="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

<!-- Select2 -->
<link rel="stylesheet"
	href="/resources/bower_components/select2/dist/css/select2.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<style>
#ds_campaign {
	border-collapse: collapse;
}

#ds_campaign td, #ds_campaign th {
	padding: 20px;
}

#ds_campaign th {
	background-color: #ccc;
}

#ds_campaign tr.selected {
	background-color: navy;
	color: #fff;
	font-weight: bold;
}
</style>

</head>
<!-- jQuery 3 -->
<script src="/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/resources/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script
	src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script
	src="/resources/bower_components/select2/dist/js/select2.full.min.js"></script>
<!-- Morris.js charts -->
<script src="/resources/bower_components/raphael/raphael.min.js"></script>
<script src="/resources/bower_components/morris.js/morris.min.js"></script>
<!-- Sparkline -->
<script
	src="/resources/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script
	src="/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script
	src="/resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script
	src="/resources/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="/resources/bower_components/moment/min/moment.min.js"></script>
<script
	src="/resources/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script
	src="/resources/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script
	src="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- DataTables -->
<script
	src="/resources/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script
	src="/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- Slimscroll -->
<script
	src="/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="/resources/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/adminlte.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		// 모달 처리
		$('.modal').on('hidden.bs.modal', function (e) {
		    // console.log('modal close');
	  		$(this).find('form')[0].reset();
		});
		
		$('.modal').on('shown.bs.modal', function() {
			// console.log('modal open');
		});
		
		// 게시글 신규 등록
	    $("#bthNew").click(function(e) {
   			//stop submit the form, we will post it manually.
        	e.preventDefault();
 			submit_newBoard();
	    });
		
	 	// 게시글 삭제
	    $("#bthDel").click(function(e) {
   			//stop submit the form, we will post it manually.
        	e.preventDefault();
        	var r = confirm("정말 삭제 하시겠습니까?");
        	if (r == true) {
 				delete_board();
        	} else {
        	    return;
        	} 
	    });
		
		// 게시판 조회
		getBoardList();
	});
	
	function getBoardList() {
		$.ajax({
			type : 'GET', // method
			url : '/board/list',
			async : 'true', // true
			contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
			//dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
			success : function(data) {
				var obj = JSON.stringify(data);
				// console.log("board list result :: " + obj);
				grid_table_board(obj);
			},
			error : function(request, status, error) {
				// console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}

	function grid_table_board(obj) {
		var div = document.querySelector('#ai_board');

		var html = '<tbody>';
		var json = $.parseJSON(obj);
		$(json).each(function(i, val) {
			html += '<tr onClick="view_board('+val.code+')">';
			$.each(val, function(k, v) {
				if (k == 'contents') {
					return;
				}
				
				if (k == 'reg_datetime') {
					v = v.substr(0, 10);
				}

			 	if (v == 'null' || v == '') {
	
						//html += '<td></td>';
				} else if (k == 'title') {
					html += '<td style="text-align: left; padding-left: 10px;">' + v + '</td>';
				} else {
					html += '<td>' + v + '</td>';
				}
	 		});
			html += '</tr>';
		});
		html += '</tbody>';

		// console.log("Tbody == " + html);
		div.innerHTML = html;
	}

	//글쓰기
	function fn_write() {

		var form = document.getElementById("boardForm");

		form.action = "<c:url value='/board/writeForm.do'/>";
		form.submit();

	}

	//글조회
	function fn_view(code) {

		var form = document.getElementById("boardForm");
		var url = "<c:url value='/board/list'/>";
		url = url + "?code=" + code;

		form.action = url;
		form.submit();
	}
	
	//게시글 조회
	function view_board(code) {
		//console.log('-- view_board -- ', code);
		
		$.ajax({
			type : "GET",
			url : "/board/detail?code="+code,
			contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
			cache : false,
			timeout : 600000,
			success : function(data) {
				console.log("SUCCESS : ", data);
				
				showModal('READ', data);
			},
			error : function(e) {
				alert("error :: " + e.responseText);
				console.log("ERROR : ", e);
			}
		});
	}
	
	//게시글 등록
	function submit_newBoard() {
		// console.log('-- submit_newBoard -- ');
		var title = $('#inputBoardName').val().trim();
		if (!title || title === undefined) {
			alert('게시글 제목을 입력하세요.');
			return;
		}
		  
		// Get form
	    var form = $('#newUploadForm')[0];
	    var data = new FormData(form);
	    $("#bthNew").prop("disabled", true);
	    // $("#bthClose").prop("disabled", true);
	    
		$.ajax({
			type : "POST",
			url : "/board/insert",
			data : data,
			processData : false, //prevent jQuery from automatically transforming the data into a query string
			contentType : false,
			cache : false,
			timeout : 600000,
			success : function(data) {
				console.log("SUCCESS : ", data);
				$("#bthNew").prop("disabled", false);
				
				var res = data.split('::');
	        	if(res[0] == "OK"){
					// 게시판 목록 새로고침
					getBoardList();
					
					$('#boardNewModal').modal('hide');
	        	}
			},
			error : function(e) {
				alert("error :: " + e.responseText);
				console.log("ERROR : ", e);
				$("#bthNew").prop("disabled", false);
			}
		});
	}
	
	//게시글 삭제
	function delete_board() {
		// Get form
	    var form = $('#newUploadForm')[0];
	    var data = new FormData(form);
	    $("#bthDel").prop("disabled", true);
	    
		$.ajax({
			type : "POST",
			url : "/board/delete",
			data : data,
			processData : false, //prevent jQuery from automatically transforming the data into a query string
			contentType : false,
			cache : false,
			timeout : 600000,
			success : function(data) {
				console.log("SUCCESS : ", data);
				$("#bthDel").prop("disabled", false);
				
				var res = data.split('::');
	        	if(res[0] == "OK"){
					// 게시판 목록 새로고침
					getBoardList();
					
					$('#boardNewModal').modal('hide');
	        	}
			},
			error : function(e) {
				alert("error :: " + e.responseText);
				console.log("ERROR : ", e);
				$("#bthDel").prop("disabled", false);
			}
		});
	}
	
	function showModal(type, data) {
		//console.log('-- showModal -- ', type);
		if (type === 'EDIT') {
			$('#newModalLabel').text('게시글 신규 등록');
			
			$("#inputBoardName").attr("readonly", false);
			
			$("#inputBoardDesc").attr("readonly", false);
			
			$('.readBoard').hide();
			$('.editBoard').show();
		} else { // type === 'READ'
			var d = data[0];
			$('#newModalLabel').text('게시글 상세 조회');
		
			$("#inputBoardName").attr("readonly", true);
			$("#inputBoardName").val(d.title);
			
			$("#inputBoardDesc").attr("readonly", true);
			$("#inputBoardDesc").val(d.contents);
			
			$("#boardCode").val(d.code);
			$("#boardWriter").val(d.writer);
			$("#boardDate").val(d.reg_datetime.substr(0, 19));
		
			$('.readBoard').show();
			$('.editBoard').hide();
		}
		
		$('#boardNewModal').modal('show');
	}
</script>
<body>

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			게시판(Q&A) <small>Control panel</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">게시판(Q&A)</li>
		</ol>
	</section>

	<!-- 게시판 목록 -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box box-default">
						<div class="box-header with-border">
							<h3 class="box-title">게시글 목록</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<!-- board table -->
							<!-- /.게시판 목록 -->
							<form id="boardForm" name="boardForm" method="post">
								<table
									class="table table-bordered table-striped table-hover text-center">
									<thead>
										<tr>
											<th style="width: 70px">번호</th>
											<th style="width: 65%">제목</th>
											<th style="width: 100px">작성자</th>
											<th style="width: 100px">날짜</th>
											<!--<th>조회수</th>-->
										</tr>
									</thead>
									<tbody id="ai_board">
								</table>
							</form>
						<div>
							<!--<a href='#' onClick='fn_write()' class="btn btn-success">글쓰기</a>-->
							<button id='newBtn' type="button" class="btn btn-info pull-right" onClick='showModal("EDIT", null)'>글쓰기</button>
						</div>
						
						<!-- Modal -->
						<div class="modal fade" id="boardNewModal" tabindex="-1" role="dialog" aria-labelledby="newModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<div class="row">
											<div class="col-xs-10">
												<h5 class="modal-title" id="newModalLabel">게시글 신규 등록</h5>
											</div>
											<div class="col-xs-2">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
										</div>
									</div>
									<div class="modal-body">
										<!-- form start -->
										<form class="form-horizontal" id="newUploadForm" action="/board/insert" method="post">
											<div class="box-body">
			
												<input type="hidden" id="user_id" name="user_id" value=<%=session.getAttribute("sessionID") %>>
												
												<input type="hidden" id="boardCode" name="boardCode">
			
												<div class="form-group">
													<label for="inputBoardName" class="col-sm-2 control-label">제목</label>
			
													<div class="col-sm-10">
														<input id="inputBoardName" name="inputBoardName" type="text" class="form-control" placeholder="제목" required>
													</div>
												</div>
												
												<div class="form-group readBoard">
													<label for="boardDate" class="col-sm-2 control-label">등록일</label>
			
													<div class="col-sm-10">
														<input id="boardDate" name="boardDate" type="text" class="form-control" readonly>
													</div>
												</div>
												
												<div class="form-group readBoard">
													<label for="boardWriter" class="col-sm-2 control-label">작성자</label>
			
													<div class="col-sm-10">
														<input id="boardWriter" name="boardWriter" type="text" class="form-control" readonly>
													</div>
												</div>
			
												<div class="form-group">
													<label for="inputBoardDesc" class="col-sm-2 control-label">내용</label>
			
													<div class="col-sm-10">
														<textarea id="inputBoardDesc" name="inputBoardDesc" class="form-control" rows="10" placeholder="내용" style="resize: none;"></textarea>
													</div>
												</div>
												
												<!-- TODO: 첨부파일 등록 -->
												<!--
												<div class="form-group">
													<label for="InputFile_csv" class="col-sm-2 control-label">파일 등록(CSV)</label>
													<div class="col-sm-10">
														<input id="InputFile_csv" type="file" name="file_board" accept=".csv">
													</div>
												</div>
												-->
											</div>
											<!-- /.box-body -->
											<div class="box-footer">
												<div class='row pull-right' style='margin-right: 3px'>
													<button id="bthNew" type="submit" class="btn btn-primary editBoard">등록</button>
													<button id="bthDel" type="submit" class="btn btn-danger readBoard">삭제</button>
													<button id="bthClose" type="button" class="btn btn-secondary" data-dismiss="modal" style="margin-left: 5px">취소</button>
												</div>
											</div>
											<!-- /.box-footer -->
										</form>
									</div>
								</div>
							</div>
						</div>
						<!--/. Modal -->
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>