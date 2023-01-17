package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RestController
public class Lesson03Quiz01RestController {
	
	@Autowired
	private RealEstateBO realestateBO;
	
	// 요청url: http://localhost/lesson03/quiz01/1?id=20
	@RequestMapping("/lesson03/quiz01/1")
	public RealEstate quiz01_1 (
			
			@RequestParam("id") int id
			
			
	) {
		return realestateBO.getRealEstateById(id);
		
	}
	
	// 요청url: http://localhost/lesson03/quiz01/2?rentPrice=90
	@RequestMapping("/lesson03/quiz01/2")
	public List<RealEstate> quiz01_2 (
		@RequestParam("rentPrice") int rentPrice
	) {
		return realestateBO.getRealEstateListByRentPrice(rentPrice);
		
	}
	
	// 요청url: http://localhost/lesson03/quiz01/3?area=90&price=130000
	@RequestMapping("/lesson03/quiz01/3")
	public List<RealEstate> quiz01_3 (
			@RequestParam("area") int area
			,@RequestParam("price") int price
		) {
		
		return realestateBO.getRealEstateListByAreaPrice(area, price);
		
	}
}
