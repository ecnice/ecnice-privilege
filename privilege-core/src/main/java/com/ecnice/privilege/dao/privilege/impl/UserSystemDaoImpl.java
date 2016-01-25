package com.ecnice.privilege.dao.privilege.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ecnice.privilege.common.PagerModel;
import com.ecnice.privilege.common.Query;
import com.ecnice.privilege.dao.MybatisTemplate;
import com.ecnice.privilege.dao.privilege.IUserSystemDao;
import com.ecnice.privilege.model.privilege.UserSystem;

/**
 * 
 * @Title:
 * @Description:角色Dao实现类
 * @Author:Bruce.Liu
 * @Since:2014年3月31日
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
@Repository
public class UserSystemDaoImpl extends MybatisTemplate implements
		IUserSystemDao {

	@Override
	public void insertUserSystem(UserSystem userSystem) throws Exception {
		this.insert("UserSystemXML.insertUserSystem", userSystem);
	}

	@Override
	public void updateUserSystem(UserSystem userSystem) throws Exception {
		this.update("UserSystemXML.updateUserSystem", userSystem);
	}

	@Override
	public void delUserSystem(String id) throws Exception {
		this.delete("UserSystemXML.delUserSystem", id);
	}

	@Override
	public void delByUserId(String userId) throws Exception {
		this.delete("UserSystemXML.delByUserId", userId);
	}

	@Override
	public UserSystem getUserSystemById(String id) throws Exception {
		return (UserSystem) this.selectOne("UserSystemXML.getUserSystemById",
				id);
	}

	@Override
	public PagerModel<UserSystem> getPagerModel(UserSystem userSystem,
			Query query) throws Exception {
		return this.getPagerModelByQuery(userSystem, query,
				"UserSystemXML.getPagerModel");
	}

	@Override
	public List<UserSystem> getAll(UserSystem userSystem) throws Exception {
		return (List<UserSystem>) this.selectList("UserSystemXML.getAll",
				userSystem);
	}
}
