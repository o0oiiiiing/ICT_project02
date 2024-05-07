package com.ict.jeju.lsh.dao;

public class KakaoUserVO {
	private String id, connected_at;
	private KakaoProperties properties;
	private KakaoAccount kakao_account;
	
	public KakaoUserVO(String id, String connected_at, KakaoProperties properties, KakaoAccount kakao_account) {
		this.id = id;
		this.connected_at = connected_at;
		this.properties = properties;
		this.kakao_account = kakao_account;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getConnected_at() {
		return connected_at;
	}

	public void setConnected_at(String connected_at) {
		this.connected_at = connected_at;
	}

	public KakaoProperties getProperties() {
		return properties;
	}

	public void setProperties(KakaoProperties properties) {
		this.properties = properties;
	}

	public KakaoAccount getKakao_account() {
		return kakao_account;
	}

	public void setKakao_account(KakaoAccount kakao_account) {
		this.kakao_account = kakao_account;
	}
	
}
