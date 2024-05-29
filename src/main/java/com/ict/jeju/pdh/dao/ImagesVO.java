package com.ict.jeju.pdh.dao;

import org.springframework.web.multipart.MultipartFile;

public class ImagesVO {
	private String pic_idx, pic_file, re_idx;
	private String u_profile_img, u_name, u_id;
	
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
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
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
