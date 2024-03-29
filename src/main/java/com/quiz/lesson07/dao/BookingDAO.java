package com.quiz.lesson07.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson07.model.Booking;

@Repository
public interface BookingDAO {
	public List<Booking> selectBookingList();
	
	public int deleteBookingById(int id);

	public int insertBooking(
			@Param("name") String name, 
			@Param("date") String date,
			@Param("day") int day, 
			@Param("headcount") int headcount, 
			@Param("phoneNumber") 	String phoneNumber);
	
	public List<Booking> selectbookingListByNamePhoneNumber(
			@Param("name") String name, 
			@Param("phoneNumber") String phoneNumber);
}
