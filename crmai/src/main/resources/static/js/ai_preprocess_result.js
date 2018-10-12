/**
 * 학습결과 - 전처리 결과 자바스크립트 코드
 */
var currentValue = 0;

function handleClick(myRadio) {
    currentValue = myRadio.value;
    
    choiceData(1);									// 캠페인 초기화 시나 페이징 번호 클릭 시 처음은 학습데이터 처리전 데이터부터 불러오는 것으로 초기화
}
  
function radioInit(myRadio) {  
	if(myRadio != 0){
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
	$("#pagination_cam").twbsPagination({
        totalPages: totalPage,
        visiblePages: displayPage,
        onPageClick: function (event, page) {
        	newSearchCampaign(page);
        }
    });
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
	var html = "<table id='cpi_ai_table' class='table table-bordered table-hover'>";
	var first = true;
	
	html += "<thead><tr><th class='text-center'>체크</th>";
	html += "<th class='text-center'>캠페인ID</th>";
	html += "<th class='text-center'>캠페인이름</th>";
	html += "<th class='text-center'>등록자</th>";
	html += "<th class='text-center'>캠페인목적</th>";
	html += "<th class='text-center'>캠페인상태</th>";
	html += "<th class='text-center'>AI진행상태</th>";
	html += "<th class='text-center'>AI버튼</th>";
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
					case "cam_itype":
						switch (arr[arrIdx][val]) {
							case "0":
								html += "<td><span class='label label-info'>데이터 로딩 필요</span></td>";
								html += "<td><button type='button' class='btn btn-info btn-xs'>데이터등록</button></td>";
								
								break;
							case "1":
								html += "<td><span class='label label-warning'>데이터 엑셀 로딩중</span></td>";
								html += "<td></td>";
								
								break;
							case "2":
								html += "<td><span class='label label-warning'>데이터 엑셀 처리중</span></td>";
								html += "<td></td>";
								
								break;
							case "3":
								html += "<td><span class='label label-danger'>데이터 엑셀 처리 오류</span></td>";
								html += "<td><button type='button' class='btn btn-info btn-xs'>데이터 재등록</button></td>";
								
								break;
							case "4":
								html += "<td><span class='label label-primary'>데이터 엑셀 처리 종료</span></td>";
								html += "<td>";
								html += "<button type='button' class='btn btn-success btn-xs'>학습데이터 보기</button>";
								html += "<button type='button' class='btn btn-success btn-xs'>전처리시작</button>";
								html += "</td>";
								
								break;
							default:
								break;
						}
						
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
		
	} else {
		html += "<tr><td class='text-center' colspan='11'>조회된 데이터가 없습니다.</td></tr>";
	}
	
	html += "</tbody></table>";
	  	
	$("#div_campaign").html(html);					// innerHtml jquery버전
	
	choiceData(1);									// 캠페인 초기화 시나 페이징 번호 클릭 시 처음은 학습데이터 처리전 데이터부터 불러오는 것으로 초기화
}

/*
 * 학습, 대상자 데이터 전이나 후의 클릭한 버튼에 따라 데이터를 가져오는 함수
 * thisNo는 클릭한 버튼의 상태 번호를 뜻함
 */
function choiceData(thisNo) {
	switch (thisNo) {
		case 1:
			$("#id_span_msg").text("(학습데이터 처리전)");
			
			break;
		case 2:
			$("#id_span_msg").text("(대상자데이터 처리전)");
			
			break;
		case 3:
			$("#id_span_msg").text("(학습데이터 처리후)");
			
			break;
		case 4:
			$("#id_span_msg").text("(대상자데이터 처리후)");
			
			break;
		default:
			break;
	}
	
	var stagingData = {
		statusFlag : thisNo,
		cam_id : currentValue
	};
	
	$.ajax({
		url:"/staging/count",
		data:stagingData,
		success:function(pagingData) {
			createPagenationPreprocess(pagingData["realEndPage"], pagingData["displayPageNum"], thisNo);
		}
	});
}

function createPagenationPreprocess(totalPage, displayPage, thisNo) {
	$("#pagination_preprocess").twbsPagination("destroy");
	$("#pagination_preprocess").twbsPagination({
        totalPages: totalPage,
        visiblePages: displayPage,
        onPageClick: function (event, page) {
        	searchPreprocess(page, thisNo);
        }
    });
}

function searchPreprocess(clickPage, thisNo) {
	var stagingData = { 
		statusFlag : thisNo,
		cam_id : currentValue,
		page : clickPage
	};
		
	$.ajax({
		url:"/staging/list",
		data:stagingData,
		success:function(data) {
			createTablePreprocess(data);
		}
	});	
}

function createTablePreprocess(arr){
	var html = "<table id='preprcs_ai_table' class='table table-bordered table-hover'>";
	
	html += "<thead><tr><th class='text-center'>SEQ</th>";
	html += "<th class='text-center'>캠페인ID</th>";
	html += "<th class='text-center'>컬럼1</th>";
	html += "<th class='text-center'>컬럼2</th>";
	html += "<th class='text-center'>컬럼3</th>";
	html += "<th class='text-center'>컬럼4</th>";
	html += "<th class='text-center'>컬럼5</th>";
	html += "<th class='text-center'>컬럼6</th>";
	html += "<th class='text-center'>컬럼7</th>";
	html += "<th class='text-center'>컬럼8</th>";
	html += "<th class='text-center'>컬럼9</th>";
	html += "<th class='text-center'>컬럼10</th>";
	html += "<th class='text-center'>컬럼200</th></tr></thead><tbody>";
	
	// 데이터 존재 미존재 여부에 따른 표 표시
	if(arr.length != 0) {
		arr.forEach(function(arrVal, arrIdx) {
			html += "<tr>";
			
			Object.getOwnPropertyNames(arr[arrIdx]).forEach(function(val, idx, array) {
				if(val == "st_seq" || val == "cam_id" || val == "st_c1" || val == "st_c2" || val == "st_c3" ||
					val == "st_c4" || val == "st_c5" || val == "st_c6" || val == "st_c7" || val == "st_c8" || 
					val == "st_c9" || val == "st_c10" || val == "st_c200") {
					
					html += "<td>" + arr[arrIdx][val] + "</td>";
				}
			});
			
			html += "</tr>";
		});
		
	} else {
		html += "<tr><td class='text-center' colspan='13'>조회된 데이터가 없습니다.</td></tr>";
	}
	
	html += "</tbody></table>";
	  	
	$("#div_preprocess").html(html);					// innerHtml jquery버전
	
}