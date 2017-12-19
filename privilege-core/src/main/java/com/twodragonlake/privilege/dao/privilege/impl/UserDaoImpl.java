package com.twodragonlake.privilege.dao.privilege.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.twodragonlake.privilege.common.PagerModel;
import com.twodragonlake.privilege.common.PrivilegeException;
import com.twodragonlake.privilege.common.Query;
import com.twodragonlake.privilege.constant.PrivilegeConstant;
import com.twodragonlake.privilege.dao.MybatisTemplate;
import com.twodragonlake.privilege.dao.privilege.IUserDao;
import com.twodragonlake.privilege.model.privilege.User;
import com.twodragonlake.privilege.vo.privilege.PrivilegeVo;
import com.twodragonlake.tools.common.MD5Util;

@Repository
public class UserDaoImpl extends MybatisTemplate implements IUserDao {

	@Override
	public List<User> getSystemUsersBySystemSn(String systemSn) {
		return (List<User>) selectList("UserXML.getSystemUsersBySystemSn", systemSn);
	}
	
	public static void main(String[] args) {
		System.out.println(MD5Util.getMD5String("iceasy2014888888"));
	}

	@Override
	public User login(String username, String password) throws Exception{
		password = MD5Util.getMD5String(PrivilegeConstant.USER_PASSWORD_FRONT+password);
		Map<String,String> params = new HashMap<String, String>();
		params.put("username", username);
		params.put("password", password);
		return (User) selectOne("UserXML.login", params);
	}

	@Override
	public void insertUser(User user) throws Exception {
		String password = MD5Util.getMD5String(PrivilegeConstant.USER_PASSWORD_FRONT+user.getPassword());
		user.setPassword(password);
		this.insert("UserXML.insertUser",user);
	}

	@Override
	public void updateUser(User user) throws Exception {
		this.update("UserXML.updateUser", user);
	}

	@Override
	public void delUser(String id) throws Exception {
		this.delete("UserXML.delUser", id);
	}

	@Override
	public User getUserById(String id) throws Exception {
		return (User) this.selectOne("UserXML.getUserById", id);
	}
	@Override
	public User getUserByUserName(String userName) throws Exception {
		return (User) this.selectOne("UserXML.getUserByUserName", userName);
	}
	@Override
	public PagerModel<User> getPagerModel(User user, Query query)
			throws Exception {
		return this.getPagerModelByQuery(user, query, "UserXML.PagerModel");
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAll(User user) throws Exception {
		return (List<User>)this.selectList("UserXML.getAll", user);
	}
	
	@Override
	public List<User> getUserByRoleSn(String roleSn) throws Exception {
		return (List<User>)this.selectList("UserXML.getUserByRoleSn", roleSn);
	}

	@Override
	public List<User> getUsersByPrivilegeVo(PrivilegeVo vo) throws Exception {
		return (List<User>)this.selectList("UserXML.getUsersByPrivilegeVo", vo);
	}

	@Override
	public List<User> getUserByDeptIdAndRoleSn(String deptId, String roleSn)
			throws PrivilegeException {
		Map<String,String> params = new HashMap<String, String>();
		params.put("deptId", deptId);
		params.put("roleSn", roleSn);
		return (List<User>)this.selectList("UserXML.getUserByDeptIdAndRoleSn", params);
	}
	
	@Override
	public List<User> getUserByRoleSns(String... roleSns)
			throws PrivilegeException {
		Map<String,Object> map = new HashMap<String, Object>();
		ArrayList<String> list=new ArrayList<String>();
		for(String roleSn : roleSns){
			list.add(roleSn);
		}
		map.put("list", list);
		return (List<User>)this.selectList("UserXML.getUserByRoleSns", map);
	}
	
	@Override
	public List<User> getUserByRoleSns(User user,String... roleSns)
			throws PrivilegeException {
		Map<String,Object> map = new HashMap<String, Object>();
		ArrayList<String> list=new ArrayList<String>();
		for(String roleSn : roleSns){
			list.add(roleSn);
		}
		map.put("list", list);
		map.put("user", user);
		return (List<User>)this.selectList("UserXML.getUserByRoleSnsByUser", map);
	}
	
	@Override
	public List<User> getUsersByDeptId(String deptId) throws Exception {
		return (List<User>)this.selectList("UserXML.getUsersByDeptId", deptId);
	}
}
