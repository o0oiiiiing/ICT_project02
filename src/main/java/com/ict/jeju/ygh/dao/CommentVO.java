package com.ict.jeju.ygh.dao;

public class CommentVO {
	private String com_idx, com_title, com_content, com_regdate, com_status, com_writer, bo_idx;

	public String getBo_idx() {
		return bo_idx;
	}

	public void setBo_idx(String bo_idx) {
		this.bo_idx = bo_idx;
	}

	public String getCom_writer() {
		return com_writer;
	}

	public void setCom_writer(String com_writer) {
		this.com_writer = com_writer;
	}

	public String getCom_idx() {
		return com_idx;
	}

	public void setCom_idx(String com_idx) {
		this.com_idx = com_idx;
	}

	public String getCom_title() {
		return com_title;
	}

	public void setCom_title(String com_title) {
		this.com_title = com_title;
	}

	public String getCom_content() {
		return com_content;
	}

	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}

	public String getCom_regdate() {
		return com_regdate;
	}

	public void setCom_regdate(String com_regdate) {
		this.com_regdate = com_regdate;
	}

	public String getCom_status() {
		return com_status;
	}

	public void setCom_status(String com_status) {
		this.com_status = com_status;
	}
	
}
