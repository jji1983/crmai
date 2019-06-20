<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>사용자 가이드</title>
	<style media="screen">
	*{
		margin: 0; padding: 0;
	}
	.slide{
		width: 1100px;
		height: 600px;
		overflow: hidden;
		position: relative;
		margin: 0 auto;
	}
	.slide ul{
		width: 5000px;
		position: absolute;
		top: 0;
		left: 0;
		font-size: 0;
	}
	.slide ul li{
		display: inline-block;
	}
	#back{
		position: absolute;
		top: 250px;
		left: 0;
		cursor: pointer;
		z-index: 1;
	}
	#next{
		position: absolute;
		top: 250px;
		right: 0;
		cursor: pointer;
		z-index: 1;
	}
	</style>
</head>
<body>
	<img id="back" src="/resources/dist/img/back.png" alt="" width="100">
	<div class="slide">
		<ul>
			<li><img src="/resources/dist/img/tutorial.jpg" alt="" width="1100" height="600"/></li>
			<li><img src="/resources/dist/img/tutorial2.jpg" alt="" width="1100" height="600"/></li>
			<li><img src="/resources/dist/img/tutorial3.jpg" alt="" width="1100" height="600"/></li>
			<li><img src="/resources/dist/img/tutorial4.jpg" alt="" width="1100" height="600"/></li>
			<li><img src="/resources/dist/img/tutorial4.jpg" alt="" width="1100" height="600"/></li>
			<li><img src="/resources/dist/img/tutorial4.jpg" alt="" width="1100" height="600"/></li>
		</ul>
	</div>
	<img id="next" src="/resources/dist/img/next.png" alt="" width="100">
</body>
<script type="text/javascript">
	$(document).ready(function(){
		var imgs;
		var img_count;
		var img_position = 1;
		
		imgs = $(".slide ul");
		img_count =imgs.children().length;
		
		//예외처리
		if(img_count <1)
		{
			img_count = 1;	
		}
		//버튼을 클릭했을 때 함수 실행
		$('#back').click(function(){
			back();
		});
		$('#next').click(function () {
			next();
		});
		
		function back(){
			if(1<img_position){
				imgs.animate({
					left:'+=1100px'
				});
				img_position--;
			}else
			{
				imgs.animate({
					left:'-='+(img_count-1)*1100+'px'
				});
				img_position = img_count;
			}
		}
		function next() {
			if(img_count>img_position){
				imgs.animate({
					left:'-=1100px'
				});
				img_position++;
			}else
			{
				imgs.animate({
					left:'0'
				});
				img_position =1;
			}
		}
	});

</script>
</html>