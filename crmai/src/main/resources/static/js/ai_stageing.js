var train_nowPages = 1;
var train_totalPages = 10;
var train_visiblePages = 10;

var train_page_st = 1;
var train_page_end = 10;

function aiStagingTrain(){
	 alert("call aiStagingTrain :: " + currentValue + " :: " +train_nowPages);
	 
	 grid_aiStagingTrainPage(train_totalPages, train_visiblePages);
}


function grid_aiStagingTrainPage(train_totalPages, train_visiblePages){
	alert("grid_aiStagingTrainPage :: " + train_totalPages + " :: " + train_visiblePages);
	
	$('#id_Train_pagination').twbsPagination('destroy');
	window.pagObj = $('#id_Train_pagination').twbsPagination({
          totalPages: train_totalPages,
          visiblePages: train_visiblePages,
          onPageClick: function (event, page) {
        	  //alert("on1 " + page + ' (from event listening)');
        	  
        	  train_page_st = ((1 * train_visiblePages) * page) - (train_visiblePages - 1);
        	  train_page_end = (train_page_st + train_visiblePages) - 1;
        	  
        	  alert("grid_aiStagingTrainPage :: " + train_page_st + " :: " + train_page_end);
        	  
        	  search_aiStagingTrain(currentValue, page, page_st, page_end);
          }
    }).on('page', function (event, page) {
        //alert("on2 " + page + ' (from event listening)');
    });
}


function search_aiStagingTrain(currentValue, page, page_st, page_end){

	alert("search_aiStagingTrain :: " + currentValue + " :: " + page + " :: " + page_st + " :: " + page_end );
	
  	var staingTrain = new Object();
  	staingTrain.cam_id = currentValue;
  	staingTrain.page = page;
  	staingTrain.page_st = page_st;
  	staingTrain.page_end = page_end;
  	
    $.ajax({
        type    : 'GET', // method
        url     : '/staging/train',
        //url       : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
        async   : 'true', // true
        data    : staingTrain, // GET 요청은 지원되지 않습니다.
        processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
        cache: false,
        contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
        success : function(data){
        	
        	var obj = JSON.stringify(data, true, 2);
        	alert("search_campaignDetail result :: " + obj);
        	
        	grid_tableStagingTrain(obj);
        	
        },
        error : function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});
}
  