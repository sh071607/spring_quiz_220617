<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기</title>
 <!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <%-- AJAX를 사용하려면 더 많은 함수가 있는 js를 포함해야 한다. --%>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 추가하기</h1>
		
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" id="title" class="form-control">
		</div>
		
		<div class="form-group">
			<label for="url">주소</label>
			<div class="d-flex">
				<input type="text" id="url" class="form-control">
				<button type="button" id="urlCheckBtn" class="btn btn-info ml-2">중복확인</button>
			</div>
			<small id="isDuplicationText" class="text-danger d-none">중복된 url 입니다.</small>
			<small id="availableText" class="text-success d-none">저장 가능한 url 입니다.</small>
		</div>
		
		<button type="button" id="addBtn" class="btn btn-success">추가</button>
		
	</div>
<script>
	$(document).ready(function(){
		$('#addBtn').on('click', function(){
		let title = $('#title').val().trim();
			if (title == "") {
				alert("제목을 입력하세요");
				return;
			}
		let url = $('#url').val().trim();
			if (url == "") {
				alert("주소를 입력하세요");
				return;
			}
			
			if(url.startsWith("http") == false && url.startsWith("https") == false) {
				alert("주소 형식이 잘못되었습니다");
				return;
			}
			
			// 중복 확인 완료 확인
			if($('#availableText').hasClass('d-none')) { // d-none이 있으면 확인 안된 것
				alert("중복된 url 입니다. 중복확인을 해주세요");
				return;
			}
			
			$.ajax({
				// request
				type:"post"
				,url:"/lesson06/add_favorite"
				,data:{"title":title, "url":url}
			
				// response
				,success:function(data) {	// data 파라미터는 요청에 대한 응답값이다.
					//alert(data);
					if (data == "success") {
						location.href = "/lesson06/favorite_list_view";
					} else {
						alert("입력 실패");
					}
				}
				, error:function(request, status, error) {
					alert("에러");
				}
			});
		});
		// url 중복확인
	$('#urlCheckBtn').on('click', function() {
		let url = $('#url').val().trim();
		if (url == "") {
			alert("검사할 url을 입력하세요");
			return;
		}
		// 중복 검사 db
		$.ajax({
			// request
			type:"POST"
			, url:"/lesson06/is_duplication_url"
			, data:{"url":url}
		
			, success:function(data) {	// json string -> object화 (jquery ajax 함수가 파싱해줌)
				if (data.isDuplication) {
					// 중복
					$('#isDuplicationText').removeClass('d-none');
					$('#availableText').addClass('d-none');
				} else {
					// 사용가능
					$('#isDuplicationText').addClass('d-none');
					$('#availableText').removeClass('d-none');
				}
			}
			, error:function(e) {
				alert("중복확인에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
		
	});
</script>



</body>
</html>