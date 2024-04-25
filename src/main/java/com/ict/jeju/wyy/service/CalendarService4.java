package com.ict.jeju.wyy.service;

import java.util.List;

import com.ict.jeju.wyy.dao.CalendarVO4;

public interface CalendarService4 {
	
	// 전체 보기
	public List<CalendarVO4> calList();
	
	// 삭제
	public int calDelete(String c_idx);
	
}
