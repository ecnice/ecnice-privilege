package com.ecnice.privilege.service.privilege.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ecnice.privilege.common.PagerModel;
import com.ecnice.privilege.common.Query;
import com.ecnice.privilege.dao.privilege.IAclDao;
import com.ecnice.privilege.dao.privilege.IRoleDao;
import com.ecnice.privilege.dao.privilege.IUserRoleDao;
import com.ecnice.privilege.model.privilege.ACL;
import com.ecnice.privilege.model.privilege.Role;
import com.ecnice.privilege.service.privilege.IRoleService;
import com.ecnice.tools.common.UUIDGenerator;

/**
 * @Title:
 * @Description:角色service
 * @Author:Bruce.Liu
 * @Since:2014年3月31日
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
@Service
public class RoleServiceImpl implements IRoleService {
	
	@Resource
	private IRoleDao roleDao;
	@Resource
	private IUserRoleDao userRoleDao;
	@Resource
	private IAclDao aclDao;
	@Override
	public List<Role> getRolesByUserId(String userId) throws Exception {
		return roleDao.getRolesByUserId(userId);
	}

	@Override
	public void insertRole(Role role) throws Exception {
		role.setId(UUIDGenerator.generate());
		roleDao.insertRole(role);
	}

	@Override
	public void updateRole(Role role) throws Exception {
		roleDao.updateRole(role);
	}

	@Override
	public void delRole(String id) throws Exception {
		roleDao.delRole(id);
		userRoleDao.delUserRoleByRoleId(id);
		ACL acl=new ACL();
		acl.setReleaseId(id);
		aclDao.delAcl(acl);
	}
	
	@Override
	public void delRoles(String[] ids) throws Exception {
		for(String id : ids){
			this.delRole(id);
		}
	}

	@Override
	public Role getRoleById(String id) throws Exception {
		return roleDao.getRoleById(id);
	}

	@Override
	public PagerModel<Role> getPagerModel(Role role, Query query)
			throws Exception {
		return roleDao.getPagerModel(role, query);
	}
	
	@Override
	public List<Role> getAll(Role role) throws Exception {
		return this.roleDao.getAll(role);
	}

}
