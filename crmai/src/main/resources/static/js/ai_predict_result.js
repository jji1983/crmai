/**
 *	예측 결과 관련 자바스크립트 코드
 */

var currentValue = 0;
var predictCamId = 0;

function handleClick(myRadio) {
    currentValue = myRadio.value;
       
	$("#id_span_msg").text("캠페인ID :: " + currentValue);
	
	connectLearningModel(currentValue);
}
  
function radioInit(myRadio) {  
	if(myRadio != 0){
		$("#id_span_msg").text("캠페인ID :: " + myRadio); 
		  
		currentValue = myRadio;
	}
}

// 파라메터 존재하는 캠페인 찾기 메서드 사용하려면 밑의 new 접두어가 들어간 메서드 사용할 것!!!
function newCampaignPage(){
	var campaignData = { 
		cam_name : $("#cam_name").val(), 
		cam_type : $("#cam_type").val(),
		cam_status : $("#cam_status").val()
	};
			
	$.ajax({
		url:"/campaign/count",
		data:campaignData,
		success:function(pagingData) {
			createPagenationCam(pagingData["realEndPage"], pagingData["displayPageNum"]);
		}
	});
}

function createPagenationCam(totalPage, displayPage) {
	$("#pagination_cam").twbsPagination("destroy");
	
	// 데이터 존재 시(페이지 수 0 아님)
	if(totalPage != 0) {
		$("#pagination_cam").twbsPagination({
	        totalPages: totalPage,
	        visiblePages: displayPage,
	        onPageClick: function (event, page) {
	        	newSearchCampaign(page);
	        }
	    });
	} else {		// 데이터 미 존재 시
		currentValue = 0;		// 캠페인 ID 초기화
		
		noDataCamId();
	}
}

function newSearchCampaign(clickPage){
	var campaignData = { 
		cam_name : $("#cam_name").val(), 
		cam_type : $("#cam_type").val(),
		cam_status : $("#cam_status").val(),
		page : clickPage
	};
		
	$.ajax({
		url:"/campaign/list",
		data:campaignData,
		success:function(data) {
			createTableCampaign(data);
		}
	});	
}

function createTableCampaign(arr){
	var html = "<table id='cpi_table' class='table table-bordered table-hover'>";
	var first = true;
	
	html += "<thead><tr><th class='text-center'>체크</th>";
	html += "<th class='text-center'>캠페인ID</th>";
	html += "<th class='text-center'>캠페인이름</th>";
	html += "<th class='text-center'>등록자</th>";
	html += "<th class='text-center'>캠페인목적</th>";
	html += "<th class='text-center'>캠페인상태</th>";
	html += "<th class='text-center'>캠페인 등록일자</th>";
	html += "<th class='text-center'>설명</th>";
	html += "<th class='text-center'>메시지</th></tr></thead><tbody>";
	
	// 데이터 존재 미존재 여부에 따른 표 표시
	if(arr.length != 0) {
		arr.forEach(function(arrVal, arrIdx) {
			html += "<tr>";
			
			Object.getOwnPropertyNames(arr[arrIdx]).forEach(function(val, idx, array) {
				switch (val) {
					case "cam_id":
						if(first == true) {
							html += "<td><input name='cam_check' type='radio' value='" + arr[arrIdx][val] + "' onclick='handleClick(this);' checked='checked'></td>";
							
							radioInit(arr[arrIdx][val]);
							
							first = false;
						} else {
							html += "<td><input name='cam_check' type='radio' value='" + arr[arrIdx][val] + "' onclick='handleClick(this);'></td>";
						}
						
						html += "<td class='text-center'>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "cam_name":
						html += "<td>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "adm_id":
						html += "<td>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "cam_type":
						html += "<td>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "cam_status":
						html += "<td>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "cam_cdate":
						html += "<td>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "cam_desc":
						html += "<td>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "cam_msg":
						if((arr[arrIdx][val] == null) || (arr[arrIdx][val] == "null") || (arr[arrIdx][val] == "")) {
							html += "<td></td>";
						} else {
							html += "<td>" + arr[arrIdx][val] + "</td>";
						}
						
						break;
					default:
						break;
				}
			});
			
			html += "</tr>";
		});	
	}
	
	html += "</tbody></table>";
	  	
	$("#div_campaign").html(html);					// innerHtml jquery버전
	
	connectLearningModel();
}

