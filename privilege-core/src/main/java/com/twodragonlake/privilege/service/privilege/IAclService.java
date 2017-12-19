package com.twodragonlake.privilege.service.privilege;

import java.util.List;
import java.util.Set;

import com.twodragonlake.privilege.model.privilege.ACL;

/**
 * @Title:
 * @Description:访问控制service
 * @Author:Bruce.Liu
 * @Since:2014年4月1日
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
public interface IAclService {
	
	/**
	 * 模块前面的全选和取消
	 * @param acl
	 * @param yes
	 * @throws Exception
	 */
	public void createAclByModule(ACL acl, boolean yes) throws Exception ;
	/**
	 * 全选和全部取消
	 * @param acl
	 * @param yes
	 * @throws Exception
	 */
	public void createAllAcl(ACL acl,boolean yes) throws Exception;
	/**
	 * 设置ACL的值
	 * @param acl acl
	 * @param position 多少位
	 * @param yes 是否选中
	 * @throws Exception
	 */
	public void createAcl(ACL acl,Integer position,boolean yes) throws Exception;
	
	/**
	 * @param userId
	 * @return
	 * @throws Exception
	 * @Description:通过用户得到他的acl列表 只是用户方的acl列表
	 */
	public List<ACL> getOneAclsByUserId(String userId,String systemSn) throws Exception;

	/**
	 * @param roleId
	 * @return
	 * @throws Exception
	 * @Description:通过角色id得到她的acl列表 只是角色方的acl列表
	 */
	public List<ACL> getOneAclsByRoleId(String roleId,String systemSn) throws Exception;

	/**
	 * @param sessionId
	 * @param moduleSn
	 * @param permission
	 * @return
	 * @Description:判断是否有该模块的权限
	 */
	public boolean hasPermission(String sessionId, String systemSn,
			String moduleSn, Integer permission);

	/**
	 * 
	 * @param acl
	 * @throws Exception
	 * @Description:添加acl
	 */
	public void insertAcl(ACL acl) throws Exception;

	/**
	 * 
	 * @param acl
	 *            删除条件
	 * @throws Exception
	 * @Description:删除acl
	 */
	public void deleteAcl(ACL acl) throws Exception;

	/**
	 * @param userId
	 * @return
	 * @throws Exception
	 * @Description:通过用户id得到用户所有访问控制列表 包括他的角色的acl列表合并
	 */
	public Set<ACL> getAclsByUserId(String userId) throws Exception;
	
	
}
