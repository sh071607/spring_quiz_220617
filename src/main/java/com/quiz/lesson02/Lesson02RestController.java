package com.quiz.lesson02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;

@RestController
public class Lesson02RestController {
	
	@Autowired
	private StoreBO storeBO;
	
	// 요청 URL : http://localhost/lesson02/quiz01
	@RequestMapping("/lesson02/quiz01")
	public List<Store> quiz01() {
		List<Store> StoreList = storeBO.getStoreList();
		return StoreList;
	}

}
