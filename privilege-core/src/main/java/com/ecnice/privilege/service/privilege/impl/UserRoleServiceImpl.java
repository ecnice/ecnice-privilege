package com.ecnice.privilege.service.privilege.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ecnice.privilege.dao.privilege.IUserRoleDao;
import com.ecnice.privilege.model.privilege.Role;
import com.ecnice.privilege.model.privilege.UserRole;
import com.ecnice.privilege.service.privilege.IUserRoleService;
import com.mhome.tools.common.UUIDGenerator;

/**
 * 
 * @Description:用户角色
 * @Author:Martin.Wang
 * @Since:2014-4-2
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
@Service
public class UserRoleServiceImpl implements IUserRoleService {
	@Resource
	private IUserRoleDao userRoleDao;

	@Override
	public void insertUserRole(UserRole ur) throws Exception {
		this.userRoleDao.insertUserRole(ur);
	}
	@Override
	public void insertUserRoles(String[] roleIds, String userId)
			throws Exception {
		this.userRoleDao.delUserRoleByUserId(userId);
		for(String roleId:roleIds){
			UserRole userRole=new UserRole();
			userRole.setId(UUIDGenerator.generate());
			userRole.setUserId(userId);
			userRole.setRoleId(roleId);
			this.insertUserRole(userRole);
		}
	}
	
	@Override
	public void insertUserRoles(String userId) throws Exception {
		this.userRoleDao.delUserRoleByUserId(userId);
	}
	
	@Override
	public void delUserRole(String id) throws Exception {
		this.userRoleDao.delUserRole(id);
	}

	@Override
	public void delUserRoleByUserId(String userId) throws Exception {
		this.userRoleDao.delUserRoleByUserId(userId);
	}

	@Override
	public void delUserRoleByRoleId(String roleId) throws Exception {
		this.userRoleDao.delUserRoleByRoleId(roleId);
	}

	@Override
	public List<Role> getRolesByUserId(String userId) throws Exception {
		return this.userRoleDao.getRolesByUserId(userId);

	}

}
