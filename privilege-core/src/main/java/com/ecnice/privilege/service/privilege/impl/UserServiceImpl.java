package com.ecnice.privilege.service.privilege.impl;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.ecnice.privilege.cache.CacheEntity;
import com.ecnice.privilege.cache.CacheListHandler;
import com.ecnice.privilege.common.PagerModel;
import com.ecnice.privilege.common.PrivilegeException;
import com.ecnice.privilege.common.Query;
import com.ecnice.privilege.common.SessionMap;
import com.ecnice.privilege.constant.PrivilegeConstant;
import com.ecnice.privilege.dao.privilege.IAclDao;
import com.ecnice.privilege.dao.privilege.IDepartmentDao;
import com.ecnice.privilege.dao.privilege.IICSystemDao;
import com.ecnice.privilege.dao.privilege.IUserDao;
import com.ecnice.privilege.dao.privilege.IUserRoleDao;
import com.ecnice.privilege.dao.privilege.IUserSystemDao;
import com.ecnice.privilege.model.privilege.ACL;
import com.ecnice.privilege.model.privilege.Department;
import com.ecnice.privilege.model.privilege.ICSystem;
import com.ecnice.privilege.model.privilege.Module;
import com.ecnice.privilege.model.privilege.Role;
import com.ecnice.privilege.model.privilege.User;
import com.ecnice.privilege.model.privilege.UserSystem;
import com.ecnice.privilege.model.system.LoginLog;
import com.ecnice.privilege.service.privilege.IAclService;
import com.ecnice.privilege.service.privilege.IModuleService;
import com.ecnice.privilege.service.privilege.IUserService;
import com.ecnice.privilege.service.system.ILoginLogService;
import com.ecnice.privilege.utils.JsonUtils;
import com.ecnice.privilege.vo.privilege.LoginVo;
import com.ecnice.privilege.vo.privilege.PrivilegeVo;
import com.mhome.tools.common.UUIDGenerator;

