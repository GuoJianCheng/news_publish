package com.ssm.service;
import java.util.List;
import com.ssm.po.User;
/*
 * 用户Service层接口
 */
public interface UserService {
	public List<User> findUserList(String keywords, Integer userListRoleId);
	public User findUser(String loginName, String password);
	public User getUserByUserId(Integer userId);
	public User getUserByLoginName(String loginName);
	public int editUser(User user);
	public int addUser(User user);
	public int delUser(Integer userId);
	public int setUserStatus(User user);
}
