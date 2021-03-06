package com.sist.vo;
/*
 *  ID       NOT NULL VARCHAR2(20)  
	PWD      NOT NULL VARCHAR2(10)  
	NAME     NOT NULL VARCHAR2(34)  
	BIRTHDAY NOT NULL VARCHAR2(20)  
	EMAIL    NOT NULL VARCHAR2(100) 
	SEX               VARCHAR2(10)  
	TEL      NOT NULL VARCHAR2(20)  
	POST     NOT NULL VARCHAR2(7)   
	ADDR1    NOT NULL VARCHAR2(300) 
	ADDR2             VARCHAR2(300) 
	ADMIN             CHAR(1)       
 */
public class MemberVO {
	private String id, pwd, name, birthday, email, sex, tel, post, addr1, addr2, admin;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}
	
	
}
