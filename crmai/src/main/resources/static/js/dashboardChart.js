//labels
types = [ "통신", "금융", "유통", "기타" ];
periods = [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월",
		"12월" ];
campaigns = [ "정확도(%)", "예측(%)", "결과(%)" ];
chartBGColor = [ 'rgba(81, 152, 255, 0.6)', 'rgba(243, 115, 79, 0.6)',
		'rgba(0, 180, 175, 0.6)' ];

// elements 

leftOriginal = [ 0, 0, 0, 0 ];
leftSo = [ 0, 0, 0, 0 ];
leftReal = [ 0, 0, 0, 0 ];

rightOriginal = [ 0, 0, 0, 0 ];
rightSo = [ 0, 0, 0, 0 ];
rightReal = [ 0, 0, 0, 0 ];

var chartOptions = {
	legend : {
		labels : {
			fontColor : '#666'
		}
	},
	scales : {
		xAxes : [ {
			gridLines : {
				display : false
			},
			maxBarThickness : 35
		} ],
		yAxes : [ {
			gridLines : {
				display : false
			},
			ticks : {
				beginAtZero : true
			},
			gridLines : {
				display : true,
				drawBorder : true,
				drawOnChartArea : true,
				drawTicks : false,
			}
		}, ]
	},
	tooltips : {
		mode : 'index'
	},
	legend : {
		position : 'bottom',
	}
};


function initLeftChart() {
	var ctxLeft = document.getElementById("chBarLeft").getContext('2d');
	leftChart = new Chart(ctxLeft, {
		type : 'bar',
		data : {
			labels : campaigns,
			datasets : [ {
				label : "캠페인",
				data : [ leftOriginal, leftSo, leftReal ],
				backgroundColor : chartBGColor,
				borderWidth : 0
			} ]
		},
		options : chartOptions
	});
	//tab 만들기
	loadLeftTab();
	totalLeft();
}

function loadLeftTab() {
	var data = { "pers": "y"};
	var periodData = {"pers" : "y", "period" : "y"};
	
	$.ajax({
		type : "GET",
		url : "/dashboardChart/period",
		cache : false,
		processData : true,
		data: periodData,
		async : true,
		success : function(data) {
			var html = "<li role='presentation'><a class='dropdown-header' role='menuitem' tabindex='-1'>선택하세요</a></li><li role='presentation' class='divider'></li>";
			$.each(data, function(index, value) {
				html += "<li role='presentation'><a role='menuitem' data-toggle='tab' tabindex='-1' href='#' id='leftPeriod"
					+ index
					+ "-tab' onclick='toggleLeft(2,"
					+ this.totalBase
					+ ")'>"+ this.totalBase + "년</a></li>";
			});
			var div1 = document.querySelector('#leftPeriod');
			div1.innerHTML = html;
		},
		error : function(e) {
		}
	});
	
	$.ajax({
		type : "GET",
		url : "/dashboardChart/campaignTab",
		cache : false,
		processData : true,
		data: data,
		async : true,
		success : function(data) {
			var html = "<li role='presentation'><a class='dropdown-header' role='menuitem' tabindex='-1'>선택하세요</a></li><li role='presentation' class='divider'></li>";
			$.each(data, function(index, value) {
				
				html += "<li role='presentation'><a role='menuitem' data-toggle='tab' tabindex='-1' href='#' id='leftCampaign"
					+ index
					+ "-tab' onclick='toggleLeft(3,"
					+ this.camId
					+ ")'>"+ this.camName + "</a></li>";
			});
			var div1 = document.querySelector('#leftCam');
			div1.innerHTML = html;
		},
		error : function(e) {
		}
	});
}
function loadRightTab() {
	var data;
	var periodData = {"period" : "y"};
	
	$.ajax({
		type : "GET",
		url : "/dashboardChart/type",
		cache : false,
		processData : true,
		data: data,
		async : true,
		success : function(data) {
			
			var html = "<li role='presentation'><a class='dropdown-header' role='menuitem' data-toggle='tab' tabindex='-1' href='#' onclick='totalRight()'>전체보기</a></li><li role='presentation' class='divider'></li>";
			$.each(data, function(index, value) {
				html += "<li role='presentation'><a role='menuitem' data-toggle='tab' tabindex='-1' href='#' id='rightType"
					+ index
					+ "-tab' onclick='toggleRight(1,"
					+ this.totalBase
					+ ")'>";
				switch (this.totalBase) {
				case "1":
					html += "통신분야</a></li>";
					break;
				case "2":
					html += "금융분야</a></li>";
					break;
				case "3":
					html += "유통분야</a></li>";
					break;
				case "0":
					html += "기타분야</a></li>";
					break;
				}
			});
			
			var div1 = document.querySelector('#rightType');
			div1.innerHTML = html;
		},
		error : function(e) {
		}
	});
	
	$.ajax({
		type : "GET",
		url : "/dashboardChart/period",
		cache : false,
		processData : true,
		data: periodData,
		async : true,
		success : function(data) {
			var html = "<li role='presentation'><a class='dropdown-header' role='menuitem' tabindex='-1'>선택하세요</a></li><li role='presentation' class='divider'></li>";
			$.each(data, function(index, value) {
				html += "<li role='presentation'><a role='menuitem' data-toggle='tab' tabindex='-1' href='#' id='rightPeriod"
					+ index
					+ "-tab' onclick='toggleRight(2,"
					+ this.totalBase
					+ ")'>"+ this.totalBase + "년</a></li>";
			});
			var div1 = document.querySelector('#rightPeriod');
			div1.innerHTML = html;
		},
		error : function(e) {
		}
	});
	
	$.ajax({
		type : "GET",
		url : "/dashboardChart/campaignTab",
		cache : false,
		processData : true,
		data: data,
		async : true,
		success : function(data) {
			var html = "<li role='presentation'><a class='dropdown-header' role='menuitem' tabindex='-1'>선택하세요</a></li><li role='presentation' class='divider'></li>";
			$.each(data, function(index, value) {
				
				html += "<li role='presentation'><a role='menuitem' data-toggle='tab' tabindex='-1' href='#' id='rightCampaign"
					+ index
					+ "-tab' onclick='toggleRight(3,"
					+ this.camId
					+ ")'>"+ this.camName + "</a></li>";
			});
			var div1 = document.querySelector('#rightCam');
			div1.innerHTML = html;
		},
		error : function(e) {
		}
	});
}


