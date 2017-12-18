package com.ecnice.privilege.api.privilege;

import java.util.List;

import com.ecnice.privilege.common.PrivilegeException;
import com.ecnice.privilege.model.privilege.Role;
import com.ecnice.privilege.model.privilege.User;
import com.ecnice.privilege.model.system.SystemConfig;
import com.ecnice.privilege.vo.ReturnVo;
import com.ecnice.privilege.vo.privilege.HasPermissionVo;
import com.ecnice.privilege.vo.privilege.LoginVo;
import com.ecnice.privilege.vo.privilege.UserAcls;

/**
 * 权限系统提供对外接口
 * 
 * @Author:Bruce.Liu
 * @Since:2014年4月16日
 */
public interface IPrivilegeApi {
	
	/**
	 * 通过key得到SystemConfig
	 * @param key
	 * @return
	 * @throws PrivilegeException
	 */
	public SystemConfig findSystemConfigByKey(String key)
			throws PrivilegeException;

	/**
	 * 登录接口
	 * 
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 * @param companyId 公司Id
	 * @param ip
	 *            ip
	 * @param systemSn
	 *            系统标示
	 * @return
	 * @throws PrivilegeException
	 */
	public LoginVo login(String username, String password, String companyId,
			String ip, String systemSn) throws PrivilegeException;

	/**
	 * 通过用户id得到角色列表
	 * 
	 * @param userId
	 * @return
	 * @throws PrivilegeException
	 */
	public List<Role> getRolesByUserId(String userId) throws PrivilegeException;

	/**
	 * 通过角色标示得到用户列表
	 * 
	 * @param roleSns
	 * @return
	 */
	List<User> getUserByRoleSns(String... roleSns) throws PrivilegeException;

	/**
	 * 判断是否有该模块的权限 ReturnVo.status:@see PrivilegeConstant.SUCCESS_CODE 成功/PrivilegeConstant.ERROR_CODE 失败/PrivilegeConstant.EXCEPTION_CODE 异常
	 * 
	 * @param sessionId
	 *            sessionId
	 * @param systemSn
	 *            系统标示
	 * @param moduleSn
	 *            模块标示
	 * @param permission
	 *            权限值
	 * @return
	 */
	public ReturnVo<HasPermissionVo> hasPermission(String sessionId, String systemSn,
			String moduleSn, Integer permission);

	/**
	 * 通过sessionId得到sessinMap
	 * 
	 * @param sessionId
	 * @return UserAcls
	 */
	public UserAcls getUserAclsBySessionId(String sessionId);
}
