package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {
	
	@Autowired
	private SellerBO sellerBO;

	//입력 form URL : http://localhost/lesson04/quiz01/1
	@RequestMapping("/1")
	public String addSellerView() {
		return "lesson04/addSeller"; 	
	}
	
	//입력 url: http://localhost/lesson04/quiz01/add_seller
	
	@RequestMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam("profileImageUrl") String profileImageUrl,
			@RequestParam("temperature") double temperature) {
		
		// db insert
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		// 결과 jsp
		return "lesson04/afterAddSeller";
	}
	
	//요청 URL : http://localhost/lesson04/quiz01/seller_info
	
	@RequestMapping("/seller_info")
	public String sellerInfo(Model model) {
		
		Seller seller = sellerBO.getSellerInfo();	
		
		model.addAttribute("seller", seller);
		return "lesson04/sellerinfo";
		
	}
	
}