package com.kh.summer.user.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Member implements Serializable {

	private static final long serialVersionUID = 1004L;
	
	private String userId;
	private String password;
	private String nickName;
	private String userName;
	private String gender;
	private String birth;
	private String email;
	private String phone;
	private String address;
	private String membership;
	private Date enrollDate;
	private String mstatus;
	private Date deleteDate;
	
}
