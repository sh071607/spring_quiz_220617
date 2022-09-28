package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/quiz02")
@RestController
public class Lesson01Quiz02RestController {

	//요청 URL : http://localhost:8080/lesson01/quiz02/1
	@RequestMapping("/1")
	public List<Map<String, Object>> quiz02_1() {
		// @ResponseBody + return String => HttpMessageConverter String => 글자가 response에 담긴다
		// @ResponseBody + return 객체 => HttpMessageConverter 객체 jackson 라이브러리 => JSON 응답 - API
		
		List<Map<String, Object>> information = new ArrayList<>();
		Map<String, Object> information1 = new HashMap<>();
		information1.put("rate", 15);
		information1.put("director", "봉준호");
		information1.put("time", 131);
		information1.put("title", "기생충");
		information.add(information1);
		
		Map<String, Object> information2 = new HashMap<>();
		information2.put("rate", 0);
		information2.put("director", "로베르토 베니니");
		information2.put("time", 116);
		information2.put("title", "인생은 아름다워");
		information.add(information2);
		
		Map<String, Object> information3 = new HashMap<>();
		information3.put("rate", 12);
		information3.put("director", "크리스토퍼 놀란");
		information3.put("time", 147);
		information3.put("title", "인셉션");
		information.add(information3);
		
		Map<String, Object> information4 = new HashMap<>();
		information4.put("rate", 19);
		information4.put("director", "윤종빈");
		information4.put("time", 133);
		information4.put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");
		information.add(information4);
		
		Map<String, Object> information5 = new HashMap<>();
		information5.put("rate", 15);
		information5.put("director", "프란시스 로렌스");
		information5.put("time", 137);
		information5.put("title", "헝거게임");
		information.add(information5);
		
		return information;
	}
	
	@RequestMapping("/2")
	public List<Data> quiz02_2() {
		List<Data> datalist = new ArrayList<>();
		
		Data data1 = new Data();
		data1.setTitle("안녕하세요 가입인사 드립니다.");
		data1.setUser("hagulu");
		data1.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁드립니다. 활동 열심히 하겠습니다");
		datalist.add(data1);
		
		Data data2 = new Data();
		data2.setTitle("헐 대박");
		data2.setUser("bada");
		data2.setContent("오늘 목요일이였어...금요일인줄");
		datalist.add(data2);
		
		Data data3 = new Data();
		data3.setTitle("오늘 데이트 한 이야기 해드릴게요");
		data3.setUser("dulumary");
		data3.setContent("...");
		datalist.add(data3);
		
		return datalist;
	}
	
	@RequestMapping("/3")
	public ResponseEntity<Data> quiz02_3() {
		
		Data data1 = new Data();
		data1.setTitle("안녕하세요 가입인사 드립니다.");
		data1.setUser("hagulu");
		data1.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁드립니다. 활동 열심히 하겠습니다");
		
		return new ResponseEntity<>(data1, HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
}
