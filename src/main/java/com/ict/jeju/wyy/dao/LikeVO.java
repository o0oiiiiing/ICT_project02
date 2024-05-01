package com.ict.jeju.wyy.dao;

public class LikeVO {
	private String like_idx, like_active;
	private String u_idx, u_name;
	private String contentsid, vi_image, vi_value, vi_title;
	
	
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	
	public String getVi_image() { 
		return vi_image;
	}
	public void setVi_image(String vi_image) {
		this.vi_image = vi_image;
	}
	public String getVi_value() {
		return vi_value;
	}
	public void setVi_value(String vi_value) {
		this.vi_value = vi_value;
	}
	public String getVi_title() {
		return vi_title;
	}
	public void setVi_title(String vi_title) {
		this.vi_title = vi_title;
	}
	public String getLike_idx() {
		return like_idx;
	}
	public void setLike_idx(String like_idx) {
		this.like_idx = like_idx;
	}
	public String getLike_active() {
		return like_active;
	}
	public void setLike_active(String like_active) {
		this.like_active = like_active;
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
	
	
}