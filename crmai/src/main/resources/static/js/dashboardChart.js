//labels
types = [ "통신", "금융", "유통", "기타" ];
period = [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월",
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
function initChart() {
	var ctx0 = document.getElementById("chBar0").getContext('2d');
	var ctx5 = document.getElementById("chBar5").getContext('2d');
	
	var some_new_data = {
		labels : types,
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

	leftChart = new Chart(ctx0, {
		type : 'bar',
		data : some_new_data,
		options : chartOptions
	});

	rightChart = new Chart(ctx5, {
		type : 'bar',
		data : some_new_data,
		options : chartOptions
	});

	loadData();
}

function loadData() {
	loadTab();

	// Type 차트 업데이트
	myType();
	totalType();

}

function loadStat() {
	// totalStat
	$
			.ajax({
				type : "GET",
				url : "/dashboardChart/totalStat",
				cache : false,
				processData : true,
				async : true,
				success : function(data) {
					var stat = $('#rightStat')

					var totalData = [ data.totalOriginal, data.totalSo,
							data.totalReal ];
					for (var i = 0; i < 3; i++) {

						if (i % 3 == 1) {
							for (var j = 0; j < 3; j++) {
								stat.find("div span").eq(i + j * 3).text(
										totalData[j] + "%");
							}
						}

						if (i % 3 == 2) {
							for (var j = 0; j < 3; j++) {
								// (20건)
								stat.find("div span").eq(i + j * 3).text(
										"(" + data.totalCount + "건)");
							}
						}

					}

				},
				error : function(e) {
					// console.log("ERROR : ", e);
				}
			});

	// myStat
	$
			.ajax({
				type : "GET",
				url : "/dashboardChart/myStat",
				cache : false,
				processData : true,
				async : true,
				success : function(data) {
					var stat = $('#leftStat');

					var totalData = [ data.totalOriginal, data.totalSo,
							data.totalReal ];
					for (var i = 0; i < 3; i++) {

						if (i % 3 == 1) {
							for (var j = 0; j < 3; j++) {
								stat.find("div span").eq(i + j * 3).text(
										totalData[j] + "%");
							}
						}

						if (i % 3 == 2) {
							for (var j = 0; j < 3; j++) {
								// (20건)
								stat.find("div span").eq(i + j * 3).text(
										"(" + data.totalCount + "건)");
							}
						}

					}

				},
				error : function(e) {
					// console.log("ERROR : ", e);
				}
			});
}

function toggleLeft(kind, cngTitle) {
	var title = document.getElementById('LChartTitle');

	switch (kind) {
	case 1:
		cngTitle = "나의 캠페인 전체";
		$(title).text(cngTitle);

		myType();
		break;
	case 2:
		var tempTitle = "( " + cngTitle + "년 ) 월별 통계";
		$(title).text(tempTitle);

		myPeriod(cngTitle);
		break;
	case 3:
		myCam(cngTitle);
		break;
	}

}
function toggleRight(kind, cngTitle) {
	var title = document.getElementById('RChartTitle');

	// type 1
	if (kind == 1) {
		cngTitle = "전체 캠페인";
		$(title).text(cngTitle);

		totalType();
	}

	// month 2
	if (kind == 2) {
		var tempTitle = "( " + cngTitle + "년 ) 월별 통계";
		$(title).text(tempTitle);

		totalPeriod();
	}

	// campain 3
	if (kind == 3) {

		totalCam(cngTitle);
	}
}

function myCam(cam_id) {
	$.ajax({
		type : "GET",
		url : "/dashboardChart/myCampaign?camId=" + cam_id,
		cache : false,
		processData : true,
		async : true,
		success : function(data) {
			leftOriginal = 0;
			leftSo = 0;
			leftReal = 0;
			var title = document.getElementById('LChartTitle');
			$.each(data, function() {
				$(title).text(this.totalBase);

				leftOriginal = this.totalOriginal;
				leftSo = this.totalSo;
				leftReal = this.totalReal;
			});

			var some_new_data = {
				labels : campaigns,
				datasets : [ {
					label : '캠페인',
					data : [ leftOriginal, leftSo, leftReal ],
					backgroundColor : chartBGColor,
					borderWidth : 0
				} ]
			};

			leftChart.config.data = some_new_data;
			leftChart.update();

		},
		error : function(e) {
			// console.log("ERROR : ", e);
		}
	});
}

function totalCam(cam_id) {
	$.ajax({
		type : "GET",
		url : "/dashboardChart/totalCampaign?camId=" + cam_id,
		cache : false,
		processData : true,
		async : true,
		success : function(data) {
			var title = document.getElementById('RChartTitle');
			$.each(data, function() {
				$(title).text(this.totalBase);

				rightOriginal = this.totalOriginal;
				rightSo = this.totalSo;
				rightReal = this.totalReal;
			});
			var some_new_data = {
				labels : campaigns,
				datasets : [ {
					label : '캠페인',
					data : [ rightOriginal, rightSo, rightReal ],
					backgroundColor : chartBGColor,
					borderWidth : 0
				} ]
			};

			rightChart.config.data = some_new_data;
			rightChart.update();

		},
		error : function(e) {
			// console.log("ERROR : ", e);
		}
	});
}

function myType() {
	$.ajax({
		type : "GET",
		url : "/dashboardChart/myType",
		cache : false,
		processData : true,
		async : true,
		success : function(data) {
			leftOriginal = [ 0, 0, 0, 0 ];
			leftSo = [ 0, 0, 0, 0 ];
			leftReal = [ 0, 0, 0, 0 ];

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
				labels : types,
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
			// console.log("ERROR : ", e);
		}
	});
}

function totalType() {
	$.ajax({
		type : "GET",
		url : "/dashboardChart/totalType",
		cache : false,
		processData : true,
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
				} else {
					rightOriginal[this.totalBase] = this.totalOriginal;
					rightSo[this.totalBase] = this.totalSo;
					rightReal[this.totalBase] = this.totalReal;
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
			// console.log("ERROR : ", e);
		}
	});
}

function myPeriod(year) {
	$.ajax({
		type : "GET",
		url : "/dashboardChart/myPeriod?year=" + year,
		cache : false,
		processData : true,
		async : true,
		success : function(data) {
			leftOriginal = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			leftSo = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			leftReal = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];

			$.each(data, function() {

				leftOriginal[this.totalBase - 1] = this.totalOriginal;
				leftSo[this.totalBase - 1] = this.totalSo;
				leftReal[this.totalBase - 1] = this.totalReal;
			});
			var some_new_data = {
				labels : period,
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
			// console.log("ERROR : ", e);
		}
	});
}
function totalPeriod(year) {
	$.ajax({
		type : "GET",
		url : "/dashboardChart/totalPeriod?year=" + year,
		cache : false,
		processData : true,
		async : true,
		success : function(data) {
			rightOriginal = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			rightSo = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			rightReal = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];

			$.each(data, function() {
				rightOriginal[this.totalBase - 1] = this.totalOriginal;
				rightSo[this.totalBase - 1] = this.totalSo;
				rightReal[this.totalBase - 1] = this.totalReal;
			});
			var some_new_data = {
				labels : period,
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
			// console.log("ERROR : ", e);
		}
	});
}

function loadTab() {

	// left
	$
			.ajax({
				type : "GET",
				url : "/dashboardChart/myTab",
				cache : false,
				processData : true,
				async : true,
				success : function(data) {
					var html = "<li role='presentation'><a class='dropdown-header' role='menuitem' tabindex='-1' href='#'>선택하세요</a></li><li role='presentation' class='divider'></li>";
					var periodValue = "";
					var period = "";
					var campain = "";

					$
							.each(
									data,
									function(index, value) {
										campain += "<li role='presentation'><a role='menuitem' data-toggle='tab' tabindex='-1' href='#' id='leftCam"
												+ index
												+ "-tab' onclick='toggleLeft(3,"
												+ this.camId
												+ ")'>"
												+ this.camName + "</a></li>"
										if (periodValue != this.camCdate) {
											periodValue = this.camCdate;
											period += "<li role='presentation'><a role='menuitem' data-toggle='tab' tabindex='-1' href='#' id='leftPeriod"
													+ index
													+ "-tab' onclick='toggleLeft(2,"
													+ this.camCdate
													+ ")'>"
													+ this.camCdate
													+ "년</a></li>"
										}
									});

					var div1 = document.querySelector('#leftPeriod');
					div1.innerHTML = html + period;
					var div2 = document.querySelector('#leftCam');
					div2.innerHTML = html + campain;

				},
				error : function(e) {
					// console.log("ERROR : ", e);
				}
			});

	// right
	$
			.ajax({
				type : "GET",
				url : "/dashboardChart/totalTab",
				cache : false,
				processData : true,
				async : true,
				success : function(data) {
					var html = "<li role='presentation'><a class='dropdown-header' role='menuitem' tabindex='-1' href='#'>선택하세요</a></li><li role='presentation' class='divider'></li>";
					var periodValue = "";
					var period = "";
					var campain = "";

					$
							.each(
									data,
									function(index, value) {
										campain += "<li role='presentation'><a role='menuitem' data-toggle='tab' tabindex='-1' href='#' id='rightCam"
												+ index
												+ "-tab' onclick='toggleRight(3,"
												+ this.camId
												+ ")'>"
												+ this.camName + "</a></li>"
										if (periodValue != this.camCdate) {
											periodValue = this.camCdate;
											period += "<li role='presentation'><a role='menuitem' data-toggle='tab' tabindex='-1' href='#' id='rightPeriod"
													+ index
													+ "-tab' onclick='toggleRight(2,"
													+ this.camCdate
													+ ")'>"
													+ this.camCdate
													+ "년</a></li>"
										}
									});

					var div1 = document.querySelector('#rightPeriod');
					div1.innerHTML = html + period;
					var div2 = document.querySelector('#rightCam');
					div2.innerHTML = html + campain;

				},
				error : function(e) {
					// console.log("ERROR : ", e);
				}
			});
}
