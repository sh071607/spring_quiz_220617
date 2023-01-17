package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Favorite;

@Repository
public interface FavoriteDAO {

	public void insertFavorite(
			@Param("title") String title,
			@Param("url") String url); 
	
	public List<Favorite> selectFavoriteList();
	
	public List<Favorite> selectFavoriteByUrl(String url);
	
	public int deleteFavorite(int id);
	
}
