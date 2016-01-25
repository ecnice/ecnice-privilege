package com.ecnice.privilege.service.privilege.impl;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.springframework.stereotype.Service;

import com.ecnice.privilege.cache.CacheEntity;
import com.ecnice.privilege.cache.CacheListHandler;
import com.ecnice.privilege.common.SessionMap;
import com.ecnice.privilege.constant.PrivilegeConstant;
import com.ecnice.privilege.dao.privilege.IAclDao;
import com.ecnice.privilege.dao.privilege.IModuleDao;
import com.ecnice.privilege.dao.privilege.IRoleDao;
import com.ecnice.privilege.model.privilege.ACL;
import com.ecnice.privilege.model.privilege.Module;
import com.ecnice.privilege.model.privilege.Role;
import com.ecnice.privilege.service.privilege.IAclService;
import com.ecnice.privilege.utils.JsonUtils;
import com.google.gson.reflect.TypeToken;
import com.mhome.tools.common.UUIDGenerator;

/**
 * @Title:
 * @Description:访问控制中心service实现类
 * @Author:Bruce.Liu
 * @Since:2014年4月1日
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
@Service
public class AclServiceImpl implements IAclService {
	@Resource
	private IAclDao aclDao;
	@Resource
	private IRoleDao roleDao;
	@Resource
	private IModuleDao moduleDao;
	@Resource
	private CacheListHandler cacheListHandler;
	
	public void createAclByModule(ACL acl, boolean yes) throws Exception {
		if(yes) {
			List<ACL> acls = aclDao.getAllACL(acl);
			Module module = moduleDao.getModuleById(acl.getModuleId());
			if(CollectionUtils.isNotEmpty(acls)) {
				ACL currAcl = acls.get(0);
				currAcl.setAclState(module.getState());
				aclDao.updateAcl(currAcl);
			}else {
				ACL al = new ACL();
				al.setId(UUIDGenerator.generate());
				al.setAclState(module.getState());
				al.setModuleId(module.getId());
				al.setModuleSn(module.getSn());
				al.setReleaseId(acl.getReleaseId());
				al.setReleaseSn(acl.getReleaseSn());
				al.setSystemSn(acl.getSystemSn());
				aclDao.insertAcl(al);
			}
		}else {
			//通过用户或角色id和系统标识和模块id删除所在的ACL列表
			ACL dacl = new ACL();
			dacl.setReleaseId(acl.getReleaseId());
			dacl.setSystemSn(acl.getSystemSn());
			dacl.setModuleId(acl.getModuleId());
			aclDao.delAcl(acl);
		}
	}

	@Override
	public void createAllAcl(ACL acl, boolean yes) throws Exception {
		ACL dacl = new ACL();
		dacl.setReleaseId(acl.getReleaseId());
		dacl.setReleaseSn(acl.getReleaseSn());
		dacl.setSystemSn(acl.getSystemSn());
		aclDao.delAcl(acl);
		if(yes) {
			List<Module> modules = moduleDao.getModulesBySystemSn(acl.getSystemSn());
			List<ACL> acls = new ArrayList<ACL>();
			for(Module m : modules) {
				ACL al = new ACL();
				al.setId(UUIDGenerator.generate());
				al.setAclState(m.getState());
				al.setModuleId(m.getId());
				al.setModuleSn(m.getSn());
				al.setReleaseId(acl.getReleaseId());
				al.setReleaseSn(acl.getReleaseSn());
				al.setSystemSn(acl.getSystemSn());
				acls.add(al);
			}
			aclDao.insertAclBatch(acls);
		}
	}

	@Override
	public void createAcl(ACL acl, Integer position,boolean yes) throws Exception {
		//1：通过模块id和用户id得到ACL对象
		List<ACL> acls = aclDao.getAllACL(acl);
		if(CollectionUtils.isNotEmpty(acls)) {
			ACL currAcl = acls.get(0);
			currAcl.setPermission(position, yes);
			if(currAcl.getAclState()==0) {
				aclDao.delAclById(currAcl.getId());
			}else {
				aclDao.updateAcl(currAcl);
			}
		}else {
			acl.setId(UUIDGenerator.generate());
			acl.setPermission(position, yes);
			aclDao.insertAcl(acl);
		}
	}

	@Override
	public List<ACL> getOneAclsByUserId(String userId, String systemSn) throws Exception {
		return aclDao.getAclsByUserId(userId, systemSn);
	}

	@Override
	public List<ACL> getOneAclsByRoleId(String roleId, String systemSn) throws Exception {
		return aclDao.getAclsByRoleId(roleId, systemSn);
	}

	@Override
	public Set<ACL> getAclsByUserId(String userId) throws Exception {
		// 1:得到角色的acl列表
		Set<ACL> acls = new HashSet<ACL>();
		Map<String,ACL> moduleAcls = new HashMap<String,ACL>();
		// 1.1:得到用户的角色列表
		List<Role> roles = roleDao.getRolesByUserId(userId);
		// 1.2:查询角色的acl列表 只有查询权限的
		StringBuffer roleIds = new StringBuffer("");
		if (roles != null && roles.size() > 0) {
			for (Role role : roles) {
				roleIds.append("'");
				roleIds.append(role.getId());
				roleIds.append("'").append(",");
			}
		}
		List<ACL> roleAcls = null;
		if (roleIds.length() > 0) {
			roleIds = roleIds.deleteCharAt(roleIds.length() - 1);
			// 1.3:合并角色的acl列表
			roleAcls = aclDao.getAclsByRoleIds(roleIds.toString());
		}
		
		//合并模块acl列表
		if(CollectionUtils.isNotEmpty(roleAcls)) {
			for(ACL acl : roleAcls) {
				String moduleId = acl.getModuleId();
				if(moduleAcls.containsKey(acl.getModuleId())) {
					ACL mAcl = moduleAcls.get(moduleId);
					mAcl.setAclState(mAcl.getAclState() | acl.getAclState());
					moduleAcls.put(acl.getModuleId(), mAcl);
				}else {
					moduleAcls.put(acl.getModuleId(), acl);
				}
			}
		}
		// 2：得到用户的acl列表 然后合并到角色权限里面去
		List<ACL> userAcls = aclDao.getAclsByUserId(userId);
		if(CollectionUtils.isNotEmpty(userAcls)) {
			for(ACL acl : userAcls) {
				String moduleId = acl.getModuleId();
				if(moduleAcls.containsKey(acl.getModuleId())) {
					ACL mAcl = moduleAcls.get(moduleId);
					mAcl.setAclState(mAcl.getAclState() | acl.getAclState());
					moduleAcls.put(acl.getModuleId(), mAcl);
				}else {
					moduleAcls.put(acl.getModuleId(), acl);
				}
			}
		}
		//转化成set
		if(MapUtils.isNotEmpty(moduleAcls)) {
			for(Map.Entry<String, ACL> entry : moduleAcls.entrySet()) {
				acls.add(entry.getValue());
			}
		}
		return acls;
	}

	@Override
	public boolean hasPermission(String sessionId, String systemSn, String moduleSn, Integer permission) {
		// 1.通过sessionId我们得到存放在redis中的sessionId的值
		CacheEntity ce = CacheListHandler.getCache(sessionId);
		// 2.转化成SessionMap对象
		SessionMap sessionMap = (SessionMap) ce.getCacheContext();
		if (sessionMap == null) {
			return false;
		}
		// 3.从sessionMap对象中得到acl列表字符串
		String aclJson = (String) sessionMap.get(PrivilegeConstant.LOGIN_USER_ACLS);
		Type type = new TypeToken<HashSet<ACL>>() {
		}.getType();
		// 4.转化成Set<ACL>集合
		Set<ACL> acls = JsonUtils.getGson().fromJson(aclJson, type);
		boolean flag = false;
		// 5.判断是否有权限 如果有直接返回true不往下面执行，没有必要循环所有的acl加以判断
		for (ACL acl : acls) {
			if (acl.getSystemSn().equals(systemSn) && acl.getModuleSn().equals(moduleSn)) {
				int yes = acl.getPermission(permission);
				return yes>0;
			}
		}
		return flag;
	}

	@Override
	public void deleteAcl(ACL acl) throws Exception {
		this.aclDao.delAcl(acl);
	}

	@Override
	public void insertAcl(ACL acl) throws Exception {
		acl.setId(UUIDGenerator.generate());
		this.aclDao.insertAcl(acl);
	}
}
