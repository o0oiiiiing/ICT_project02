package com.ict.jeju.ygh.dao;


public class MyreviewVO {
	private String re_idx, u_idx , contentsid , u_profile_img , u_name 
	, re_content,re_grade,re_regdate ,vi_title, pic_file;

	public String getPic_file() {
		return pic_file;
	}

	public void setPic_file(String pic_file) {
		this.pic_file = pic_file;
	}

	public String getRe_idx() {
		return re_idx;
	}

	public void setRe_idx(String re_idx) {
		this.re_idx = re_idx;
	}

	public String getVi_title() {
		return vi_title;
	}

	public void setVi_title(String vi_title) {
		this.vi_title = vi_title;
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

	public String getU_profile_img() {
		return u_profile_img;
	}

	public void setU_profile_img(String u_profile_img) {
		this.u_profile_img = u_profile_img;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public String getRe_grade() {
		return re_grade;
	}

	public void setRe_grade(String re_grade) {
		this.re_grade = re_grade;
	}

	public String getRe_regdate() {
		return re_regdate;
	}

	public void setRe_regdate(String re_regdate) {
		this.re_regdate = re_regdate;
	}
	
}
