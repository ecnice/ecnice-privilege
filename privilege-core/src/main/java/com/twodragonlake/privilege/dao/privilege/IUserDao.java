package com.twodragonlake.privilege.dao.privilege;

import java.util.List;

import com.twodragonlake.privilege.common.PagerModel;
import com.twodragonlake.privilege.common.PrivilegeException;
import com.twodragonlake.privilege.common.Query;
import com.twodragonlake.privilege.model.privilege.User;
import com.twodragonlake.privilege.vo.privilege.PrivilegeVo;

/**
 * @Title:
 * @Description:用户Dao
 * @Author:Bruce.Liu
 * @Since:2014年3月31日
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
public interface IUserDao {
	
	/**
	 * 通过系统标识得到系统下面的所有的人
	 * @param systemSn 系统标识
	 * @return
	 */
	public List<User> getSystemUsersBySystemSn(String systemSn) ;

	/**
	 * @param User
	 * @throws Exception
	 * @Description:添加用户
	 */
	public void insertUser(User user) throws Exception;

	/**
	 * @param User
	 * @throws Exception
	 * @Description:更新用户
	 */
	public void updateUser(User user) throws Exception;

	/**
	 * @param id
	 * @throws Exception
	 * @Description:删除用户
	 */
	public void delUser(String id) throws Exception;

	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @Description:根据id查询用户对象
	 */
	public User getUserById(String id) throws Exception;
	
	/**
	 * 根据用户名查用户
	 * @param userName
	 * @return
	 * @throws Exception
	 */
	public User getUserByUserName(String userName) throws Exception;

	/**
	 * @param User
	 * @param query
	 * @return
	 * @throws Exception
	 * @Description: 分页查询用户列表
	 */
	public PagerModel<User> getPagerModel(User user, Query query)
			throws Exception;

	/**
	 * 
	 * @param user
	 * @return
	 * @throws Exception
	 * @Description:获取所有用户列表
	 */
	public List<User> getAll(User user) throws Exception;

	/**
	 * @param username
	 * @param password
	 * @return
	 * @Description:用户登录
	 */
	public User login(String username, String password) throws Exception;

	/**
	 * 
	 * @param roleSn
	 * @return
	 * @throws Exception
	 * @Description:根据角色标识获取用户列表
	 */
	public List<User> getUserByRoleSn(String roleSn) throws Exception;

	/**
	 * 通过Vo查询用户列表
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<User> getUsersByPrivilegeVo(PrivilegeVo vo) throws Exception;
	/**
	 * 通过角色标示和部门id得到用户列表
	 * 
	 * @param deptId
	 * @param roleSn
	 * @return
	 */
	public List<User> getUserByDeptIdAndRoleSn(String deptId, String roleSn)throws PrivilegeException;
	
	/**
	 * @Description:通过角色标识获取用户列表
	 * @param roleSns 可传入多个标识
	 * @return
	 * @throws PrivilegeException
	 */
	public List<User> getUserByRoleSns(String... roleSns)throws PrivilegeException;
	
	/**
	 * @Description:通过角色标识获取用户列表
	 * @param roleSns 可传入多个标识
	 * @return
	 * @throws PrivilegeException
	 */
	public List<User> getUserByRoleSns(User user,String... roleSns)throws PrivilegeException;
	
	/**
	 * 
	 * @Description:根据部门id获取该部门下得用户
	 * @param deptId
	 * @return
	 * @throws Exception
	 */
	public List<User> getUsersByDeptId(String deptId)throws Exception;
}
