package org.zerock.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum;
	private int amount;

	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public int getFrom() {
		return amount * (pageNum - 1);
	}
}
	
//	private int pageNum;
//	private int amount;
//	
//	private String type;
//	private String keyword;
//	
//	public Criteria() {
//		this(1, 10);
//	}
//	
//	public Criteria(int pageNum, int amount) {
//		this.pageNum = pageNum;
//		this.amount = amount;
//	}
//	
////	public int getFrom() {
////		return amount * (pageNum - 1);
////	}
////	
////	public String[] getTypeArr() {
////		if (type == null) {
////			return new String[] {};
////		} else {
////			String[] types = type.split("");
////			return types;
////		}
////	}
//	public String[] getTypeArr() {
//		return type == null ? new String[] {} : type.split("");
//	}
//	public String getListLink() {
//		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("").queryParam("pageNum", this.pageNum)
//				.queryParam("amount", this.amount).queryParam("type", this.type).queryParam("keyword", this.keyword);
//		return builder.toUriString();
//	}
	
	