// 캠페인 아이디로 모델 테이블 불러오기
function connectLearningModel() {
	var cam_id = Number(currentValue);
	
	if(cam_id != 0) {
		$.ajax({
			url:"/model/learn",
			data:{
				cam_id : currentValue
			},
			success:function(data) {
				createTableModel(data);
			}
		});
	}
}

function createTableModel(arr){
	var html = "<table id='model_table' class='table table-bordered table-hover'>";
	
	html += "<thead><tr><th class='text-center'>캠페인ID</th>";
	html += "<th class='text-center'>학습모델</th>";
	html += "<th class='text-center'>기존정확도</th>";
	html += "<th class='text-center'>AI정확도</th>";
	html += "<th class='text-center'>학습시작시간</th>";
	html += "<th class='text-center'>학습종료시간</th>";
	html += "<th class='text-center'>선택Model</th>";
	html += "<th class='text-center'>메시지</th></tr></thead><tbody>";
	
	// 데이터 존재 미존재 여부에 따른 표 표시
	if(arr.length != 0) {
		arr.forEach(function(arrVal, arrIdx) {
			html += "<tr>";
			
			Object.getOwnPropertyNames(arr[arrIdx]).forEach(function(val, idx, array) {
				switch (val) {
					case "cam_id":
						html += "<td>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "train_method":
						html += "<td>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "original_acc":
						html += "<td>" + arr[arrIdx][val] + "%</td>";
						
						break;
					case "so_acc":
						html += "<td>" + arr[arrIdx][val] + "%</td>";
						
						break;
					case "train_start":
						html += "<td>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "train_end":
						html += "<td>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "model_flag":
						html += "<td>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "desc_text":
						if((arr[arrIdx][val] == null) || (arr[arrIdx][val] == "null") || (arr[arrIdx][val] == "")) {
							html += "<td></td>";
						} else {
							html += "<td>" + arr[arrIdx][val] + "</td>";
						}
						
						break;
					default:
						break;
				}
			});
			
			html += "</tr>";
		});
	} else {
		html += "<tr><td class='text-center' colspan='8'>조회된 데이터가 없습니다.</td></tr>";
	}
	
	html += "</tbody></table>";
	  	
	$("#div_model").html(html);					// innerHtml jquery버전
	
	predictCount();
}

function predictCount() {
	// 숫자형으로 변형
	currentCamId = Number(currentValue);
	
	var succRate = Number($("#succ_rate").val());
	var extractCnt = Number($("#extract").val());
	
	$.ajax({
		url:"/predict/count",
		data:{
			camId : currentCamId,
			extractCnt : extractCnt,
			succProb : succRate
		},
		success:function(pagingData) {
			createPagenationPredict(pagingData["realEndPage"], pagingData["displayPageNum"]);
		},
		error:function(xhr, status, error) {
			console.log("오류:" + error);
		}
	});
}

function createPagenationPredict(totalPage, displayPage) {
	$("#pagination_predict").twbsPagination("destroy");
	
	// 데이터 존재 시(페이지 수 0 아님)
	if(totalPage != 0) {
		$("#pagination_predict").twbsPagination({
	        totalPages: totalPage,
	        visiblePages: displayPage,
	        onPageClick: function (event, page) {
	        	connectCampaignAjax(page);
	        }
	    });
	} else {		// 데이터 미 존재 시
		predictCamId = 0;
		
		noDataPredict();
	}
}

// 캠페인과 연결되어 불러오는 ajax
function connectCampaignAjax(clickPage) {
	// 숫자형으로 변형
	currentCamId = Number(currentCamId);
	
	predictCamId = currentCamId;
	
	var succRate = Number($("#succ_rate").val());
	
	$.ajax({
		url:"/predict/paging",
		data:{
			camId : currentCamId,
			succProb : succRate,
			page : clickPage
		},
		success:function(data) {
			createPredictTable(data);
		}
	});
}

