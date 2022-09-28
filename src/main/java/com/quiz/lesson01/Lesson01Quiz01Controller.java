package com.quiz.lesson01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/lesson01/quiz01")
@Controller
public class Lesson01Quiz01Controller {
	@ResponseBody
	@RequestMapping("/1")
	public String quiz01_1() {
		// @ResponseBody + String 리턴 -> HTML 응답값
		String text = "<h1>테스트 프로젝트 완성</h1><b>해당 프로젝트를 통해서 문제 풀이를 진행합니다.</b>";
				return text;
	}
	
	@RequestMapping("/2")
	@ResponseBody
	public Map<String, Integer> quiz01_2() {
		Map<String, Integer> score = new HashMap<>();
		score.put("국어", 80);
		score.put("수학", 90);
		score.put("영어", 85);
		return score;	// map -> jackson 라이브러리 -> JSON String
	}
}