function initRightChart() {
	var ctxRight = document.getElementById("chBarRight").getContext('2d');
	rightChart = new Chart(ctxRight, {
		type : 'bar',
		data : {labels : types,
		datasets : [ {
			label : '정확도(%)',
			data : rightOriginal,
			backgroundColor : 'rgba(81, 152, 255, 0.6)',
			borderWidth : 0,
		}, {
			label : '예측(%)',
			data : rightSo,
			backgroundColor : 'rgba(243, 115, 79, 0.6)',
			borderWidth : 0,
		}, {
			label : '결과(%)',
			data : rightReal,
			backgroundColor : 'rgba(0, 180, 175, 0.6)',
			borderWidth : 0
		} ]
	},
		options : chartOptions
	});
	
	loadRightTab();
	totalRight();
}

function totalLeft() {
	var data = { "pers": "y"};
	
	$.ajax({
		type : "GET",
		url : "/dashboardChart/total",
		cache : false,
		processData : true,
		data: data,
		async : true,
		success : function(data) {
			loadLeftStat(data);
		},
		error : function(e) {
		}
	});
	
	var title = document.getElementById('LChartTitle');
	$(title).text("산업군별 정확도 예측 결과");
	
	getLeftType(data);
}

function totalRight() {
	var data;
	
	$.ajax({
		type : "GET",
		url : "/dashboardChart/total",
		cache : false,
		processData : true,
		data: data,
		async : true,
		success : function(data) {
			loadRightStat(data);
			
		},
		error : function(e) {
		}
	});
	
	var title = document.getElementById('RChartTitle');
	$(title).text("산업군별 정확도 예측 결과");
	
	getRightType(data);
}