// 예측 결과 목록 테이블
function createPredictTable(arr) {
	var html = "<table id='cam_table' class='table table-bordered table-hover'>";
	
	html += "<thead><tr><th class='text-center'>스테이징 시퀀스</th>";
	html += "<th class='text-center'>캠페인ID</th>";
	html += "<th class='text-center'>학습모델</th>";
	html += "<th class='text-center'>예측성공여부</th>";
	html += "<th class='text-center'>성공예측률</th>";
	html += "<th class='text-center'>실패예측률</th>";
	html += "<th class='text-center'>스테이징 컬럼1</th></tr></thead><tbody>";
	
	// 데이터 존재 미존재 여부에 따른 표 표시
	if(arr.length != 0) {
		for (var i = 0; i < arr.length; i++) {
			html += "<tr><td>" + arr[i]["stSeq"] + "</td>";
			html += "<td>" + arr[i]["camId"] + "</td>";
			html += "<td>" + arr[i]["trainMethod"] + "</td>";
			html += "<td>" + arr[i]["predict"] + "</td>";
			html += "<td>" + arr[i]["succProb"] + "</td>";
			html += "<td>" + arr[i]["failProb"] + "</td>";
			html += "<td>" + arr[i]["stC1"] + "</td></tr>";
		}
	}
	
	html += "</tbody></table>";
	  	
	$("#div_predict").html(html);					// innerHtml jquery버전
}

// 캠페인 테이블에 데이터가 없을 경우 사용하는 함수
function noDataCamId() {
	var camHtml = "<table id='cpi_table' class='table table-bordered table-hover'>";
	
	camHtml += "<thead><tr><th class='text-center'>체크</th>";
	camHtml += "<th class='text-center'>캠페인ID</th>";
	camHtml += "<th class='text-center'>캠페인이름</th>";
	camHtml += "<th class='text-center'>등록자</th>";
	camHtml += "<th class='text-center'>캠페인목적</th>";
	camHtml += "<th class='text-center'>캠페인상태</th>";
	camHtml += "<th class='text-center'>캠페인 등록일자</th>";
	camHtml += "<th class='text-center'>설명</th>";
	camHtml += "<th class='text-center'>메시지</th></tr></thead><tbody>";
	
	camHtml += "<tr><td class='text-center' colspan='9'>조회된 데이터가 없습니다.</td></tr>";
	
	camHtml += "</tbody></table>";
  	
	$("#div_campaign").html(camHtml);					// 캠페인 html
	
	var modelHtml = "<table id='model_table' class='table table-bordered table-hover'>";
	
	modelHtml += "<thead><tr><th class='text-center'>캠페인ID</th>";
	modelHtml += "<th class='text-center'>학습모델</th>";
	modelHtml += "<th class='text-center'>기존정확도</th>";
	modelHtml += "<th class='text-center'>AI정확도</th>";
	modelHtml += "<th class='text-center'>학습시작시간</th>";
	modelHtml += "<th class='text-center'>학습종료시간</th>";
	modelHtml += "<th class='text-center'>선택Model</th>";
	modelHtml += "<th class='text-center'>메시지</th></tr></thead><tbody>";
	
	modelHtml += "<tr><td class='text-center' colspan='8'>조회된 데이터가 없습니다.</td></tr>";
	
	modelHtml += "</tbody></table>";
  	
	$("#div_model").html(modelHtml);					// 모델 html
	
	$("#pagination_predict").twbsPagination("destroy");
	
	noDataPredict();
}

// 학습 예측 결과 데이터가 없을 경우 사용하는 함수
function noDataPredict() {
	var pHtml = "<table id='cam_table' class='table table-bordered table-hover'>";
	
	pHtml += "<thead><tr><th class='text-center'>스테이징 시퀀스</th>";
	pHtml += "<th class='text-center'>캠페인ID</th>";
	pHtml += "<th class='text-center'>학습모델</th>";
	pHtml += "<th class='text-center'>예측성공여부</th>";
	pHtml += "<th class='text-center'>성공예측률</th>";
	pHtml += "<th class='text-center'>실패예측률</th>";
	pHtml += "<th class='text-center'>스테이징 컬럼1</th></tr></thead><tbody>";
	
	pHtml += "<tr><td class='text-center' colspan='7'>조회된 데이터가 없습니다.</td></tr>";
	
	pHtml += "</tbody></table>";
  	
	$("#div_predict").html(pHtml);					// 예측결과 html
}

// 조회 버튼 클릭 시 나오는 예측 결과
function search() {
	if(predictCamId != 0) {
		predictCount();
	} else {
		$("#modal_no_data").modal("show");
	}
}

// csv 다운로드 함수
function csvDown() {
	var succVal = $("#succ_rate").val();
	var extractVal = $("#extract").val();
	
	if((predictCamId != 0) && (predictCamId != null) && (predictCamId != "")) {
		window.open("/file/down/predict/"+currentValue+"/"+succVal+"/"+extractVal);
	} else {
		$("#modal_no_down").modal("show");
	}
	
	$("#modal_down").modal("hide");
}