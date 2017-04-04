package com.hospital.web.domain;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Component @Data @Lazy
public class Article {
	@Getter
	@Setter
	private String seq/* ���̱� ������ */, id, title, content, regdate, readCount;

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getUid() {
		return id;
	}

	public void setUid(String uid) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getReadCount() {
		return readCount;
	}

	public void setReadCount(String readCount) {
		this.readCount = readCount;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("[ %s | %s | %s | %s | %s ]", seq, id, title, regdate, "0");
	}
}
