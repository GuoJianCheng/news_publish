package com.ssm.service;
import java.util.List;
import com.ssm.po.Role;
/*
 * 角色Service层接口
 */
public interface RoleService {
	public List<Role> findRoleList();
	public Role findRoleWithUsersByRoleId(Integer roleId);
}