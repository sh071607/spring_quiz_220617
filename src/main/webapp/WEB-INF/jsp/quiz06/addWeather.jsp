<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 입력 페이지</title>
 <!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<%-- datepicker를 위해 slim 버전이 아닌 jquery를 import한다. --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        


<link rel="stylesheet" type="text/css" href="/css/lesson05/weather_style.css">
</head>
<body>
	<div id="wrap">
		<div class="contents d-flex">
			<nav class="col-2">
				<div class="logo">
					<img src="/img/foot_logo2.png" width="100" height="50">
				</div>
				
				<ul class="nav flex-column">
					<li class="nav-item"><a href="/lesson05/weather_history_view" class="nav-link list-text font-coler">날씨</a></li>
					<li class="nav-item"><a href="/lesson05/add_weather_view" class="nav-link list-text font-coler">날씨입력</a></li>
					<li class="nav-item"><a href="#self" class="nav-link list-text font-coler">테마날씨</a></li>
					<li class="nav-item"><a href="#self" class="nav-link list-text font-coler">관측 기후</a></li>
				</ul>	
			</nav>
			<section class="col-10 mt-3 ml-5">
				<h2>날씨 입력</h2>
				<form method="post" action="/lesson05/add_weather">
					<div class="d-flex justify-content-around">
						<div class="form-group">
							<label for="date">날짜</label>
							<input type="text" class="form-control" id="date" name="date">
						</div>
						<div class="form-group">
							<label for="weather">날씨</label>
							<select id="weather" name="weather" class="form-control">
								<option>맑음</option>
								<option>구름조금</option>
								<option>흐림</option>
								<option>비</option>
							</select>
						</div>
						<div class="form-group">
							<label for="microDust">미세먼지</label>
							<select id="microDust" name="microDust" class="form-control">
								<option>맑음</option>
								<option>구름조금</option>
								<option>흐림</option>
								<option>비</option>
							</select>
						</div>
					</div>
					
					<div class="d-flex justify-content-around">
						<div class="from-group">
							<label for="temperatures">기온</label>
							<div class="input-group">
								<input type="text" class="form-control" id="temperatures" name="temperatures">
								<div class="input-group-append">
									<span class="input-group-text">℃</span>
								</div>
							</div>
						</div>
						<div class="from-group">
							<label for="precipitation">강수량</label>
							<div class="input-group">
								<input type="text" class="form-control" id="precipitation" name="precipitation">
								<div class="input-group-append">
									<span class="input-group-text">mm</span>
								</div>
							</div>
						</div>
						<div class="from-group">
							<label for="windSpeed">기온</label>
							<div class="input-group">
								<input type="text" class="form-control" id="windSpeed" name="windSpeed">
								<div class="input-group-append">
									<span class="input-group-text">km/h</span>
								</div>
							</div>
						</div>
					</div>
					
					<div class="d-flex justify-content-end">
					<input type="submit" class="btn btn-success" value="저장">
					</div>
				</form>
			</section>
			
		</div>
	<footer class="d-flex align-items-center">
		<div class="footer_logo col-2 ml-3">
			<img src="/img/foot_logo2.png" width="200">
		</div>
		<div class="col-10 ml-3">
			<small>(07062) 서울시 동작구 여의대방로16길 61<br>
			Copyright@2020 KMA. All Rights RESERVED.</small>
		</div>
	</footer>
	</div>
<script>
	$(document).ready(function() {
		$('#date').datepicker({
			dateFormat:'yy-mm-dd'
			
		});
	});
</script>

</body>
</html>