package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;

@RestController
public class Lesson03Quiz04RestController {
	
	@Autowired
	private RealEstateBO realestateBO;
	
	// 요청url: http://localhost/lesson03/quiz04/1?id=21
	@RequestMapping("/lesson03/quiz04/1")
	public String quiz04_1(
			@RequestParam("id") int id) {
		
		// db 삭제
		int row = realestateBO.deleteRealEstateById(id);
		// 응답값 
		
		return "삭제 성공:" + row;
		
	}

}
