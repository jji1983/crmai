<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Dashboard</title>

<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet" href="/resources/adminLTE/minty.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/resources/adminLTE/morris.js/morris.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

<script>
	function Content_Learning() {
		//alert("call Content_Learning!!");
		document.getElementById("main_frame").src = "/Learning/data";
	}
</script>
<style>
.fLeft {
	float: left;
}

.multibtn {
	margin: 15px;
	padding: 20px;
}

.for_center {
	margin: 0 auto;
}
</style>
</head>
<body>
	<!-- Title -->
	<div>
		<ul class="list-group">
			<li
				class="list-group-item d-flex justify-content-between align-items-center"
				style="border: none;"><h5>Dashboard</h5>
				<!-- <span class="badge badge-primary badge-pill">사용자 가이드</span> -->
			</li>
		</ul>
		<!-- line -->

		<hr class="my-4">
	</div>

	<!-- notice -->
	<div>
		<ul class="list-group">
			<li
				class="list-group-item d-flex justify-content-between align-items-center"
				style="border: none;"><h5>Notice</h5></li>
			<!-- notice content -->
			<li
				class="list-group-item d-flex justify-content-between align-items-center"
				style="border: none;">
				<table class="table table-hover text-center">
					<thead>
						<tr class="table-primary">
							<th scope="col">No</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">등록일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">Default</th>
							<td>Column content</td>
							<td>Column content</td>
							<td>Column content</td>
							<td>Column content</td>
						</tr>
						<tr>
							<th>Default</th>
							<td>Column content</td>
							<td>Column content</td>
							<td>Column content</td>
							<td>Column content</td>
						</tr>
						<tr>
							<th>Default</th>
							<td>Column content</td>
							<td>Column content</td>
							<td>Column content</td>
							<td>Column content</td>
						</tr>
					</tbody>
				</table>

			</li>
		</ul>

		<!-- paging -->
		<div class="for_center">
			<ul class="pagination pagination-sm for_center">
				<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
				</li>
				<li class="page-item active"><a class="page-link" href="#">1</a>
				</li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">&raquo;</a>
				</li>
			</ul>
		</div>

		<!-- line -->
		<hr class="my-4">
	</div>


	<!-- stats -->
	<div>
		<ul class="list-group">
			<li
				class="list-group-item d-flex justify-content-between align-items-center"
				style="border: none;"><h5>Stats</h5></li>

		</ul>
	</div>

	<!-- stats content - left wrap 1 -->
	<div class="fLeft" style="width: 50%">
		<ul class="list-group">
			<li
				class="list-group-item d-flex justify-content-between align-items-center"
				style="border: none; width: 50%; float: left;">
				<div class="fLeft">
					<button type="button" class="btn btn-primary">나의 현황</button>
				</div>
			</li>
		</ul>

		<!-- Tabs1 -->
		<div style="padding: 20px;">
			<ul id="myTab" class="nav nav-tabs" role="tablist">
				<li role="presentation" class="nav-item active"><a
					class="nav-link active show" data-target="#Tab1" id="TabA1"
					role="tab" data-toggle="tab" aria-controls="TabA1-contents"
					aria-expanded="true">나의전체</a></li>
				<li role="presentation" class="nav-item dropdown"><a
					data-target="#" id="myTabDrop1" class="nav-link dropdown-toggle"
					data-toggle="dropdown" aria-controls="myTabDrop1-contents">기간별
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1"
						id="myTabDrop1-contents">
						<li class="dropdown-divider"></li>
						<li><a class="dropdown-item" data-target="#dropdown1"
							tabindex="-1" role="tab" id="dropdown1-tab" data-toggle="tab"
							aria-controls="dropdown1">2018년 1월</a></li>
						<li><a class="dropdown-item" data-target="#dropdown2"
							tabindex="-1" role="tab" id="dropdown2-tab" data-toggle="tab"
							aria-controls="dropdown2">2018년 2월</a></li>
					</ul></li>
				<li role="presentation" class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-target="#" id="myTabDrop2"
					class="nav-link dropdown-toggle" data-toggle="dropdown"
					aria-controls="myTabDrop2-contents">캠페인별 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop2"
						id="myTabDrop2-contents">
						<li><a class="dropdown-item" data-target="#dropdown3"
							tabindex="-1" role="tab" id="dropdown4-tab" data-toggle="tab"
							aria-controls="dropdown4">캠페인1</a></li>
						<li><a class="dropdown-item" data-target="#dropdown4"
							tabindex="-1" role="tab" id="dropdown5-tab" data-toggle="tab"
							aria-controls="dropdown5">캠페인2</a></li>
					</ul></li>
			</ul>
			<div id="myTabContent" class="tab-content"
				style="width: 560px; height: 469px;">
				<!-- content1 -->
				<!-- simple bar chart -->
				<div role="tabpanel" class="tab-pane fade active in" id="Tab1"
					aria-labelledby="TabA1">
					<div id="tabTitle1">
						<p class="text-center">
							<strong>(2018년 전체) 월별 통계</strong>
						</p>
					</div>
					<div id="tabContent1"
						style="height: 400px; width: 560px; float: left;"></div>

				</div>
				<!-- content2 -->
				<!-- simple bar chart -->
				<div role="tabpanel" class="tab-pane fade" id="dropdown1"
					aria-labelledby="home-tab">
					<div id="tabTitle2">
						<p class="text-center">
							<strong>(2018년 1월) 통계</strong>
						</p>
					</div>
					<div id="tabContent2"
						style="height: 400px; width: 560px; float: left;"></div>

				</div>
				<!-- content3 -->
				<!-- simple bar chart -->
				<div role="tabpanel" class="tab-pane fade" id="dropdown2"
					aria-labelledby="home-tab">
					<div id="tabTitle3">
						<p class="text-center">
							<strong>(2018년 1월) 통계</strong>
						</p>
					</div>
					<div id="tabContent3"
						style="height: 400px; width: 560px; float: left;"></div>

				</div>

				<div role="tabpanel" class="tab-pane fade" id="dropdown3"
					aria-labelledby="dropdown4-tab">
					<div id="tabTitle4">
						<p class="text-center">
							<strong>캠페인 1 통계</strong>
						</p>
					</div>
					<div id="tabContent4"
						style="height: 400px; width: 560px; float: left;"></div>

				</div>
				<div role="tabpanel" class="tab-pane fade" id="dropdown4"
					aria-labelledby="dropdown5-tab">
					<div id="tabTitle5">
						<p class="text-center">
							<strong>캠페인 1 통계</strong>
						</p>
					</div>
					<div id="tabContent5"
						style="height: 400px; width: 560px; float: left;"></div>

				</div>
			</div>
			<!-- perc -->
			<div class="for_center">
				<div class="btn-group for_center" role="group"
					aria-label="Basic example">
					<button type="button" class="btn btn-outline-info multibtn">
						<h5>학습</h5>
						<h5>80%</h5>
						<h6>(20건)</h6>
					</button>
					<button type="button" class="btn btn-outline-secondary multibtn">
						<h5>예측</h5>
						<h5>83%</h5>
						<h6>(20건)</h6>
					</button>
					<button type="button" class="btn btn-outline-primary multibtn">
						<h5>결과</h5>
						<h5>84%</h5>
						<h6>(20건)</h6>
					</button>
				</div>
			</div>


			<!-- Tabs2 -->
			<div style="padding: 20px;">
				<ul id="myTab" class="nav nav-tabs" role="tablist">

					<li role="presentation" class="nav-item dropdown"><a
						data-target="#" id="myTabDrop1" class="nav-link dropdown-toggle"
						data-toggle="dropdown" aria-controls="myTabDrop1-contents">산업별
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1"
							id="myTabDrop1-contents">
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" data-target="#dropdown1"
								tabindex="-1" role="tab" id="dropdown1-tab" data-toggle="tab"
								aria-controls="dropdown1">통신분야</a></li>
							<li><a class="dropdown-item" data-target="#dropdown2"
								tabindex="-1" role="tab" id="dropdown2-tab" data-toggle="tab"
								aria-controls="dropdown2">게임분야</a></li>
						</ul></li>

					<li role="presentation" class="nav-item dropdown"><a
						data-target="#" id="myTabDrop1" class="nav-link dropdown-toggle"
						data-toggle="dropdown" aria-controls="myTabDrop1-contents">기간별
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1"
							id="myTabDrop1-contents">
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" data-target="#dropdown1"
								tabindex="-1" role="tab" id="dropdown1-tab" data-toggle="tab"
								aria-controls="dropdown1">2018년 1월</a></li>
							<li><a class="dropdown-item" data-target="#dropdown2"
								tabindex="-1" role="tab" id="dropdown2-tab" data-toggle="tab"
								aria-controls="dropdown2">2018년 2월</a></li>
						</ul></li>
					<li role="presentation" class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-target="#" id="myTabDrop2"
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						aria-controls="myTabDrop2-contents">캠페인별 <span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop2"
							id="myTabDrop2-contents">
							<li><a class="dropdown-item" data-target="#dropdown4"
								tabindex="-1" role="tab" id="dropdown4-tab" data-toggle="tab"
								aria-controls="dropdown4">캠페인1</a></li>
							<li><a class="dropdown-item" data-target="#dropdown5"
								tabindex="-1" role="tab" id="dropdown5-tab" data-toggle="tab"
								aria-controls="dropdown5">캠페인2</a></li>
						</ul></li>
				</ul>
				<div id="myTabContent" class="tab-content"
					style="width: 560px; height: 469px;">
					<!-- content1 -->
					<!-- simple bar chart -->
					<div role="tabpanel" class="tab-pane fade active in" id="Tab1"
						aria-labelledby="TabA1">
						<div id="tabTitle1">
							<p class="text-center">
								<strong>(2018년 전체) 월별 통계</strong>
							</p>
						</div>
						<div id="tabContent1"
							style="height: 400px; width: 560px; float: left;"></div>

					</div>
					<!-- content2 -->
					<!-- simple bar chart -->
					<div role="tabpanel" class="tab-pane fade" id="dropdown1"
						aria-labelledby="home-tab">
						<div id="tabTitle2">
							<p class="text-center">
								<strong>(2018년 1월) 통계</strong>
							</p>
						</div>
						<div id="tabContent2"
							style="height: 400px; width: 560px; float: left;"></div>

					</div>
					<!-- content3 -->
					<!-- simple bar chart -->
					<div role="tabpanel" class="tab-pane fade" id="dropdown2"
						aria-labelledby="home-tab">
						<div id="tabTitle3">
							<p class="text-center">
								<strong>(2018년 1월) 통계</strong>
							</p>
						</div>
						<div id="tabContent3"
							style="height: 400px; width: 560px; float: left;"></div>

					</div>

					<div role="tabpanel" class="tab-pane fade" id="dropdown4"
						aria-labelledby="dropdown4-tab">
						<p>4번입니다</p>

					</div>
					<div role="tabpanel" class="tab-pane fade" id="dropdown5"
						aria-labelledby="dropdown5-tab">
						<p>5번입니다</p>

					</div>
				</div>
			</div>

			<!-- Tabs3 -->
			<div style="padding: 20px;">
				<ul id="myTab" class="nav nav-tabs" role="tablist">
					<li role="presentation" class="nav-item dropdown"><a
						data-target="#" id="myTabDrop1" class="nav-link dropdown-toggle"
						data-toggle="dropdown" aria-controls="myTabDrop1-contents">산업별
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1"
							id="myTabDrop1-contents">
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" data-target="#dropdown1"
								tabindex="-1" role="tab" id="dropdown1-tab" data-toggle="tab"
								aria-controls="dropdown1">통신분야</a></li>
							<li><a class="dropdown-item" data-target="#dropdown2"
								tabindex="-1" role="tab" id="dropdown2-tab" data-toggle="tab"
								aria-controls="dropdown2">게임분야</a></li>
						</ul></li>
					<li role="presentation" class="nav-item dropdown"><a
						data-target="#" id="myTabDrop1" class="nav-link dropdown-toggle"
						data-toggle="dropdown" aria-controls="myTabDrop1-contents">기간별
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1"
							id="myTabDrop1-contents">
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" data-target="#dropdown1"
								tabindex="-1" role="tab" id="dropdown1-tab" data-toggle="tab"
								aria-controls="dropdown1">2018년 1월</a></li>
							<li><a class="dropdown-item" data-target="#dropdown2"
								tabindex="-1" role="tab" id="dropdown2-tab" data-toggle="tab"
								aria-controls="dropdown2">2018년 2월</a></li>
						</ul></li>
					<li role="presentation" class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-target="#" id="myTabDrop2"
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						aria-controls="myTabDrop2-contents">캠페인별 <span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop2"
							id="myTabDrop2-contents">
							<li><a class="dropdown-item" data-target="#dropdown4"
								tabindex="-1" role="tab" id="dropdown4-tab" data-toggle="tab"
								aria-controls="dropdown4">캠페인1</a></li>
							<li><a class="dropdown-item" data-target="#dropdown5"
								tabindex="-1" role="tab" id="dropdown5-tab" data-toggle="tab"
								aria-controls="dropdown5">캠페인2</a></li>
						</ul></li>
				</ul>
				<div id="myTabContent" class="tab-content"
					style="width: 560px; height: 469px;">
					<!-- content1 -->
					<!-- simple bar chart -->
					<div role="tabpanel" class="tab-pane fade active in" id="Tab1"
						aria-labelledby="TabA1">
						<div id="tabTitle1">
							<p class="text-center">
								<strong>(2018년 전체) 월별 통계</strong>
							</p>
						</div>
						<div id="tabContent1"
							style="height: 400px; width: 560px; float: left;"></div>

					</div>
					<!-- content2 -->
					<!-- simple bar chart -->
					<div role="tabpanel" class="tab-pane fade" id="dropdown1"
						aria-labelledby="home-tab">
						<div id="tabTitle2">
							<p class="text-center">
								<strong>(2018년 1월) 통계</strong>
							</p>
						</div>
						<div id="tabContent2"
							style="height: 400px; width: 560px; float: left;"></div>

					</div>
					<!-- content3 -->
					<!-- simple bar chart -->
					<div role="tabpanel" class="tab-pane fade" id="dropdown2"
						aria-labelledby="home-tab">
						<div id="tabTitle3">
							<p class="text-center">
								<strong>(2018년 1월) 통계</strong>
							</p>
						</div>
						<div id="tabContent3"
							style="height: 400px; width: 560px; float: left;"></div>

					</div>

					<div role="tabpanel" class="tab-pane fade" id="dropdown4"
						aria-labelledby="dropdown4-tab">
						<p>4번입니다</p>

					</div>
					<div role="tabpanel" class="tab-pane fade" id="dropdown5"
						aria-labelledby="dropdown5-tab">
						<p>5번입니다</p>

					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- stats content - right wrap 1 -->
	<div class="fLeft" style="width: 50%">
		<ul class="list-group">
			<li
				class="list-group-item d-flex justify-content-between align-items-center"
				style="border: none; width: 50%; float: left;">
				<div class="fLeft">
					<button type="button" class="btn btn-primary">전체 현황</button>
				</div>
			</li>
		</ul>
		<!-- Tabs4 -->
		<div style="padding: 20px;">
			<ul id="myTab" class="nav nav-tabs" role="tablist">

				<li role="presentation" class="nav-item dropdown"><a
					data-target="#" id="myTabDrop1" class="nav-link dropdown-toggle"
					data-toggle="dropdown" aria-controls="myTabDrop1-contents">산업군별
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1"
						id="myTabDrop1-contents">
						<li class="dropdown-divider"></li>
						<li><a class="dropdown-item" data-target="#dropdown1"
							tabindex="-1" role="tab" id="dropdown1-tab" data-toggle="tab"
							aria-controls="dropdown1">통신분야</a></li>
						<li><a class="dropdown-item" data-target="#dropdown2"
							tabindex="-1" role="tab" id="dropdown2-tab" data-toggle="tab"
							aria-controls="dropdown2">게임분야</a></li>
					</ul></li>
				<li role="presentation" class="nav-item dropdown"><a
					data-target="#" id="myTabDrop1" class="nav-link dropdown-toggle"
					data-toggle="dropdown" aria-controls="myTabDrop1-contents">기간별
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1"
						id="myTabDrop1-contents">
						<li class="dropdown-divider"></li>
						<li><a class="dropdown-item" data-target="#dropdown1"
							tabindex="-1" role="tab" id="dropdown1-tab" data-toggle="tab"
							aria-controls="dropdown1">2018년 1월</a></li>
						<li><a class="dropdown-item" data-target="#dropdown2"
							tabindex="-1" role="tab" id="dropdown2-tab" data-toggle="tab"
							aria-controls="dropdown2">2018년 2월</a></li>
					</ul></li>
				<li role="presentation" class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-target="#" id="myTabDrop2"
					class="nav-link dropdown-toggle" data-toggle="dropdown"
					aria-controls="myTabDrop2-contents">캠페인별 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop2"
						id="myTabDrop2-contents">
						<li><a class="dropdown-item" data-target="#dropdown4"
							tabindex="-1" role="tab" id="dropdown4-tab" data-toggle="tab"
							aria-controls="dropdown4">캠페인1</a></li>
						<li><a class="dropdown-item" data-target="#dropdown5"
							tabindex="-1" role="tab" id="dropdown5-tab" data-toggle="tab"
							aria-controls="dropdown5">캠페인2</a></li>
					</ul></li>
			</ul>
			<div id="myTabContent" class="tab-content"
				style="width: 560px; height: 469px;">
				<!-- content1 -->
				<!-- simple bar chart -->
				<div role="tabpanel" class="tab-pane fade active in" id="Tab1"
					aria-labelledby="TabA1">
					<div id="tabTitle1">
						<p class="text-center">
							<strong>(2018년 전체) 월별 통계</strong>
						</p>
					</div>
					<div id="tabContent1"
						style="height: 400px; width: 560px; float: left;"></div>

				</div>
				<!-- content2 -->
				<!-- simple bar chart -->
				<div role="tabpanel" class="tab-pane fade" id="dropdown1"
					aria-labelledby="home-tab">
					<div id="tabTitle2">
						<p class="text-center">
							<strong>(2018년 1월) 통계</strong>
						</p>
					</div>
					<div id="tabContent2"
						style="height: 400px; width: 560px; float: left;"></div>

				</div>
				<!-- content3 -->
				<!-- simple bar chart -->
				<div role="tabpanel" class="tab-pane fade" id="dropdown2"
					aria-labelledby="home-tab">
					<div id="tabTitle3">
						<p class="text-center">
							<strong>(2018년 1월) 통계</strong>
						</p>
					</div>
					<div id="tabContent3"
						style="height: 400px; width: 560px; float: left;"></div>

				</div>

				<div role="tabpanel" class="tab-pane fade" id="dropdown4"
					aria-labelledby="dropdown4-tab">
					<p>4번입니다</p>

				</div>
				<div role="tabpanel" class="tab-pane fade" id="dropdown5"
					aria-labelledby="dropdown5-tab">
					<p>5번입니다</p>

				</div>
			</div>
			<!-- perc -->
			<div class="for_center">
				<div class="btn-group for_center" role="group"
					aria-label="Basic example">
					<button type="button" class="btn btn-outline-info multibtn">
						<h5>학습</h5>
						<h5>80%</h5>
						<h6>(20건)</h6>
					</button>
					<button type="button" class="btn btn-outline-secondary multibtn">
						<h5>예측</h5>
						<h5>83%</h5>
						<h6>(20건)</h6>
					</button>
					<button type="button" class="btn btn-outline-primary multibtn">
						<h5>결과</h5>
						<h5>84%</h5>
						<h6>(20건)</h6>
					</button>
				</div>
			</div>


			<!-- Tabs5 -->
			<div style="padding: 20px;">
				<ul id="myTab" class="nav nav-tabs" role="tablist">

					<li role="presentation" class="nav-item dropdown"><a
						data-target="#" id="myTabDrop1" class="nav-link dropdown-toggle"
						data-toggle="dropdown" aria-controls="myTabDrop1-contents">산업별
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1"
							id="myTabDrop1-contents">
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" data-target="#dropdown1"
								tabindex="-1" role="tab" id="dropdown1-tab" data-toggle="tab"
								aria-controls="dropdown1">통신분야</a></li>
							<li><a class="dropdown-item" data-target="#dropdown2"
								tabindex="-1" role="tab" id="dropdown2-tab" data-toggle="tab"
								aria-controls="dropdown2">게임분야</a></li>
						</ul></li>

					<li role="presentation" class="nav-item dropdown"><a
						data-target="#" id="myTabDrop1" class="nav-link dropdown-toggle"
						data-toggle="dropdown" aria-controls="myTabDrop1-contents">기간별
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1"
							id="myTabDrop1-contents">
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" data-target="#dropdown1"
								tabindex="-1" role="tab" id="dropdown1-tab" data-toggle="tab"
								aria-controls="dropdown1">2018년 1월</a></li>
							<li><a class="dropdown-item" data-target="#dropdown2"
								tabindex="-1" role="tab" id="dropdown2-tab" data-toggle="tab"
								aria-controls="dropdown2">2018년 2월</a></li>
						</ul></li>
					<li role="presentation" class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-target="#" id="myTabDrop2"
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						aria-controls="myTabDrop2-contents">캠페인별 <span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop2"
							id="myTabDrop2-contents">
							<li><a class="dropdown-item" data-target="#dropdown4"
								tabindex="-1" role="tab" id="dropdown4-tab" data-toggle="tab"
								aria-controls="dropdown4">캠페인1</a></li>
							<li><a class="dropdown-item" data-target="#dropdown5"
								tabindex="-1" role="tab" id="dropdown5-tab" data-toggle="tab"
								aria-controls="dropdown5">캠페인2</a></li>
						</ul></li>
				</ul>
				<div id="myTabContent" class="tab-content"
					style="width: 560px; height: 469px;">
					<!-- content1 -->
					<!-- simple bar chart -->
					<div role="tabpanel" class="tab-pane fade active in" id="Tab1"
						aria-labelledby="TabA1">
						<div id="tabTitle1">
							<p class="text-center">
								<strong>(2018년 전체) 월별 통계</strong>
							</p>
						</div>
						<div id="tabContent1"
							style="height: 400px; width: 560px; float: left;"></div>

					</div>
					<!-- content2 -->
					<!-- simple bar chart -->
					<div role="tabpanel" class="tab-pane fade" id="dropdown1"
						aria-labelledby="home-tab">
						<div id="tabTitle2">
							<p class="text-center">
								<strong>(2018년 1월) 통계</strong>
							</p>
						</div>
						<div id="tabContent2"
							style="height: 400px; width: 560px; float: left;"></div>

					</div>
					<!-- content3 -->
					<!-- simple bar chart -->
					<div role="tabpanel" class="tab-pane fade" id="dropdown2"
						aria-labelledby="home-tab">
						<div id="tabTitle3">
							<p class="text-center">
								<strong>(2018년 1월) 통계</strong>
							</p>
						</div>
						<div id="tabContent3"
							style="height: 400px; width: 560px; float: left;"></div>

					</div>

					<div role="tabpanel" class="tab-pane fade" id="dropdown4"
						aria-labelledby="dropdown4-tab">
						<p>4번입니다</p>

					</div>
					<div role="tabpanel" class="tab-pane fade" id="dropdown5"
						aria-labelledby="dropdown5-tab">
						<p>5번입니다</p>

					</div>
				</div>
			</div>

			<!-- Tabs6 -->
			<div style="padding: 20px;">
				<ul id="myTab" class="nav nav-tabs" role="tablist">
					<li role="presentation" class="nav-item dropdown"><a
						data-target="#" id="myTabDrop1" class="nav-link dropdown-toggle"
						data-toggle="dropdown" aria-controls="myTabDrop1-contents">산업별
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1"
							id="myTabDrop1-contents">
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" data-target="#dropdown1"
								tabindex="-1" role="tab" id="dropdown1-tab" data-toggle="tab"
								aria-controls="dropdown1">통신분야</a></li>
							<li><a class="dropdown-item" data-target="#dropdown2"
								tabindex="-1" role="tab" id="dropdown2-tab" data-toggle="tab"
								aria-controls="dropdown2">게임분야</a></li>
						</ul></li>
					<li role="presentation" class="nav-item dropdown"><a
						data-target="#" id="myTabDrop1" class="nav-link dropdown-toggle"
						data-toggle="dropdown" aria-controls="myTabDrop1-contents">기간별
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1"
							id="myTabDrop1-contents">
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" data-target="#dropdown1"
								tabindex="-1" role="tab" id="dropdown1-tab" data-toggle="tab"
								aria-controls="dropdown1">2018년 1월</a></li>
							<li><a class="dropdown-item" data-target="#dropdown2"
								tabindex="-1" role="tab" id="dropdown2-tab" data-toggle="tab"
								aria-controls="dropdown2">2018년 2월</a></li>
						</ul></li>
					<li role="presentation" class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-target="#" id="myTabDrop2"
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						aria-controls="myTabDrop2-contents">캠페인별 <span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop2"
							id="myTabDrop2-contents">
							<li><a class="dropdown-item" data-target="#dropdown4"
								tabindex="-1" role="tab" id="dropdown4-tab" data-toggle="tab"
								aria-controls="dropdown4">캠페인1</a></li>
							<li><a class="dropdown-item" data-target="#dropdown5"
								tabindex="-1" role="tab" id="dropdown5-tab" data-toggle="tab"
								aria-controls="dropdown5">캠페인2</a></li>
						</ul></li>
				</ul>
				<div id="myTabContent" class="tab-content"
					style="width: 560px; height: 469px;">
					<!-- content1 -->
					<!-- simple bar chart -->
					<div role="tabpanel" class="tab-pane fade active in" id="Tab1"
						aria-labelledby="TabA1">
						<div id="tabTitle1">
							<p class="text-center">
								<strong>(2018년 전체) 월별 통계</strong>
							</p>
						</div>
						<div id="tabContent1"
							style="height: 400px; width: 560px; float: left;"></div>

					</div>
					<!-- content2 -->
					<!-- simple bar chart -->
					<div role="tabpanel" class="tab-pane fade" id="dropdown1"
						aria-labelledby="home-tab">
						<div id="tabTitle2">
							<p class="text-center">
								<strong>(2018년 1월) 통계</strong>
							</p>
						</div>
						<div id="tabContent2"
							style="height: 400px; width: 560px; float: left;"></div>

					</div>
					<!-- content3 -->
					<!-- simple bar chart -->
					<div role="tabpanel" class="tab-pane fade" id="dropdown2"
						aria-labelledby="home-tab">
						<div id="tabTitle3">
							<p class="text-center">
								<strong>(2018년 1월) 통계</strong>
							</p>
						</div>
						<div id="tabContent3"
							style="height: 400px; width: 560px; float: left;"></div>

					</div>

					<div role="tabpanel" class="tab-pane fade" id="dropdown4"
						aria-labelledby="dropdown4-tab">
						<p>4번입니다</p>

					</div>
					<div role="tabpanel" class="tab-pane fade" id="dropdown5"
						aria-labelledby="dropdown5-tab">
						<p>5번입니다</p>

					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- line -->
	<hr class="my-4" style="clear: both;">







	<script>
		$(document).ready(function() {
			$('.nav-tabs').on('shown.bs.tab', 'a', function(e) {
				console.log(e.relatedTarget);
				if (e.relatedTarget) {
					$(e.relatedTarget).removeClass('active');
				}
			});
		});

		$(function() {
			
			var data1 = [
				{y : '1월',a : 100,b : 90,c : 30},
				{y : '2월',a : 25,b : 90,c : 30},
				{y : '3월',a : 36,b : 20,c : 30},
				{y : '4월',a : 82,b : 90,c : 30},
				{y : '5월',a : 85,b : 90,c : 30},
				{y : '6월',a : 10,b : 50,c : 30},
				{y : '7월',a : 100,b : 40,c : 30},
				{y : '8월',a : 10,b : 50,c : 30},
				{y : '9월',a : 100,b : 60,c : 30},
				{y : '10월',a : 100,b : 70,c : 30},
				{y : '11월',a : 20,b : 90,c : 30},
				{y : '12월',a : 100,b : 80,c : 30}];
			var data2 = [
				{y : '1월',a : 23,b : 27,c : 58},
				{y : '2월',a : 25,b : 27,c : 30},
				{y : '3월',a : 36,b : 20,c : 58},
				{y : '4월',a : 82,b : 90,c : 30},
				{y : '5월',a : 85,b : 27,c : 58},
				{y : '6월',a : 10,b : 50,c : 30},
				{y : '7월',a : 73,b : 40,c : 30},
				{y : '8월',a : 10,b : 50,c : 58},
				{y : '9월',a : 73,b : 60,c : 30},
				{y : '10월',a : 73,b : 70,c : 58},
				{y : '11월',a : 20,b : 90,c : 30},
				{y : '12월',a : 73,b : 80,c : 58}];

			//tabContent1
			new Morris.Bar({
				element : 'tabContent1',
				data : data1,
				barColors : [ '#11998e', '#bdc3c7', '#f64f59' ],
				xkey : 'y',
				ykeys : [ 'a', 'b', 'c' ],
				labels : [ '정확도', '예측', '결과' ],
				hideHover : 'auto',
				hoverCallback : function(index, options, content, row) {
					return (content) + "단위(%)";
				}
			});

			// tabContent2
			new Morris.Bar({
				element : 'tabContent2',
				data : data2,
				barColors : [ '#11998e', '#bdc3c7', '#f64f59' ],
				xkey : 'y',
				ykeys : [ 'a', 'b', 'c' ],
				labels : [ '정확도', '예측', '결과' ],
				hideHover : 'auto',
				hoverCallback : function(index, options, content, row) {
					return (content) + "단위(%)";
				}
			});

			// tabContent3
			new Morris.Bar({
				element : 'tabContent3',
				data : data1,
				barColors : [ '#11998e', '#bdc3c7', '#f64f59' ],
				xkey : 'y',
				ykeys : [ 'a', 'b', 'c' ],
				labels : [ '정확도', '예측', '결과' ],
				hideHover : 'auto',
				hoverCallback : function(index, options, content, row) {
					return (content) + "단위(%)";
				}
			});
			// tabContent4
			var bar2 = new Morris.Bar({
				element : 'tabContent4',
				data : data2,
				barColors : [ '#11998e', '#bdc3c7', '#f64f59' ],
				xkey : 'y',
				ykeys : [ 'a', 'b', 'c' ],
				labels : [ '정확도', '예측', '결과' ],
				hideHover : 'auto',
				hoverCallback : function(index, options, content, row) {
					return (content) + "단위(%)";
				}
			});

			// tabContent5
			new Morris.Bar({
				element : 'tabContent5',
				data : data1,
				barColors : [ '#11998e', '#bdc3c7', '#f64f59' ],
				xkey : 'y',
				ykeys : [ 'a', 'b', 'c' ],
				labels : [ '정확도', '예측', '결과' ],
				hideHover : 'auto',
				hoverCallback : function(index, options, content, row) {
					return (content) + "단위(%)";
				}
			});

			//else

			var _response = $('#noticeVal');
			var admin = new Object();

			$.ajax({
				type : 'GET', // method
				url : '/notice/noticeVal',
				//url       : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
				async : 'true', // true
				data : admin, // GET 요청은 지원되지 않습니다.
				processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
				contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
				cache : false,
				//dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
				success : function(data, status, xhr) {
					//alert("Login1 :: " + data);
					_response.html(data)
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});

		});
	</script>
</body>
</html>