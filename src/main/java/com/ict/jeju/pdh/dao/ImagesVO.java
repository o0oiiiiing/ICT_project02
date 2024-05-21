package com.ict.jeju.pdh.dao;

import org.springframework.web.multipart.MultipartFile;

public class ImagesVO {
	private String pic_idx, pic_file, re_idx;
	private MultipartFile[] images;
	
	public String getPic_idx() {
		return pic_idx;
	}
	public void setPic_idx(String pic_idx) {
		this.pic_idx = pic_idx;
	}
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
	public MultipartFile[] getImages() {
		return images;
	}
	public void setImages(MultipartFile[] images) {
		this.images = images;
	}
	
	
}
