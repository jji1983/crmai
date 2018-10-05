var nowPages = 1;
var totalPages = 1;
var visiblePages = 5;
	  
var page_st = 1;
var page_end = 5;
  	  
var currentValue = 0;
	  
// 중지를 위해 ID 보관
var timerId = null;
	  
function handleClick(myRadio) {
      //alert('Old value: ' + currentValue);
      //alert('New value: ' + myRadio.value);
      currentValue = myRadio.value;
       
	  $("#ai_status").show(); //현황창 보이기
	  $("#id_span_msg").text("캠페인ID :: " + currentValue);
      
	  getAIStatus();
	  
	  if(timerId != null) {
	        clearInterval(timerId);
	  }
	  
	  timerId = setInterval("getAIStatus()", 30000);
}
  
function radioInit(myRadio) {
	  
	  //alert("radioInit :: " + myRadio);
	  
	  if(myRadio != 0){
		  $("#ai_status").show(); //현황창 보이기
		  $("#id_span_msg").text("캠페인ID :: " + myRadio); 
		  
		  currentValue = myRadio;
	  }
	  
	  if(timerId != null) {
	        clearInterval(timerId);
	  }
	  timerId = setInterval("getAIStatus()", 30000);
}
	  
function campaignPage(){
	var admin = new Object();

	//alert("campaignPage call ");
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
    		//alert( "data :: " + data[0]);
    		
    		if(data[0] != "0"){
    			totalPages = Math.ceil(data[0] / visiblePages);
    		
    			//alert( "totalPages :: " + totalPages + " :: " + visiblePages);
    			grid_pagination(totalPages, visiblePages);
    		}else{
    			$("#id_span_msg").text("등록된 캠페인 이 없습니다. >> \"캠페인 신규등록 \"버튼 클릭!");
    			$("#ai_status").hide(); //학습데이터 숨기기
    		}
        },
        error   : function(request,status,error){
        	 //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	 
        	 responseError(error);
        	 
        	 $('#msg').html(error);
	        }
		});
}
	  
function grid_pagination(totalPages, visiblePages){
		//alert("grid_pagination :: " + totalPages + " :: " + visiblePages);
		
		$('#pagination').twbsPagination('destroy');
		window.pagObj = $('#pagination').twbsPagination({
	          totalPages: totalPages,
	          visiblePages: visiblePages,
	          onPageClick: function (event, page) {
	        	  //alert("on1 " + page + ' (from event listening)');
	        	  
	        	  page_st = ((1 * visiblePages) * page) - (visiblePages - 1);
	        	  page_end = (page_st + visiblePages) - 1;
	        	  
	              search_campaign(page, page_st, page_end);
	          }
	    }).on('page', function (event, page) {
            //alert("on2 " + page + ' (from event listening)');
        });
}
	   
function search_campaign(now_page, page_st, page_end){
	  
	  	//alert("search_campaign call :: now[" + now_page + "] :: interval[" +visiblePages +"] :: st[" + page_st + "] :: end[" + page_end + "]" );
	  	
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
    var first = 0;
	
    html = '<table width="100%" class="table table-bordered table-hover">';
    html += '<thead><tr>';
    html += 	'<th>체크</th>';
    html += 	'<th>캠페인ID</th>';
    html += 	'<th>캠페인이름</th>';
    html += 	'<th>등록자</th>';
    html += 	'<th>캠페인목적</th>';
    /*html += 	'<th>캠페인상태</th>'; */
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
 			
 			if(k == 'cam_id'){
 				if(first == 0){
 					html += '<td><input type="radio" name="camCheck" checked="checked" onclick="handleClick(this);" value="'+v+'" /></td>';
 					radioInit(v);
 					getAIStatus();
 					first = 1;
 				}else{
 					html += '<td><input type="radio" name="camCheck" onclick="handleClick(this);" value="'+v+'" /></td>';
 				}
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
 			 /*
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
 			 */
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
	
// 파라메터 존재하는 캠페인 찾기 메서드 사용하려면 밑의 new 접두어가 들어간 메서드 사용할 것!!!
function newCampaignPage(){
	var admin = new Object();

	//alert("campaignPage call ");
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
    		//alert( "data :: " + data[0]);
    		
    		if(data[0] != "0"){
    			totalPages = Math.ceil(data[0] / visiblePages);
    		
    			//alert( "totalPages :: " + totalPages + " :: " + visiblePages);
    			newGridPagination(totalPages, visiblePages);
    		}else{
    			$("#id_span_msg").text("등록된 캠페인 이 없습니다. >> \"캠페인 신규등록 \"버튼 클릭!");
    			$("#ai_status").hide(); //학습데이터 숨기기
    		}
        },
        error   : function(request,status,error){
        	 //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	 
        	 responseError(error);
        	 
        	 $('#msg').html(error);
	        }
		});
}
	  
