package com.ict.jeju.ygh.dao;

public class ReportVO {
	private String report_idx, report_title, report_content, active, report_writer, report_regdate, step, report_pwd,
			lev, groups, u_idx, u_name;

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}

	public String getReport_pwd() {
		return report_pwd;
	}

	public void setReport_pwd(String report_pwd) {
		this.report_pwd = report_pwd;
	}

	public String getLev() {
		return lev;
	}

	public void setLev(String lev) {
		this.lev = lev;
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

	public String getReport_idx() {
		return report_idx;
	}

	public void setReport_idx(String report_idx) {
		this.report_idx = report_idx;
	}

	public String getReport_title() {
		return report_title;
	}

	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getReport_writer() {
		return report_writer;
	}

	public void setReport_writer(String report_writer) {
		this.report_writer = report_writer;
	}

	public String getReport_regdate() {
		return report_regdate;
	}

	public void setReport_regdate(String report_regdate) {
		this.report_regdate = report_regdate;
	}

}
