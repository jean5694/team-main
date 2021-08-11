package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MarketVO {

	private int mno;
	private String mwriter;
	private String mtitle;
	private int mprice;
	private String mdetail;
	private String mstate;
	private String msold;	
	private Date mregdate;
	private String maddress;
	
	private List<String> fileName; 
}