function getLeftType(data) {
	var etc = 3;
	$.ajax({
		type : "GET",
		url : "/dashboardChart/type",
		cache : false,
		processData : true,
		data : data,
		async : true,
		success : function(data) {
			leftOriginal = 0;
			leftSo = 0;
			leftReal = 0;
			var label;
			$.each(data, function() {
				switch(this.totalBase) {
				case "1":
					label = "통신분야";
					break;
				case "2":
					label = "금융분야";
					break;
				case "3":
					label = "유통분야";
					break;
				case "0":
					label = "기타분야";
					break;
				}
				leftOriginal = this.totalOriginal;
				leftSo = this.totalSo;
				leftReal = this.totalReal;
			});
			var some_new_data = {
					labels : campaigns,
					datasets : [ {
						label : label,
						data : [ leftOriginal, leftSo, leftReal ],
						backgroundColor : chartBGColor,
						borderWidth : 0
					} ]
				};

			leftChart.config.data = some_new_data;
			leftChart.update();

		},
		error : function(e) {
		}
	});
}
function getRightType(data) {
	var etc = 3;
	
	$.ajax({
		type : "GET",
		url : "/dashboardChart/type",
		cache : false,
		processData : true,
		data : data,
		async : true,
		success : function(data) {
			rightOriginal = [ 0, 0, 0, 0 ];
			rightSo = [ 0, 0, 0, 0 ];
			rightReal = [ 0, 0, 0, 0 ];
			
			$.each(data, function() {
				
				if (this.totalBase != 0) {
					rightOriginal[this.totalBase - 1] = this.totalOriginal;
					rightSo[this.totalBase - 1] = this.totalSo;
					rightReal[this.totalBase - 1] = this.totalReal;
				} else if (this.totalBase == 0) {
					rightOriginal[etc] = this.totalOriginal;
					rightSo[etc] = this.totalSo;
					rightReal[etc] = this.totalReal;
				}
			});
			var some_new_data = {
					labels : types,
					datasets : [ {
						label : '정확도(%)',
						data : rightOriginal,
						backgroundColor : 'rgba(81, 152, 255, 0.6)',
						borderWidth : 0,
					}, {
						label : '예측(%)',
						data : rightSo,
						backgroundColor : 'rgba(243, 115, 79, 0.6)',
						borderWidth : 0,
					}, {
						label : '결과(%)',
						data : rightReal,
						backgroundColor : 'rgba(0, 180, 175, 0.6)',
						borderWidth : 0
					} ]
			};
			
			rightChart.config.data = some_new_data;
			rightChart.update();
			
		},
		error : function(e) {
		}
	});
}

function getLeftPeriod(data) {
	$.ajax({
		type : "GET",
		url : "/dashboardChart/period",
		cache : false,
		processData : true,
		data : data,
		async : true,
		success : function(data) {
			leftOriginal = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			leftSo = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			leftReal = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			
			$.each(data, function() {
				if (this.totalBase != 0) {
					leftOriginal[this.totalBase - 1] = this.totalOriginal;
					leftSo[this.totalBase - 1] = this.totalSo;
					leftReal[this.totalBase - 1] = this.totalReal;
				} else {
					leftOriginal[this.totalBase] = this.totalOriginal;
					leftSo[this.totalBase] = this.totalSo;
					leftReal[this.totalBase] = this.totalReal;
				}
			});
			var some_new_data = {
					labels : periods,
					datasets : [ {
						label : '정확도(%)',
						data : leftOriginal,
						backgroundColor : 'rgba(81, 152, 255, 0.6)',
						borderWidth : 0,
					}, {
						label : '예측(%)',
						data : leftSo,
						backgroundColor : 'rgba(243, 115, 79, 0.6)',
						borderWidth : 0,
					}, {
						label : '결과(%)',
						data : leftReal,
						backgroundColor : 'rgba(0, 180, 175, 0.6)',
						borderWidth : 0
					} ]
			};
			
			leftChart.config.data = some_new_data;
			leftChart.update();
			
		},
		error : function(e) {
		}
	});
}
function getRightPeriod(data) {
	$.ajax({
		type : "GET",
		url : "/dashboardChart/period",
		cache : false,
		processData : true,
		data : data,
		async : true,
		success : function(data) {
			rightOriginal = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			rightSo = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			rightReal = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			
			$.each(data, function() {
				if (this.totalBase != 0) {
					rightOriginal[this.totalBase - 1] = this.totalOriginal;
					rightSo[this.totalBase - 1] = this.totalSo;
					rightReal[this.totalBase - 1] = this.totalReal;
				} else {
					rightOriginal[this.totalBase] = this.totalOriginal;
					rightSo[this.totalBase] = this.totalSo;
					rightReal[this.totalBase] = this.totalReal;
				}
			});
			var some_new_data = {
					labels : periods,
					datasets : [ {
						label : '정확도(%)',
						data : rightOriginal,
						backgroundColor : 'rgba(81, 152, 255, 0.6)',
						borderWidth : 0,
					}, {
						label : '예측(%)',
						data : rightSo,
						backgroundColor : 'rgba(243, 115, 79, 0.6)',
						borderWidth : 0,
					}, {
						label : '결과(%)',
						data : rightReal,
						backgroundColor : 'rgba(0, 180, 175, 0.6)',
						borderWidth : 0
					} ]
			};
			
			rightChart.config.data = some_new_data;
			rightChart.update();
			
		},
		error : function(e) {
		}
	});
}

