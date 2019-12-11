package com.ssm.po;
import java.util.Date;
public class User {
	private Integer userId;
	private String userName;
	private String loginName;
	private String password;
	private String tel;
	private Date registerTime;
	private String status;
	private Integer roleId;
	//为了方便列表页显示角色名，增加roleName属性
	private String roleName;
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", loginName=" + loginName + ", password="
				+ password + ", tel=" + tel + ", registerTime=" + registerTime + ", status=" + status + ", roleId="
				+ roleId + ", roleName=" + roleName + "]";
	}
}

