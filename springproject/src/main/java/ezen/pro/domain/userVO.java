package ezen.pro.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class userVO {

	private String id;
	private String password;
	private String name;
	private String phone;
	private int grade;
	public String getPassword() {
		// TODO Auto-generated method stub
		return null;
	}
	public void setPassword(String securePw) {
		// TODO Auto-generated method stub
		
	}
	public int getGrade() {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
