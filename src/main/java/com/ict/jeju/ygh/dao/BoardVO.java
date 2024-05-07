package com.ict.jeju.ygh.dao;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private String bo_idx, u_idx, bo_writer, bo_title, bo_content, bo_pwd, bo_hit, active, groups, step, lev, bo_regdate, f_name, old_f_name;
	private MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getOld_f_name() {
		return old_f_name;
	}

	public void setOld_f_name(String old_f_name) {
		this.old_f_name = old_f_name;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
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

	public String getGroups() {
		return groups;
	}

	public void setGroups(String groups) {
		this.groups = groups;
	}

	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}

	public String getLev() {
		return lev;
	}

	public void setLev(String lev) {
		this.lev = lev;
	}

	public String getBo_regdate() {
		return bo_regdate;
	}

	public void setBo_regdate(String bo_regdate) {
		this.bo_regdate = bo_regdate;
	}

	

	
	
	
}
