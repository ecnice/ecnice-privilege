package com.twodragonlake.privilege.service.privilege;

import java.util.List;

import com.twodragonlake.privilege.common.PagerModel;
import com.twodragonlake.privilege.common.PrivilegeException;
import com.twodragonlake.privilege.common.Query;
import com.twodragonlake.privilege.model.privilege.User;
import com.twodragonlake.privilege.vo.privilege.LoginVo;
import com.twodragonlake.privilege.vo.privilege.PrivilegeVo;

/**
 * @Title:
 * @Description:用户service
 * @Author:Bruce.Liu
 * @Since:2014年3月31日
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
public interface IUserService {
	
	/**
	 * 通过系统标识得到系统下面的所有的人
	 * @param systemSn 系统标识
	 * @return
	 */
	public List<User> getSystemUsersBySystemSn(String systemSn) ;

	/**
	 * 登录接口
	 * @param username 用户名
	 * @param password 密码
浙江蘑菇加电子商务有限公司Id
	 * @param ip ip
	 * @param systemSn 系统标示
	 * @return
	 * @throws Exception
	 */
	public LoginVo login(String username, String password, String companyId,
			String ip,String systemSn) throws Exception;

	/**
	 * 通过角色标示和部门id得到用户列表
	 * 
	 * @param deptId
	 * @param roleSn
	 * @return
	 */
	List<User> getUserByDeptIdAndRoleSn(String deptId, String roleSn)
			throws PrivilegeException;

	/**
	 * 通过Vo查询用户列表
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<User> getUsersByPrivilegeVo(PrivilegeVo vo) throws Exception;

	/**
	 * @param username
	 * @param password
	 * @return
	 * @throws Exception
	 * @Description:用户登录
	 */
	public User login(String username, String password) throws Exception;

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
	public void delUser(String ids) throws Exception;

	/**
	 * 
	 * @param id
	 * @throws Exception
	 * @Description:批量删除用户
	 */
	public void delUsers(String[] id) throws Exception;

	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @Description:根据id查询用户对象
	 */
	public User getUserById(String id) throws Exception;
	
	/**
	 * 
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
	 * 
	 * @param user
	 * @throws Exception
	 * @Description:修改用户信息
	 */
	public void singleUpdateUser(User user) throws Exception;

	/**
	 * 
	 * @param roleSn
	 * @return
	 * @throws Exception
	 * @Description:根据角色标识获取用户列表
	 */
	public List<User> getUserByRoleSn(String roleSn) throws Exception;

	/**
	 * @Description:通过角色标识获取用户列表
	 * @param roleSns
	 *            可传入多个标识
	 * @return
	 * @throws PrivilegeException
	 */
	public List<User> getUserByRoleSns(String... roleSns) throws Exception;
	
	/**
	 * @Description:通过角色标识获取用户列表
	 * @param roleSns
	 *            可传入多个标识
	 * @return
	 * @throws PrivilegeException
	 */
	public List<User> getUserByRoleSns(User user,String... roleSns) throws Exception;

	/**
	 * 
	 * @Description:根据部门id获取该部门下得用户
	 * @param deptId
	 * @return
	 * @throws Exception
	 */
	public List<User> getUsersByDeptId(String deptId) throws Exception;
}
