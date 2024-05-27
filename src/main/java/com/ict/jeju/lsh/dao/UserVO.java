package com.ict.jeju.lsh.dao;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {
	private String u_idx, u_id, u_pwd, u_name, u_birth, u_email, u_phone, u_postcode, u_detail_addr, u_detail_addr2,
			u_gender, u_addr, u_state, u_regdate, active, u_report, step, u_del, out_regdate, u_restore, re_regdate,
			u_profile_img, join_date, user_count, inactiveUsers, activeUsers, out_admin, re_admin, a_name, old_f_name, bo_idx, report_idx;

	private MultipartFile file;

//	public String getRe_active() {
//		return re_active;
//	}
//
//	public void setRe_active(String re_active) {
//		this.re_active = re_active;
//	}

	public MultipartFile getFile() {
		return file;
	}

	public String getBo_idx() {
		return bo_idx;
	}

	public void setBo_idx(String bo_idx) {
		this.bo_idx = bo_idx;
	}

	public String getReport_idx() {
		return report_idx;
	}

	public void setReport_idx(String report_idx) {
		this.report_idx = report_idx;
	}

	public String getOld_f_name() {
		return old_f_name;
	}

	public void setOld_f_name(String old_f_name) {
		this.old_f_name = old_f_name;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public String getOut_admin() {
		return out_admin;
	}

	public void setOut_admin(String out_admin) {
		this.out_admin = out_admin;
	}

	public String getRe_admin() {
		return re_admin;
	}

	public void setRe_admin(String re_admin) {
		this.re_admin = re_admin;
	}

	public String getJoin_date() {
		return join_date;
	}

	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}

	public String getUser_count() {
		return user_count;
	}

	public void setUser_count(String user_count) {
		this.user_count = user_count;
	}

	public String getInactiveUsers() {
		return inactiveUsers;
	}

	public void setInactiveUsers(String inactiveUsers) {
		this.inactiveUsers = inactiveUsers;
	}

	public String getActiveUsers() {
		return activeUsers;
	}

	public void setActiveUsers(String activeUsers) {
		this.activeUsers = activeUsers;
	}

	private MultipartFile user_profile;

	public MultipartFile getUser_profile() {
		return user_profile;
	}

	public void setUser_profile(MultipartFile user_profile) {
		this.user_profile = user_profile;
	}

	public String getU_profile_img() {
		return u_profile_img;
	}

	public void setU_profile_img(String u_profile_img) {
		this.u_profile_img = u_profile_img;
	}

	public String getRe_regdate() {
		return re_regdate;
	}

	public void setRe_regdate(String re_regdate) {
		this.re_regdate = re_regdate;
	}

	public String getU_restore() {
		return u_restore;
	}

	public void setU_restore(String u_restore) {
		this.u_restore = u_restore;
	}

	public String getOut_regdate() {
		return out_regdate;
	}

	public void setOut_regdate(String out_regdate) {
		this.out_regdate = out_regdate;
	}

	public String getU_del() {
		return u_del;
	}

	public void setU_del(String u_del) {
		this.u_del = u_del;
	}

	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getU_report() {
		return u_report;
	}

	public void setU_report(String u_report) {
		this.u_report = u_report;
	}

	public String getU_postcode() {
		return u_postcode;
	}

	public void setU_postcode(String u_postcode) {
		this.u_postcode = u_postcode;
	}

	public String getU_detail_addr() {
		return u_detail_addr;
	}

	public void setU_detail_addr(String u_detail_addr) {
		this.u_detail_addr = u_detail_addr;
	}

	public String getU_detail_addr2() {
		return u_detail_addr2;
	}

	public void setU_detail_addr2(String u_detail_addr2) {
		this.u_detail_addr2 = u_detail_addr2;
	}

	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}

	public String getU_state() {
		return u_state;
	}

	public void setU_state(String u_state) {
		this.u_state = u_state;
	}

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pwd() {
		return u_pwd;
	}

	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_birth() {
		return u_birth;
	}

	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public String getU_addr() {
		return u_addr;
	}

	public void setU_addr(String u_addr) {
		this.u_addr = u_addr;
	}

	public String getU_regdate() {
		return u_regdate;
	}

	public void setU_regdate(String u_regdate) {
		this.u_regdate = u_regdate;
	}

}