function getLeftCampaign(data) {
	$.ajax({
		type : "GET",
		url : "/dashboardChart/campaign",
		cache : false,
		processData : true,
		data : data,
		async : true,
		success : function(data) {
			leftOriginal = 0;
			leftSo = 0;
			leftReal = 0;
			var label;
			$.each(data, function() {
				label = this.totalBase;
				leftOriginal = this.totalOriginal;
				leftSo = this.totalSo;
				leftReal = this.totalReal;
			});
			var some_new_data = {
					labels : campaigns,
					datasets : [ {
						label : label,
						data : [ leftOriginal, leftSo, leftReal ],
						backgroundColor : chartBGColor,
						borderWidth : 0
					} ]
				};
			
			leftChart.config.data = some_new_data;
			leftChart.update();

		},
		error : function(e) {
		}
	});
}
function getRightCampaign(data) {
	$.ajax({
		type : "GET",
		url : "/dashboardChart/campaign",
		cache : false,
		processData : true,
		data : data,
		async : true,
		success : function(data) {
			rightOriginal = 0;
			rightSo = 0;
			rightReal = 0;
			var label;
			$.each(data, function() {
				label = this.totalBase;
				rightOriginal = this.totalOriginal;
				rightSo = this.totalSo;
				rightReal = this.totalReal;
			});
			var some_new_data = {
					labels : campaigns,
					datasets : [ {
						label : label,
						data : [ rightOriginal, rightSo, rightReal ],
						backgroundColor : chartBGColor,
						borderWidth : 0
					} ]
			};
			
			rightChart.config.data = some_new_data;
			rightChart.update();
			
		},
		error : function(e) {
		}
	});
}

function toggleLeft(kind, cngTitle) {
	var title = document.getElementById('LChartTitle');

	switch (kind) {
	case 1:
		var data = {"pers" : "y", "type" : cngTitle};
		
		switch (cngTitle) {
		case 1:
			$(title).text("통신분야 정확도 예측 결과");
			break;
		case 2:
			$(title).text("금융분야 정확도 예측 결과");
			break;
		case 3:
			$(title).text("유통분야 정확도 예측 결과");
			break;
		case 0:
			$(title).text("기타분야 정확도 예측 결과");
			break;
		}
		
		getLeftType(data);

		break;
	case 2:
		var data = {"pers" : "y", "periodBase" : cngTitle};
		
		$(title).text("( " + cngTitle + "년 ) 월별 통계");

		getLeftPeriod(data);
		break;
	case 3:
		var data = {"pers" : "y", "campaign" : cngTitle};
		$(title).text("캠페인별 정확도");
		getLeftCampaign(data);
		break;
	}
}

function toggleRight(kind, cngTitle) {
	var title = document.getElementById('RChartTitle');
	
	switch (kind) {
	case 1:
		var data = {"type" : cngTitle};
		
		switch (cngTitle) {
		case 1:
			$(title).text("통신분야 정확도 예측 결과");
			break;
		case 2:
			$(title).text("금융분야 정확도 예측 결과");
			break;
		case 3:
			$(title).text("유통분야 정확도 예측 결과");
			break;
		case 0:
			$(title).text("기타분야 정확도 예측 결과");
			break;
		}
		
		getRightType(data);
		
		break;
	case 2:
		var data = {"periodBase" : cngTitle};
		
		$(title).text("( " + cngTitle + "년 ) 월별 통계");
		
		getRightPeriod(data);
		break;
	case 3:
		var data = {"campaign" : cngTitle};
		$(title).text("캠페인별 정확도");
		getRightCampaign(data);
		break;
	}
}

function loadLeftStat(stData) {
	var stat = $('#leftStat');

	var totalData = [ stData.totalOriginal, stData.totalSo,
		stData.totalReal ];
	
	for (var i = 0; i < 3; i++) {

		if (i % 3 == 1) {
			for (var j = 0; j < 3; j++) {
				stat.find("div span").eq(i + j * 3).text(
						totalData[j] + "%");
			}
		}

		if (i % 3 == 2) {
			for (var j = 0; j < 3; j++) {
				stat.find("div span").eq(i + j * 3).text(
						"(" + stData.totalCount + "건)");
			}
		}
	}
}

function loadRightStat(stData) {
	var stat = $('#rightStat');
	
	var totalData = [ stData.totalOriginal, stData.totalSo,
		stData.totalReal ];
	
	for (var i = 0; i < 3; i++) {

		if (i % 3 == 1) {
			for (var j = 0; j < 3; j++) {
				stat.find("div span").eq(i + j * 3).text(
						totalData[j] + "%");
			}
		}

		if (i % 3 == 2) {
			for (var j = 0; j < 3; j++) {
				stat.find("div span").eq(i + j * 3).text(
						"(" + stData.totalCount + "건)");
			}
		}

	}
}