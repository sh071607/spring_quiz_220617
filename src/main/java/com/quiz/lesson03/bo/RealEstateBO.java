package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateDAO realestateDAO;
	
	public RealEstate getRealEstateById(int id) {
		return realestateDAO.selectRealEstateById(id);
	}
	
	public List<RealEstate> getRealEstateListByRentPrice(int rentPrice) {
		return realestateDAO.selectRealEstateListByRentPrice(rentPrice);
	}
	
	public List<RealEstate> getRealEstateListByAreaPrice(int area, int price) {
		return realestateDAO.selectRealEstateListByAreaPrice(area, price);
	}
	
	public int addRealEstate(RealEstate realestate) {
		return realestateDAO.insertRealEstate(realestate);
	}
	
	// realestateBO.addRealEstateAsField(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120)
	public int addRealEstateAsField(int realtorId, String address, int area, String type, int price, Integer rentPrice) {
		
		return realestateDAO.insertRealEstateAsField(realtorId, address, area, type, price, rentPrice);
	}
	
	// input: id, type, price
	// output: int(성공한 행의 개수)
	public int updateRealEstateById(int id, String type, int price) {
		return realestateDAO.updateRealEstateById(id, type, price);
	}
	
	public int deleteRealEstateById(int id) {
		return realestateDAO.deleteRealEstateById(id);
	}
	
}
