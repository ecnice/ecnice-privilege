package com.twodragonlake.privilege.service.privilege;

import java.util.List;

import com.twodragonlake.privilege.common.PagerModel;
import com.twodragonlake.privilege.common.Query;
import com.twodragonlake.privilege.model.privilege.SystemPrivilegeValue;

/**
 * @author martin.wang
 * @date 2014-07-28 11:34:08
 */
public interface ISystemPrivilegeValueService {

	/**
	 */
	public SystemPrivilegeValue getSystemPrivilegeValueById(String id) throws Exception;


	/**
	 */
	public List<SystemPrivilegeValue> getAll(SystemPrivilegeValue systemPrivilegeValue) throws Exception;
	
	public List<SystemPrivilegeValue> getPval(String systemId) throws Exception;

	/**
	 */
	public PagerModel<SystemPrivilegeValue> getPagerModelByQuery(SystemPrivilegeValue systemPrivilegeValue, Query query) throws Exception;

	/**
	 */
	public void insertSystemPrivilegeValue(SystemPrivilegeValue systemPrivilegeValue) throws Exception;

	/**
	 */
	public void delSystemPrivilegeValueById(String... id) throws Exception;
	
	/**
	 */
	public void updateSystemPrivilegeValue(SystemPrivilegeValue systemPrivilegeValue) throws Exception;
}