function newGridPagination(totalPages, visiblePages){
		//alert("grid_pagination :: " + totalPages + " :: " + visiblePages);
		
		$('#pagination').twbsPagination('destroy');
		window.pagObj = $('#pagination').twbsPagination({
	          totalPages: totalPages,
	          visiblePages: visiblePages,
	          onPageClick: function (event, page) {
	        	  //alert("on1 " + page + ' (from event listening)');
	        	  
	        	  page_st = ((1 * visiblePages) * page) - (visiblePages - 1);
	        	  page_end = (page_st + visiblePages) - 1;
	        	  
	              newSearchCampaign(page, page_st, page_end);
	          }
	    }).on('page', function (event, page) {
            //alert("on2 " + page + ' (from event listening)');
        });
}
	   
function newSearchCampaign(now_page, page_st, page_end){
	  
	  	//alert("search_campaign call :: now[" + now_page + "] :: interval[" +visiblePages +"] :: st[" + page_st + "] :: end[" + page_end + "]" );
	  	
	  	var campaign = new Object();
	  	campaign.page_st = page_st;
	  	campaign.page_end = page_end;
	  	
	  	campaign.cam_name = $("#cam_name").val();
	  	campaign.cam_type = $("#cam_type").val();
	  	campaign.cam_status = $("#cam_status").val();
	  	
	    $.ajax({
	        type    : 'GET', // method
	        url     : '/campaign/newListPage',
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
	        	
	        	newGridTableCampaign(obj);
	        	
	        },
	        error : function(request,status,error){
	        	 //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});
}
	
function newGridTableCampaign(obj){
	var div = document.querySelector('#ai_campaign');
    var first = 0;
	
    html = '<table width="100%" class="table table-bordered table-hover">';
    html += '<thead><tr>';
    html += 	'<th>체크</th>';
    html += 	'<th>캠페인ID</th>';
    html += 	'<th>캠페인이름</th>';
    html += 	'<th>등록자</th>';
    html += 	'<th>캠페인목적</th>';
    /*html += 	'<th>캠페인상태</th>'; */
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
 			
 			if(k == 'cam_id'){
 				if(first == 0){
 					html += '<td><input id="cam_radio_' + v + '" type="radio" name="cam_check" checked="checked" onclick="handleClick(this);" value="'+v+'" /></td>';
 					radioInit(v);
 					getAIStatus();
 					first = 1;
 				}else{
 					html += '<td><input id="cam_radio_' + v + '" type="radio" name="cam_check" onclick="handleClick(this);" value="'+v+'" /></td>';
 				}
 				html += '<td id="cam_id_val_' + v + '" class="text-center">' + v + '</td>';	
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
 			 /*
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
 			 */
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
    	alert( data );
    	
    	//console.log("SUCCESS : ", data);
        $("#bthNew").prop("disabled", false);
        
        var jbSplit = data.split('::');
        
        //alert("jbSplit :: " + jbSplit );
        
    	if(jbSplit[0] == "OK"){
            //alert('모달 종료.');
            form.reset();
            $('#newModal').modal('hide');
    	    
    	    // alert('캠페인 리프리시');
    	    campaignPage();
    	}
        
    },
    error: function (e) {
        alert("error :: " + e.responseText);
        console.log("ERROR : ", e);
        $("#bthNew").prop("disabled", false);
        }
    });
  }
  
  
  function getAIStatus(){
		//alert('-- getAIStatus -- ['+currentValue+']');
	
	var campaign = new Object();
  	campaign.cam_id = currentValue;
  	
    $.ajax({
        type    : 'GET', // method
        url     : '/campaign/aistatus',
        //url       : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
        async   : 'true', // true
        data    : campaign, // GET 요청은 지원되지 않습니다.
        processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
        cache: false,
        contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
        success : function(data){
        	var obj = JSON.stringify(data, true, 2);
        	
        	//alert("search_campaign result :: " + obj );
        	
        	var json = $.parseJSON(obj);
        	
        	//alert("get Value :: " + json["cam_id"] + " :: " + json["cam_itype"] + " :: " + json["cam_otype"]);
        	
        	var cam_id = json["cam_id"];
        	var cam_itype = json["cam_itype"];
        	var cam_otype = json["cam_otype"];
        	
        	setAiStatus(cam_id, cam_itype, cam_otype);
        	
        },
        error : function(request,status,error){
        	 //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});
  }
  
  
  function setAiStatus(cam_id, cam_itype, cam_otype) {
	  //alert("call setAiStatus :: " + cam_id + " :: " + cam_itype + " :: " + cam_otype);
  $("#ai_status").show(); //현황창 보이기
 
  var button_data1 = "<button type=\"button\">캠페인 신규등록</button>";
 
  var train_text = ["학습데이터 입력전", "학습데이터 입력후", "학습데이터 처리중", "학습데이터 처리 오류", "데이터 미리보기", "전처리 전", "전처리중", "데이터 미리보기"];
  var test_text = ["대상자데이터 입력전", "대상자데이터 입력후", "대상자데이터 처리중", "대상자데이터 처리 오류", "데이터 미리보기", "전처리 전", "전처리중", "데이터 미리보기"];
  var runf_text = ["모델생성 시작전", "모델생성중", "모델 보기"];
  var predict_text = ["예측전", "예측중", "예측오류", "예측데이터 보기"];
  var real_text = ["실측결과 입력"];

  $("#id_loading1_msg").text(train_text[0]);
  $("#id_loading2_msg").text(test_text[0]);
  
  $("#id_pre_msg").text(train_text[5]);
  $("#id_runf_msg").text(runf_text[0]);
  $("#id_predict_msg").text(predict_text[0]);
  $("#id_real_msg").text(real_text[0]);
  
  //학습 데이터 처리 / 테스트 데이터 처리
  if(cam_itype <= 4 || cam_otype <= 4){
	  //alert("학습 데이터 처리 :: " + cam_itype + " 대상자 데이터 처리 :: " + cam_otype);
	  $("#id_loading1_msg").text(train_text[cam_itype]);
	  $("#id_loading2_msg").text(test_text[cam_otype]);
	  
	  //실행중
	  $("#id_loading1_overlay").show(); //전처리 단계 실행중
	  $("#id_loading2_overlay").show(); //전처리 단계 실행중
	  $("#id_pre_overlay").show();      //AI 전처리 단계 실행중
	  $("#id_runf_overlay").show();     //AI 모델 생성 단계 실행중
	  $("#id_predict_overlay").show();  //AI 예측 단계 실행중
	  $("#id_real_overlay").show();  //AI 예측 단계 실행중
	  
  }else if(cam_itype >= 5 && cam_itype <= 7  && cam_otype >= 5 && cam_otype <= 7){ //전처리 단계
	  //alert("전처리 단계 :: " + cam_itype + " :: " + cam_otype);
	
	  $("#id_loading1_msg").text(train_text[4]);
	  $("#id_loading2_msg").text(test_text[4]);
	  $("#id_pre_msg").text(train_text[cam_itype]);
  
	  //실행 완료
	  $("#id_loading1_overlay").hide(); //전처리 단계 실행
	  $("#id_loading2_overlay").hide(); //전처리 단계 실행
	  
	  //실행중
	  $("#id_pre_overlay").show();      //AI 전처리 단계 실행중
	  $("#id_runf_overlay").show();     //AI 모델 생성 단계 실행중
	  $("#id_predict_overlay").show();  //AI 예측 단계 실행중
	  $("#id_real_overlay").show();  //AI 예측 단계 실행중
	
	   
  }else if(cam_itype >= 8 && cam_itype <= 10){ //모델 생성
	  //alert("모델 생성 :: " + cam_itype );
  
	  $("#id_loading1_msg").text(train_text[4]);
	  $("#id_loading2_msg").text(test_text[4]);
	  $("#id_pre_msg").text(train_text[7]);
	  $("#id_runf_msg").text(runf_text[(cam_itype - 8)]);

	  //실행 완료
	  $("#id_loading1_overlay").hide(); //전처리 단계 실행
	  $("#id_loading2_overlay").hide(); //전처리 단계 실행
	  $("#id_pre_overlay").hide();      //AI 전처리 단계 실행중
	  
	  //실행중
	  $("#id_runf_overlay").show();     //AI 모델 생성 단계 실행중
	  $("#id_predict_overlay").show();  //AI 예측 단계 실행중
	  $("#id_real_overlay").show();  //AI 예측 단계 실행중
	  
  }else if(cam_itype >= 11 && cam_itype <= 14){//대상자 처리
	  //alert("대상자 처리 :: " + cam_itype );
	  $("#id_loading1_msg").text(train_text[4]);
	  $("#id_loading2_msg").text(test_text[4]);
	  $("#id_pre_msg").text(train_text[7]);
	  $("#id_runf_msg").text(runf_text[2]);
	  $("#id_predict_msg").text(predict_text[(cam_itype - 11)]);
	  
	  //실행 완료
	  $("#id_loading1_overlay").hide(); //전처리 단계 실행
	  $("#id_loading2_overlay").hide(); //전처리 단계 실행
	  $("#id_pre_overlay").hide();      //AI 전처리 단계 실행중
	  $("#id_runf_overlay").hide();     //AI 모델 생성 단계 실행중

	  if(cam_itype == 14){
  	    //alert("예측 처리 :: " + cam_itype );
		$("#id_predict_overlay").hide();  //AI 예측 단계 실행중
		$("#id_real_overlay").hide();  //AI 예측 단계 실행중
	  }else{
		//실행중
		$("#id_predict_overlay").show();  //AI 예측 단계 실행중
		$("#id_real_overlay").show();  //AI 예측 단계 실행중
	  }
  }else{
	  alert("미 처리 :: " + cam_itype + " :: " + cam_otype);
  }
}
