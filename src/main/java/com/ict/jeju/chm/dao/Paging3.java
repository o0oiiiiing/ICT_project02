package com.ict.jeju.chm.dao;

import org.springframework.stereotype.Component;

@Component
public class Paging3 {
	private int nowPage = 1 ;
	private int nowBlock = 1 ;
	
	// 한 페이지당 12개
	private int numPerPage = 12 ;
	// 한 블록당 5개
	private int pagePerBlock = 5 ;
	
	// --------------------------컨트롤러에서 설정
	// DB의 게시물의 수
	private int totalRecord = 0 ;
	// 게시물의 수을 이용해서 전체 페이지의 수
	private int totalPage = 0 ;
	
	private int beginBlock = 0 ;
	private int endBlock = 0;
	
	private int offset = 0;

	//----------------getter, setter
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	

	public int getBeginBlock() {
		return beginBlock;
	}

	public void setBeginBlock(int beginBlock) {
		this.beginBlock = beginBlock;
	}

	public int getEndBlock() {
		return endBlock;
	}

	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}
	
}
