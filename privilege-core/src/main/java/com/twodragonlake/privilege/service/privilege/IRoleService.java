package com.twodragonlake.privilege.service.privilege;

import java.util.List;

import com.twodragonlake.privilege.common.PagerModel;
import com.twodragonlake.privilege.common.Query;
import com.twodragonlake.privilege.model.privilege.Role;

/**
 * @Title:
 * @Description:角色service
 * @Author:Bruce.Liu
 * @Since:2014年3月31日
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
public interface IRoleService {
	/**
	 * @param userId
	 * @return
	 * @throws Exception
	 * @Description:通过用户id得到这个用户的角色列表
	 */
	public List<Role> getRolesByUserId(String userId) throws Exception;
	/**
	 * @param Role
	 * @throws Exception
	 * @Description:添加角色
	 */
	public void insertRole(Role role) throws Exception;

	/**
	 * @param Role
	 * @throws Exception
	 * @Description:更新角色
	 */
	public void updateRole(Role role) throws Exception;

	/**
	 * @param id
	 * @throws Exception
	 * @Description:删除角色
	 */
	public void delRole(String id) throws Exception;

	/**
	 * 
	 * @param ids
	 * @throws Exception
	 * @Description:批量删除角色
	 */
	public void delRoles(String[] ids) throws Exception;

	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @Description:根据id查询角色对象
	 */
	public Role getRoleById(String id) throws Exception;

	/**
	 * @param Role
	 * @param query
	 * @return
	 * @throws Exception
	 * @Description: 分页查询角色列表
	 */
	public PagerModel<Role> getPagerModel(Role role, Query query)
			throws Exception;
	
	/**
	 * 
	 * @param role
	 * @return
	 * @throws Exception
	 * @Description:获取所有角色列表
	 */
	public List<Role> getAll(Role role) throws Exception;
}