/**
 * @Description:用户service实现类
 * @Author:Bruce.Liu
 * @Since:2014年3月31日
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
@Service
public class UserServiceImpl implements IUserService {

	@Resource
	private IUserDao userDao;
	@Resource
	private IUserSystemDao userSystemDao;
	@Resource
	private IUserRoleDao userRoleDao;
	@Resource
	private IAclService aclService;
	@Resource
	private IAclDao aclDao;
	@Resource
	private ILoginLogService loginLogService;
	@Resource
	private IModuleService moduleService;
	@Resource
	private IICSystemDao icSystemDao;
	@Resource
	private IDepartmentDao departmentDao;

	/**
	 * 通过系统标识得到系统下面的所有的人
	 * 
	 * @param systemSn
	 *            系统标识
	 * @return
	 */
	public List<User> getSystemUsersBySystemSn(String systemSn) {
		return userDao.getSystemUsersBySystemSn(systemSn);
	}

	@Override
	public List<User> getUserByDeptIdAndRoleSn(String deptId, String roleSn) throws PrivilegeException {
		return userDao.getUserByDeptIdAndRoleSn(deptId, roleSn);
	}

	@Override
	public User login(String username, String password) throws Exception {
		return userDao.login(username, password);
	}

	@Override
	public void insertUser(User user) throws Exception {
		user.setId(UUIDGenerator.generate());
		user.setPassword("888888");
		userDao.insertUser(user);
		String systemIds = user.getSystemIds();
		if (StringUtils.isNotBlank(systemIds)) {
			String[] syses = systemIds.split(",");
			for (String sys : syses) {
				UserSystem userSystem = new UserSystem();
				userSystem.setSystemId(sys);
				userSystem.setId(UUIDGenerator.generate());
				userSystem.setUserId(user.getId());
				this.userSystemDao.insertUserSystem(userSystem);
			}
		}
	}

	@Override
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
		this.userSystemDao.delByUserId(user.getId());
		String systemIds = user.getSystemIds();
		if (StringUtils.isNotBlank(systemIds)) {
			String[] syses = systemIds.split(",");
			for (String sys : syses) {
				UserSystem userSystem = new UserSystem();
				userSystem.setSystemId(sys);
				userSystem.setId(UUIDGenerator.generate());
				userSystem.setUserId(user.getId());
				this.userSystemDao.insertUserSystem(userSystem);
			}
		}
	}

	@Override
	public void delUser(String id) throws Exception {
		userDao.delUser(id);
		this.userRoleDao.delUserRoleByUserId(id);
		this.userSystemDao.delByUserId(id);
		this.userRoleDao.delUserRoleByUserId(id);
		ACL acl = new ACL();
		acl.setReleaseId(id);
		acl.setReleaseSn(ACL.USER);
		aclDao.delAcl(acl);
	}

	@Override
	public void delUsers(String[] ids) throws Exception {
		for (String id : ids) {
			this.delUser(id);
		}
	}

	@Override
	public User getUserById(String id) throws Exception {
		UserSystem userSystem = new UserSystem();
		userSystem.setUserId(id);
		List<UserSystem> list = this.userSystemDao.getAll(userSystem);
		StringBuffer systemIds = new StringBuffer("");
		if (list != null && list.size() > 0) {
			for (int i = 0, len = list.size(); i < len; i++) {
				if (i != 0) {
					systemIds.append(",");
				}
				systemIds.append(list.get(i).getSystemId());
			}
		}
		User user = userDao.getUserById(id);
		if (user != null && systemIds.length() > 0) {
			user.setSystemIds(systemIds.toString());
			Department department = this.departmentDao.getDepartmentById(user.getDepartmentId());
			if (department != null) {
				user.setDeptName(department.getName());
			}
		}
		return user;
	}

	@Override
	public User getUserByUserName(String userName) throws Exception {
		User user = this.userDao.getUserByUserName(userName);
		if (user != null) {
			Department department = this.departmentDao.getDepartmentById(user.getDepartmentId());
			if (department != null) {
				user.setDeptName(department.getName());
			}
		}
		return user;
	}

	@Override
	public PagerModel<User> getPagerModel(User user, Query query) throws Exception {
		PagerModel<User> pm = userDao.getPagerModel(user, query);
		for (User ur : pm.getDatas()) {
			List<Role> list = this.userRoleDao.getRolesByUserId(ur.getId());
			if (list != null && list.size() > 0) {
				StringBuffer s = new StringBuffer();
				for (int i = 0, len = list.size(); i < len; i++) {
					if (i != 0) {
						s.append(",");
					}
					s.append(list.get(i).getName());
				}
				ur.setRoles(s.toString());
			}
		}
		return pm;
	}

	@Override
	public List<User> getAll(User user) throws Exception {
		return this.userDao.getAll(user);

	}

	@Override
	public void singleUpdateUser(User user) throws Exception {
		this.userDao.updateUser(user);
	}

	@Override
	public List<User> getUserByRoleSn(String roleSn) throws Exception {
		return this.userDao.getUserByRoleSn(roleSn);
	}

	@Override
	public List<User> getUsersByPrivilegeVo(PrivilegeVo vo) throws Exception {
		return userDao.getUsersByPrivilegeVo(vo);
	}

	@Override
	public List<User> getUserByRoleSns(String... roleSns) throws Exception {
		return this.userDao.getUserByRoleSns(roleSns);
	}

	@Override
	public List<User> getUserByRoleSns(User user, String... roleSns) throws Exception {
		return this.userDao.getUserByRoleSns(user, roleSns);
	}

	@Override
	public List<User> getUsersByDeptId(String deptId) throws Exception {
		return this.userDao.getUsersByDeptId(deptId);
	}

	// 对外提供的登录接口 这个方法暂时不用
	public LoginVo login(String username, String password, String companyId, String ip, String systemSn)
			throws Exception {
		LoginVo vo = new LoginVo();
		SessionMap sessionMap = new SessionMap();
		// 1:查询到用户对象
		User user = login(username, password);
		if (user != null) {
			vo.setLoginUser(user);
			vo.setSid(user.getId());
			sessionMap.put(PrivilegeConstant.LOGIN_USER, JsonUtils.toJson(user));
			Set<ACL> acls = (Set<ACL>) aclService.getAclsByUserId(user.getId());
			sessionMap.put(PrivilegeConstant.LOGIN_USER_ACLS, JsonUtils.toJson(acls));
			ICSystem icSystem = icSystemDao.getICSystemBySn(systemSn);
			if (icSystem != null) {
				List<Module> modules = moduleService.getTreeModuleBySystemIdAndAcls(acls, icSystem.getId());
				vo.setModules(modules);
			} else {
				throw new PrivilegeException("系统标示找不到");
			}
			// 插入登录日志
			LoginLog loginLog = new LoginLog(ip, user.getId(), user.getUsername(), user.getRealName(), "登录");
			loginLogService.insertLoginLog(loginLog);

			CacheEntity ce = new CacheEntity(user.getId(), sessionMap, PrivilegeConstant.SESSION_OUT_TIME);
			CacheListHandler.addCache(user.getId(), ce);
			// redisClientTemplate.setex(user.getId(),
			// PrivilegeConstant.SESSION_OUT_TIME,
			// JsonUtils.toJson(sessionMap));
		}
		return vo;
	}
}
