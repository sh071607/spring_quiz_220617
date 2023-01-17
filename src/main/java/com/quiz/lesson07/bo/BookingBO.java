package com.quiz.lesson07.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson07.dao.BookingDAO;
import com.quiz.lesson07.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	public int deleteBookingById(int id) {
		return bookingDAO.deleteBookingById(id);
	}

	public int addBooking(String name, String date, int day, int headcount, String phoneNumber) {
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber);
	}
	
	public Booking getLatestBooking(String name, String phoneNumber) {
		List<Booking> bookingList = bookingDAO.selectbookingListByNamePhoneNumber(name, phoneNumber);	// [],  채워져 있거나
		if (CollectionUtils.isEmpty(bookingList)) {
			return null;
		}
		
		return bookingList.get(bookingList.size() - 1); // 마지막 인덱스 데이터 가져옴
		
	}
}
