<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>

        <!-- jquery : bootstrap, datepicker -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  

        <!-- bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

		<!-- datepicker -->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
<link rel="stylesheet" type="text/css" href="/css/booking/booking_style.css">
</head>
<body>
<div id="wrap" class="container">
	<header class="d-flex justify-content-center align-items-center">
		<div class="display-4">통나무펜션</div>
	</header>
	<nav>
		<ul class="nav nav-fill">
			<li class="nav-item"><a href="#" class="nav-link text-weight-bold">펜션소개</a></li>
			<li class="nav-item"><a href="#" class="nav-link text-weight-bold">객실보기</a></li>
			<li class="nav-item"><a href="#" class="nav-link text-weight-bold">예약하기</a></li>
			<li class="nav-item"><a href="#" class="nav-link text-weight-bold">예약목록</a></li>
		</ul>
	</nav>
	<section class="contents">
		<h2 class="text-center font-weight-bold mt-4">예약하기</h2>
		<div class="d-flex justify-content-center">
			<div class="addBox">
				<div class="form-group">
					<label class="font-weight-bold">이름</label>
					<input type="text" name="name" class="form-control">
				</div>
				<div class="form-group">
					<label class="font-weight-bold">예약날짜</label>
					<input type="text" name="date" class="form-control">
				</div>
				<div class="form-group">
					<label class="font-weight-bold">숙박일수</label>
					<input type="text" name="day" class="form-control">
				</div>
				<div class="form-group">
					<label class="font-weight-bold">숙박인원</label>
					<input type="text" name="headcount" class="form-control">
				</div>
				<div class="form-group">
					<label class="font-weight-bold">전화번호</label>
					<input type="text" name="phoneNumber" class="form-control">
				</div>
				
				<button type="button" id="addbtn" class="btn btn-warning col-12">예약하기</button>
			</div>
		</div>
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
$(document).ready(function() {
	$('input[name=date]').date
	picker({
		dateFormat:"yy-mm-dd"
		, minDate:0 // 오늘부터 뒤 선택
	});
	
	$('#addbtn').on('click', function() {
	//	alert("에약하기 버튼") 확인용
	// 값 가져오기
	let name = $('input[name=name]').val().trim();
	let date = $('input[name=date]').val().trim();
	let day = $('input[name=day]').val().trim();
	let headcount = $('input[name=headcount]').val().trim();
	let phoneNumber = $('input[name=phoneNumber]').val().trim();
	
	// validation
	if (name == "") {
		alert("이름을 입력하세요");
		return;
	}
	
	if (date == "") {
		alert("날짜를 선택하세요");
		return;
	}
	if (day == "") {
		alert("숙박일을 입력하세요");
		return;
	}
	if (isNaN(day)) {
		alert("숙박일수를 숫자만 입력가능합니다.");
		return;
	}
	
	if (headcount == "") {
		alert("숙박 인원을 입력하세요");
		return;
	}
	if (isNaN(headcount)) {
		alert("숙박인원은 숫자만 입력가능합니다.");
		return;
	}
	
	if (phoneNumber == "") {
		alert("전화버호를 입력하세요");
		return;
	}	
	// ajax -> insert
	$.ajax({
		// request
		type:"POST"
		, url:"/lesson07/add_booking"
		, data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
		
	// response
		, success:function(data) {
			if (data.code == 100) {
				alert("예약되었습니다.");
				location.href = "/lesson07/add_booking_list";
			} else {
				alert(data.errorMessage);
			}
		}
		, error:function(e) {
			alert("예약하는데 실패했습니다.");
		}
		});
	
	});
	
});

</script>

</body>
</html>