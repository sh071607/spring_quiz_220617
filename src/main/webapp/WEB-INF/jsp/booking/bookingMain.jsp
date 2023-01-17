<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무펜션 메인</title>
   <!-- jquery : bootstrap, datepicker -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  

        <!-- bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<link rel="stylesheet" type="text/css" href="/css/booking/booking_style.css">
</head>
<body>
	<div id="wrap" class="container">
		<header class="d-flex justify-content-center align-items-center">
			<div class="display-4">통나무 펜션</div>
		</header>
		<nav>
			<ul class="nav nav-fill">
				<li class="nav-item"><a href="#" class="nav-link text-weight-bold">펜션소개</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-weight-bold">객실보기</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-weight-bold">예약하기</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-weight-bold">예약목록</a></li>
			</ul>
		</nav>
		<section>
			<img id="bannerImage" src="/img/test06_banner1.jpg" alt="banner" width="1100px" height="500px">
		</section>
		<section class="reserve d-flex">
			<div class="reserved-time d-flex justify-content-center align-items-center col-4">
				<div class="display-4 text-danger">실시간<br>예약하기</div>
			</div>
			<div class="confirm col-4">
				<div class="m-3">
					<span class="reserve-confirm">예약확인</span>
				</div>
				<!-- 예약확인 -->
				<div id="memberInput">
					<div class="d-flex justify-content-end mr-2">
						<span class="text-white">이름:</span>
						<input type="text" id="name" class="form-control input-form">
					</div>
					<div class="d-flex justify-content-end mr-2 mt-2">
						<span class="text-white">전화번호:</span>
						<input type="text" id="phoneNumber" class="form-control input-form">
					</div>
					<!-- 조회버튼 -->
					<div  class="text-right mt-2 mr-2">
						<button type="button" class="btn btn-success submit-btn" id="submitBtn">조회하기</button>
					</div>
				</div>
			</div>
			<!-- 예약문의 -->
			<section class="inquiry d-flex justify-content-center align-items-center col-4">
				<div class="text-white">
					<h3>예약문의:</h3>
					<h1>010-<br>0000-1111</h1>
				</div>
			</section>
		</section>
		<footer>
           <small class="text-secondary">
                    제주특별자치도 제주시 애월읍<br>
                    사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목<br>
                    Copyright 2025 tongnamu. All right reserved.
            </small>
        </footer>
	</div>

<script>
$(document).ready(function () {
	$('#submitBtn').on('click', function() {
	//	alert("1111");
		let name = $('#name').val().trim();
		
		
		let phoneNumber = $('#phoneNumber').val().trim();
		
		// validaation
		if (name == "") {
			alert("이름을 입력하세요");
			return;
		}
		if (phoneNumber == "") {
			alert("번호를 입력하세요");
			return;
		}
		if (phoneNumber.startsWith("010") == false) {
			alert("010으로 시작하는 번호만 입력 가능합니다.");
			return;
		}
		
		
		// ajax
		$.ajax({
			type:"POST"
			, url:"/lesson07/search_booking"
			, data:{"name":name, "phoneNumber":phoneNumber}
		
		
		
			, success:function(data) {
				if (data.code == 100) {
					//alert(data.booking.name);
					alert("이름: " + data.booking.name
							+ "\n날짜: " + data.booking.date.slice(0, 10)
							+ "\n일수: " + data.booking.day
							+ "\n인원: " + data.booking.headcount
							+ "\n상태: " + data.booking.state);
				} else {
					alert("예약 내역이 없습니다.");
				}
			}
			, error:function(e) {
				alert("예약 조회에 실패했습니다.");
			}
		});
	});
	
	// 배너 순환
	let bannerList = ["/img/test06_banner1.jpg", "/img/test06_banner2.jpg", "/img/test06_banner3.jpg", "/img/test06_banner4.jpg"];
	let currentIndex = 0;
	
	setInterval(function() {
		//console.log(currentIndex);
		currentIndex++;
		$('#bannerImage').attr('src', bannerList[currentIndex]);
		
		if (currentIndex >= bannerList.length) {
			currentIndex = 0;
		}
	}, 3000);
});


</script>

</body>
</html>