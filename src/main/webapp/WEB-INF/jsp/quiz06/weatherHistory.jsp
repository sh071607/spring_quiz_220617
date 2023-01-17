<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보 페이지</title>
 <!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
			<section class="col-10">
				<h2>과거 날씨</h2>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${weatherHistoryList }" var="weather">
						<tr>
							<td>${weather.date }</td>
							<td>
								<c:choose>
									<c:when test="${weather.weather eq '맑음'}">
										<img src="/img/sunny.jpg" alt="맑음">
									</c:when>
									<c:when test="${weather.weather eq '구름조금'}">
										<img src="/img/partlyCloudy.jpg" alt="구름조금">
									</c:when>
									<c:when test="${weather.weather eq '흐림'}">
										<img src="/img/cloudy.jpg" alt="흐림">
									</c:when>
									<c:when test="${weather.weather eq '비'}">
										<img src="/img/rainy.jpg" alt="비">
									</c:when>
									<c:otherwise>
										${weather.weather}
									</c:otherwise>
								</c:choose>
							</td>
							<td>${weather.temperatures }℃</td>
							<td>${weather.precipitation }mm</td>
							<td>${weather.microDust }</td>
							<td>${weather.windSpeed }km/h</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
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


</body>
</html>