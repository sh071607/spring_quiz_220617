<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 리스트</title>
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
		<h1>즐겨찾기 목록</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="favorite" items="${favoriteList}">
				<tr>
					<td>${favorite.id}</td>
					<td>${favorite.name}</td>
					<td>${favorite.url}</td>
					<td>
					<%-- 1. name이벤트, value 속성을 이용해서 동적으로 id 보내기 --%>
						<%-- <button type="button" class="btn btn-danger" name="delBtn" value="${favorite.id}">삭제</button> --%>
						
						<%-- 2. data를 이용해서 태그에 data를 임시 저장해놓기 --%>
						<button type="button" class="del-btn btn btn-danger" data-favorite-id="${favorite.id}">삭제</button>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
	$(document).ready(function() {
			// 1. name이벤트, value 속성을 이용해서 동적으로 id 보내기
			/* $('td').on('click', 'button[name=delBtn]', function(e) {
				// let id = $(this).attr('value');
				let id = e.target.value;
				alert(id); */
			// 2. data를 이용해서 태그에 data를 임시 저장해놓기 
			// 태그: data-favorite-id data- 뒤부터는 이름을 지어준다.(꼭 하이픈 형식, 대문자 절대 X)
			// 스크립트: $(this).data('favorite-id');
			$('.del-btn').on('click', function() {
				let favoriteId = $(this).data('favorite-id');
				alert(favoriteId);
			// AJAX -> 삭제 할 id  DB
			$.ajax({
			// request
				type:"DELETE"
				, url:"/lesson06/delete_favorite"
				, data:{"id":favoriteId}
			
			// response
			, success:function(data) {
				if (data.code == 100) {
					location.reload(true);
				} else {
					alert(data.errorMessage)					
				}
			}
			, error:function(e) {
				alert("삭제 실패했습니다. 관리자에게 문의해주세요.");
			}
			});
		});
	});
	</script>
</body>
</html>