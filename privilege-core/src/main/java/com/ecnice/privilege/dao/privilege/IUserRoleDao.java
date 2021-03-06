package com.ecnice.privilege.dao.privilege;

import java.util.List;

import com.ecnice.privilege.model.privilege.Role;
import com.ecnice.privilege.model.privilege.UserRole;

/**
 * @Title:
 * @Description:用户角色Dao接口
 * @Author:Bruce.Liu
 * @Since:2014年4月1日
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
public interface IUserRoleDao {

	/**
	 * @param ur
	 * @throws Exception
	 * @Description:添加用户角色关联
	 */
	public void insertUserRole(UserRole ur) throws Exception;

	/**
	 * @param id
	 * @throws Exception
	 * @Description:删除用户角色管理通过id
	 */
	public void delUserRole(String id) throws Exception;

	/**
	 * @param userId
	 * @throws Exception
	 * @Description:通过用户id删除用户角色
	 */
	public void delUserRoleByUserId(String userId) throws Exception;

	/**
	 * @param roleId
	 * @throws Exception
	 * @Description:通过角色id删除用户角色
	 */
	public void delUserRoleByRoleId(String roleId) throws Exception;

	/**
	 * @param userId
	 * @return
	 * @throws Exception
	 * @Description:通过用户id查询角色列表
	 */
	public List<Role> getRolesByUserId(String userId) throws Exception;
}
