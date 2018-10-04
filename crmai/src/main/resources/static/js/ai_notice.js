var notice_totalpage = 10;
var notice_visiblePages = 10;

var notice_page_st = 1;
var notice_page_end = 10;

var page_no = 1;

function grid_pagingNotice(div){
	//alert("call grid_pagingNotice ");
	
	div.twbsPagination('destroy');
	window.pagObj = div.twbsPagination({
          totalPages: notice_totalpage,
          visiblePages: notice_visiblePages,
          onPageClick: function (event, page) {
        	  
        	  notice_page_st = ((1 * notice_visiblePages) * page) - (notice_visiblePages - 1);
        	  notice_page_end = (notice_page_st + notice_visiblePages) - 1;
        	  
        	  search_notice();
          }
    }).on('page', function (event, page) {
    });
}


function search_notice(){
	//alert("search_st :: code[" + currentValue + "],s1_totalpage[" + s1_totalpage + "], s1_page_st[" + s1_page_st + "], s1_page_end[" + s1_page_end + "]");
	
	var code = currentValue;
	
	var page = new Object();
	page.code = code;
	page.page_st = notice_page_st;
	page.page_end = notice_page_end;
	page.page = page_no;
	
	$.ajax({
        type    : 'GET', // method
        url     : '/notice/result',
        //url       : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
        async   : 'true', // true
        data    : page, // GET 요청은 지원되지 않습니다.
        processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
        cache: false,
        contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
        success : function(data){
        	var obj = JSON.stringify(data, true, 2);
        	//alert("search_st result :: " + obj);
        	
        	grid_tableNotice(obj);
        	
        },
        error : function(request,status,error){
        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});

}

function grid_tableNotice(obj){
	//alert("grid_table_campaign :: " + obj);
	var div = document.querySelector('#ai_notice');
    
	html = '<table style="width: 100%" class="table table-bordered table-striped table-hover text-center">';
    html += 	'<thead><tr>';
    html += 	'<th style="width: 70px">번호</th>';
    html += 	'<th style="width: 65%">제목</th>';
    html += 	'<th style="width: 100px">작성자</th>';
    html += 	'<th style="width: 100px">날짜</th>';
    html += 	'<!--<th>조회수</th>-->';
    html += 	'</tr></thead>';
    html += '<tbody>';
    
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
    
    div.innerHTML = html;
}