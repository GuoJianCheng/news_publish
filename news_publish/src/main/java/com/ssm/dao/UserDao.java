package com.ssm.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.ssm.po.User;
/*
 * 用户DAO层接口
 */
public interface UserDao {
	//查询所有用户
	public List<User> selectUserList(@Param("keywords") String keywords, @Param("userListRoleId") Integer userListRoleId);
	//通过账号和密码查询用户
	public User findUser(@Param("loginName") String loginName, @Param("password") String password);
	public User getUserByUserId(Integer userId);
	public User getUserByLoginName(String loginName);
	public int addUser(User user);
	public int updateUser(User user);
	public int delUser(Integer userId);
	public int setUserStatus(User user);
}