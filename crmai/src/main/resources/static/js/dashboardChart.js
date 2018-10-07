typeORIGINAL = [ 0, 0, 0, 0 ];
typeSO = [ 0, 0, 0, 0 ];
typeREAL = [ 0, 0, 0, 0 ];

leftOriginal = [];
leftSo = [];
leftReal = [];

rightOriginal = [];
rightSo = [];
rightReal = [];

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
	alert(cngTitle);
	var title = document.getElementById('LChartTitle');
	// type 1
	if (kind == 1) {
		cngTitle = "나의 캠페인 전체";

		// data delete
		// Types Data
		$(title).text(cngTitle);

		myType();
	}

	// month 2
	if (kind == 2) {
		alert("기간별 실행");
		cngTitle = "( "+cngTitle+"년 ) 월별 통계";
		$(title).text(cngTitle);
		
		myPeriod();
	}

	// campain 3
	if (kind == 3) {
		$(title).text(cngTitle);
		
		some_new_data = {
			labels : campains,
			datasets : [ {
				label : '캠페인',
				data : campainDatas,
				backgroundColor : chartBGColor,
				borderWidth : 0
			} ]
		};

		leftChart.config.data = some_new_data;
		leftChart.update();

		/*
		 * $.ajax({ type : "GET", url : "/notice/detail?code=" + code,
		 * contentType : 'application/json', // List 컨트롤러는 application/json
		 * 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다. cache : false, timeout : 600000,
		 * success : function(data) { console.log("SUCCESS : ", data);
		 * 
		 * showModal(data); }, error : function(e) { alert("error :: " +
		 * e.responseText); console.log("ERROR : ", e); } });
		 */
	}
}
function toggleRight(kind, cngTitle) {
	alert(cngTitle);
	// type 1
	if (kind == 1) {
		cngTitle = "전체 캠페인";

		var title = document.getElementById('RChartTitle');
		$(title).text(cngTitle);

		totalType();
	}

	// month 2
	if (kind == 2) {
		cngTitle = "monthRight 변경합니당";
		var title = document.getElementById('RChartTitle');
		$(title).text(cngTitle);

		totalPeriod();
	}

	// campain 3
	if (kind == 3) {
		cngTitle = "campainRight 변경합니당";
		var title = document.getElementById('RChartTitle');
		$(title).text(cngTitle);
		some_new_data = {
			labels : campains,
			datasets : [ {
				label : '캠페인',
				data : campainDatas,
				backgroundColor : chartBGColor,
				borderWidth : 0
			} ]
		};

		rightChart.config.data = some_new_data;
		rightChart.update();

		/*
		 * $.ajax({ type : "GET", url : "/notice/detail?code=" + code,
		 * contentType : 'application/json', // List 컨트롤러는 application/json
		 * 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다. cache : false, timeout : 600000,
		 * success : function(data) { console.log("SUCCESS : ", data);
		 * 
		 * showModal(data); }, error : function(e) { alert("error :: " +
		 * e.responseText); console.log("ERROR : ", e); } });
		 */
	}
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

			});
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

			});
		},
		error : function(e) {
			// console.log("ERROR : ", e);
		}
	});
}

function myPeriod() {
	alert("myPeriod 실행");
	$.ajax({
		type : "GET",
		url : "/dashboardChart/myPeriod",
		cache : false,
		processData : true,
		async : true,
		success : function(data) {
			leftOriginal = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			leftSo = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			leftReal = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];

			$.each(data, function() {
				
				alert(this.totalBase);
 
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

			});
		},
		error : function(e) {
			// console.log("ERROR : ", e);
		}
	});
}
function totalPeriod() {
	$.ajax({
		type : "GET",
		url : "/dashboardChart/totalPeriod",
		cache : false,
		processData : true,
		async : true,
		success : function(data) {
			rightOriginal = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			rightSo = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			rightReal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];

			$.each(data, function() {

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

			});
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
		url : "/dashboardChart/myCam",
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
							+ "-tab' onclick='toggleLeft(3,"+this.camId+")'>"
							+ this.camName + "</a></li>"
							if (periodValue != this.camCdate) {
								periodValue = this.camCdate;
								period += "<li role='presentation'><a role='menuitem' data-toggle='tab' tabindex='-1' href='#' id='leftPeriod"
									+ index
									+ "-tab' onclick='toggleLeft(2,"+this.camCdate+")'>"
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
				url : "/dashboardChart/totalCam",
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
												+ "-tab' onclick='toggleRight(3,"+this.camId+")'>"
												+ this.camName + "</a></li>"
										if (periodValue != this.camCdate) {
											periodValue = this.camCdate;
											period += "<li role='presentation'><a role='menuitem' data-toggle='tab' tabindex='-1' href='#' id='rightPeriod"
													+ index
													+ "-tab' onclick='toggleRight(2,"+this.camCdate+")'>"
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
