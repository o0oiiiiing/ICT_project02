package com.ict.jeju.pdh.dao;

import java.util.List;

public class QaVO {
	private String bo_idx, u_idx, contentsid, bo_writer, bo_title, bo_content, bo_pwd, bo_hit, active, bo_regdate, disclosure, u_name;
	private String offset, limit;
	List<CommentVO> comments;
	
	public String getOffset() {
		return offset;
	}

	public void setOffset(String offset) {
		this.offset = offset;
	}

	public String getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}


	public List<CommentVO> getComments() {
		return comments;
	}

	public void setComments(List<CommentVO> comments) {
		this.comments = comments;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getBo_idx() {
		return bo_idx;
	}

	public void setBo_idx(String bo_idx) {
		this.bo_idx = bo_idx;
	}

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}

	public String getContentsid() {
		return contentsid;
	}

	public void setContentsid(String contentsid) {
		this.contentsid = contentsid;
	}

	public String getBo_writer() {
		return bo_writer;
	}

	public void setBo_writer(String bo_writer) {
		this.bo_writer = bo_writer;
	}

	public String getBo_title() {
		return bo_title;
	}

	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}

	public String getBo_content() {
		return bo_content;
	}

	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}

	public String getBo_pwd() {
		return bo_pwd;
	}

	public void setBo_pwd(String bo_pwd) {
		this.bo_pwd = bo_pwd;
	}

	public String getBo_hit() {
		return bo_hit;
	}

	public void setBo_hit(String bo_hit) {
		this.bo_hit = bo_hit;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getBo_regdate() {
		return bo_regdate;
	}

	public void setBo_regdate(String bo_regdate) {
		this.bo_regdate = bo_regdate;
	}

	public String getDisclosure() {
		return disclosure;
	}

	public void setDisclosure(String disclosure) {
		this.disclosure = disclosure;
	}
}
