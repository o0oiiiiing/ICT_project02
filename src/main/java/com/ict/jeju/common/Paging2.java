package com.ict.jeju.common;

import org.springframework.stereotype.Component;

@Component
public class Paging2 {
	private int nowPage2 = 1;
	private int nowBlock = 1;

	// 한 페이지당 줄 갯수
	private int numPerPage = 10;
	private int numPerPage2 = 5;
	// 한 블록당 3개
	private int pagePerBlock = 5;
	private int pagePerBlock2 = 5;
	// DB의 게시물의 수
	private int totalRecord = 0;
	// 게시물의 수를 이용해서 전체 페이지의 수
	private int totalPage = 0;

	private int totalBlock = 0;

	// 한번에 가져올 게시물의 시작번호와 끝번호
	private int begin = 0;
	private int end = 0;

	private int beginBlock = 0;
	private int endBlock = 0;

	private int offset = 0;

	public int getPagePerBlock2() {
		return pagePerBlock2;
	}

	public void setPagePerBlock2(int pagePerBlock2) {
		this.pagePerBlock2 = pagePerBlock2;
	}

	public int getNumPerPage2() {
		return numPerPage2;
	}

	public void setNumPerPage2(int numPerPage2) {
		this.numPerPage2 = numPerPage2;
	}

	public int getNowPage2() {
		return nowPage2;
	}

	public void setNowPage2(int nowPage2) {
		this.nowPage2 = nowPage2;
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

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
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
