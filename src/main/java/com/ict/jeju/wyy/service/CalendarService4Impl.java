package com.ict.jeju.wyy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.jeju.wyy.dao.CalendarDAO4;
import com.ict.jeju.wyy.dao.CalendarVO4;

@Service
public class CalendarService4Impl implements CalendarService4{
	
	@Autowired
	private CalendarDAO4 cdao4;
	
	// 전체 보기
	@Override
	public List<CalendarVO4> calList() {
		return cdao4.calList();
	}
	// 삭제
	@Override
	public int calDelete(String c_idx) {
		return cdao4.calDelete(c_idx);
	}


}
