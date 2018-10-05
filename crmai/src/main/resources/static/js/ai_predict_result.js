/**
 * 	예측 결과 관련 자바스크립트 코드
 */

var pTotalPage = 10;
var pVisiblePages = 10;

var pPageSt = 1;
var pPageEnd = 10;

// 캠페인과 연결되어 불러오는 ajax
function connectCampaignAjax(currentCamId) {
	// 숫자형으로 변형
	currentCamId = Number(currentCamId);
	
	$.ajax({
		url:"/predict/list",
		data:{
			camId : currentCamId
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
	} else {
		html += "<tr><td class='text-center' colspan='7'>조회된 데이터가 없습니다.</td></tr>";
	}
	
	html += "</tbody></table>";
	  	
	$("#div_table").html(html);					// innerHtml jquery버전
}