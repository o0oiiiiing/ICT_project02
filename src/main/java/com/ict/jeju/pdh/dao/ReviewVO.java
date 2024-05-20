package com.ict.jeju.pdh.dao;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
	private String re_idx, u_idx, report_idx, contentsid, re_content, re_grade, re_regdate;
	private String pic_idx, pic_file;
	private MultipartFile[] images;
	
	public String getPic_file() {
		return pic_file;
	}

	public void setPic_file(String pic_file) {
		this.pic_file = pic_file;
	}

	public MultipartFile[] getImages() {
		return images;
	}

	public void setImages(MultipartFile[] images) {
		this.images = images;
	}

	public String getRe_idx() {
		return re_idx;
	}

	public void setRe_idx(String re_idx) {
		this.re_idx = re_idx;
	}

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}

	public String getPic_idx() {
		return pic_idx;
	}

	public void setPic_idx(String pic_idx) {
		this.pic_idx = pic_idx;
	}

	public String getReport_idx() {
		return report_idx;
	}

	public void setReport_idx(String report_idx) {
		this.report_idx = report_idx;
	}

	public String getContentsid() {
		return contentsid;
	}

	public void setContentsid(String contentsid) {
		this.contentsid = contentsid;
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
