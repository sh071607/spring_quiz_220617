package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@RequestMapping("/lesson06")
@Controller
public class Lesson06Controller {
	
	@Autowired
	private FavoriteBO favoriteBO;
	
	@RequestMapping("/add_favorite_view")
	public String addFavoriteView () {
		return "lesson06/addFavorite";
	}
	
	// ajax가 호출하는 API -> @ResponseBody 있어야함
	@ResponseBody
	@PostMapping("/add_favorite")
	public String addFavorite(
			@RequestParam("title") String title,
			@RequestParam("url") String url) {
		
		// insert
	//	favoriteBO.addFavorite(name, url);
		
		return "success";
	}
	
	@RequestMapping("/favorite_list_view")
	public String favoriteListView(Model model) {
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		model.addAttribute("favoriteList", favoriteList);
		return "lesson06/favoriteList";
	}
	
	// quiz02
	
	// ajax 호출하는 API -> @ResponseBody
	@ResponseBody
	@PostMapping("/is_duplication_url")
	public Map<String, Boolean> isDuplicationUrl(
			@RequestParam("url") String url) {
		
		Map<String, Boolean> result = new HashMap<>();
		Favorite favorite = favoriteBO.getFavoriteByUrl(url);
		if (favorite == null) {
			result.put("isDuplication", false);
			
		} else {
			result.put("isDuplication", true);
		}
		
		return result; // json String
	}
	
	// ajax가 호출 -> ResponsBody
	@ResponseBody
	@DeleteMapping("/delete_favorite")
	public Map<String, Object> deleteFavorite(
			@RequestParam("id") int id) {
		
		Map<String, Object> result = new HashMap<>();
		
		int deleteRow = favoriteBO.deleteFavorite(id);
		if (deleteRow > 0) {
			result.put("code", 100); // 100이면 성공 -> 서버가 지정
			result.put("result", "성공");
		} else {
			result.put("code", 500); // 500이면 실패 -> 서버가 지정
			result.put("errorMessage", "삭제하는데 실패하였습니다.");
		}
		
		return result;
		
	}
	
	
	@RequestMapping("/ex02/add_favorite_view")
	public String addFavoriteUrl() {
		return "lesson06/addFavoriteUrl";
	}
		
}
