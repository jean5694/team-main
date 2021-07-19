package org.zerock.domain;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;

import lombok.Data;

@Data
public class UserVO {

	private String userid;
    private String userpw;
    private String userName;
    private String userphone;
    private String userem;
    private String useradd;
    private Date regdate;
    private Date updateDate;
    private boolean enabled;
	
//	public String getUserId() {
//		return userId;
//	}
//	public void setUserId(String userId) {
//		this.userId = userId;
//	}
//	public String getUserPassword() {
//		return userPassword;
//	}
//	public void setUserPassword(String userPassword) {
//		this.userPassword = userPassword;
//	}
//	public String getUserName() {
//		return userName;
//	}
//	public void setUserName(String userName) {
//		this.userName = userName;
//	}
//	public String getUserEmail() {
//		return userEmail;
//	}
//	public void setUserEmail(String userEmail) {
//		this.userEmail = userEmail;
//	}
//	public String getUserPhone() {
//		return userPhone;
//	}
//	public void setUserPhone(String userPhone) {
//		this.userPhone = userPhone;
//	}
	
	
//	@Override
//	public String toString() {
//		return "UserVO [userId=" + userId + ", userPassword=" + userPassword + ", userName=" + userName + ", userEmail="
//				+ userEmail + ", userPhone=" + userPhone + "]";
//	}
	private List<AuthVO> authList;

//	public Collection<? extends GrantedAuthority> getAuthList() {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
