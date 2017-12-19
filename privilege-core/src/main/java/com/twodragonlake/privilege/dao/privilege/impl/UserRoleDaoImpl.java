package com.twodragonlake.privilege.dao.privilege.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.twodragonlake.privilege.dao.MybatisTemplate;
import com.twodragonlake.privilege.dao.privilege.IUserRoleDao;
import com.twodragonlake.privilege.model.privilege.Role;
import com.twodragonlake.privilege.model.privilege.UserRole;

/**
 * @Title:
 * @Description:用户角色dao实现类
 * @Author:Bruce.Liu
 * @Since:2014年4月1日
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
@Repository
public class UserRoleDaoImpl extends MybatisTemplate implements IUserRoleDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> getRolesByUserId(String userId) throws Exception {
		return (List<Role>) this.selectList("UserRoleXML.getRolesByUserId", userId);
	}

	@Override
	public void insertUserRole(UserRole ur) throws Exception {
		this.insert("UserRoleXML.insertUserRole", ur);
	}

	@Override
	public void delUserRole(String id) throws Exception {
		this.delete("UserRoleXML.delUserRole", id);
	}

	@Override
	public void delUserRoleByUserId(String userId) throws Exception {
		this.delete("UserRoleXML.delUserRoleByUserId", userId);
	}

	@Override
	public void delUserRoleByRoleId(String roleId) throws Exception {
		this.delete("UserRoleXML.delUserRoleByRoleId", roleId);
	}

}
