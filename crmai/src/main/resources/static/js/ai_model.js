
function get_aiTrainModel(){
	//alert("call get_aiTrainModel ::" + currentValue);
	
	//var cam_id = currentValue;
	var cam_id = "1004";
	
	var page = new Object();
	page.cam_id = cam_id;
	
	$.ajax({
        type    : 'GET', // method
        url     : '/model/list',
        //url       : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
        async   : 'true', // true
        data    : page, // GET 요청은 지원되지 않습니다.
        processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
        cache: false,
        contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
        success : function(data){
        	var obj = JSON.stringify(data, true, 2);
        	alert("search_st result :: " + obj);
        	
        	grid_tableModel(obj);
        	
        },
        error : function(request,status,error){
        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});
}

function grid_tableModel(obj){
	  var div = document.querySelector('#ai_model_View');
	  
    //alert("grid_table_learning_asis :: " + obj);

    html = '<table class="table table-bordered table-hover">';
    html += '<thead><tr><th>캠페인ID</th><th>학승방법</th><th>기존정확도</th><th>AI정확도</th><th>학습시작시간</th><th>학습종료시간</th><th>선택Model</th><th>메시지</th></tr></thead>';
    html += '<tbody>';

    var json = $.parseJSON(obj);
 	  $(json).each(function(i,val){
 		html += '<tr>';
 		$.each(val,function(k,v){
 			
 			if(k == 'cam_id') {
 				html += '<td>' + v + '</td>';	
 			}
 			
 			if(k == 'train_method') {
 				html += '<td>' + v + '</td>';	
 			}
 			
 			if(k == 'original_acc') {
 				html += '<td>' + v + '%</td>';	
 			}
 			
 			if(k == 'so_acc') {
 				html += '<td>' + v + '%</td>';	
 			}
 			
 			if(k == 'train_start') {
 				html += '<td>' + v + '</td>';	
 			}
 			
 			if(k == 'train_end') {
 				html += '<td>' + v + '</td>';	
 			}
 			
 			if(k == 'model_flag') {
 				html += '<td>' + v + '</td>';	
 			}
 			
 			if(k == 'desc_text') {
 				html += '<td>' + v + '</td>';	
 			}
			
 		});
 		
 		html += '</tr>';
	  });
 	  html += '</tbody>';
    html += '</table>';
    
    div.innerHTML = html;
}

function setAiTrainModelChart(){
	
	alert("call setAiTrainModelChart " );
	

}