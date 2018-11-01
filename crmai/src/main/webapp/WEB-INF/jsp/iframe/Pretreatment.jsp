<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전처리수행</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="../include/commonCss.jsp" />
<!-- DataTables -->
<link rel="stylesheet"
	href="/resources/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- Top bar -->
		<jsp:include page="../include/00_topBar.jsp" />
		<!-- Side Bar -->
		<jsp:include page="../include/20_sideBar.jsp" />
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					대상자 로딩 <small>Control panel</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/iframe/Dashboard"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">AI 학습/대상자 로딩</li>
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
													<label for="cam_name">캠페인명</label> <input type="text"
														class="form-control" id="cam_name" placeholder="캠페인명">
												</div>
											</div>
											<!-- /.form-group -->
										</div>
										<!-- /.col -->
										<div class="col-md-3">
											<div class="form-group">
												<div class="col-sm-10">
													<label for="cam_type">캠페인목적</label> <select id="cam_type"
														class="form-control select2" style="width: 100%;">
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
													<label for="cam_status">캠페인상태</label> <select
														id="cam_status" class="form-control select2"
														style="width: 100%;">
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
													<label>생성자</label> <input type="text" class="form-control"
														id="adm_name" disabled>
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
									<button type="button" onclick="newCampaignPage();"
										class="btn btn-info pull-right">검색</button>
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
								<h3 class="box-title">
									캠페인 목록 <span id='id_span_msg' class="label label-success"></span>
								</h3>
							</div>
							<!-- /.box-header -->
							<div id="div_campaign" class="box-body"></div>
							<div class="text-center">
								<ul class="pagination-sm" id="pagination_cam"></ul>
							</div>
							<!-- Button trigger modal -->
							<div class="box-footer">
								<button id='newBtn' type="button"
									class="btn btn-info pull-right" data-toggle="modal"
									data-target="#newModal">캠페인 신규등록</button>
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
														value=<%=session.getAttribute("sessionID")%>>
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
														<label for="cam_type" class="col-sm-2 control-label"
															data-toggle="tooltip" title="캠페인 목적">목적</label>
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
													<input type="hidden" id="cam_autoyn" name="cam_autoyn"
														value="Y">
													<div class="form-group">
														<label for="InputFile_train"
															class="col-sm-2 control-label">파일 등록(학습CSV)</label>
														<div class="col-sm-10">
															<input id="InputFile_train" type="file" name="file_train"
																accept=".csv">
														</div>
													</div>
													<div class="form-group">
														<label for="InputFile_test" class="col-sm-2 control-label">파일
															등록(대상CSV)</label>
														<div class="col-sm-10">
															<input id="InputFile_test" type="file" name="file_test"
																accept=".csv">
														</div>
													</div>
												</div>
												<!-- /.box-body -->
												<div class="box-footer">
													<button id="bthNew" type="submit" class="btn btn-primary">등록</button>
													<button id="bthClose" type="button"
														class="btn btn-secondary" data-dismiss="modal">Close</button>
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
				<!-- /.캠페인목록 -->
			</section>
			<!-- /.Main content -->
		</div>
		<!-- Footer -->
		<jsp:include page="../include/90_footer.jsp" />
	</div>
	<jsp:include page="../include/commonJs.jsp" />
	<!-- DataTables -->
	<script
		src="/resources/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<!-- AI_CAMPAIGN JS -->
	<script src="/resources/js/ai_campaign.js"></script>
	<!-- twbsPagination :: https://github.com/josecebe/twbs-pagination -->
	<script src="/resources/js/jquery.twbsPagination.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#adm_name").val("${sessionID}");
			//campaignPage();
			newCampaignPage();
			//모달 처리(신규).
			$("#bthNew").click(function(event) {
				//stop submit the form, we will post it manually.
				event.preventDefault();
				//alert('클릭 신규~!!');
				modifiedSubmitNewCampagin();
			});
		});
	</script>
</body>
</html>