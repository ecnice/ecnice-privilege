package com.ecnice.privilege.service.privilege;

import java.util.List;

import com.ecnice.privilege.common.PagerModel;
import com.ecnice.privilege.common.Query;
import com.ecnice.privilege.model.privilege.Department;

/**
 * @Title:
 * @Description:部门service
 * @Author:Bruce.Liu
 * @Since:2014年3月31日
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
public interface IDepartmentService {
	
	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @Description:通过部门得到部门下面子部门的所有id，最后id以 '1','2'这种形势返回
	 */
	public String getChildrenIdsByPid(String id) throws Exception;

	/**
	 * @param department
	 * @throws Exception
	 * @Description:添加部门
	 */
	public void insertDepartment(Department department) throws Exception;

	/**
	 * @param department
	 * @throws Exception
	 * @Description:更新部门
	 */
	public void updateDepartment(Department department) throws Exception;

	/**
	 * @param id
	 * @throws Exception
	 * @Description:删除部门
	 */
	public void delDepatment(String id) throws Exception;

	/**
	 * 
	 * @param ids
	 * @throws Exception
	 * @Description:批量删除部门
	 */
	public void delDept(String[] ids) throws Exception;

	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @Description:根据id查询部门对象
	 */
	public Department getDepartmentById(String id) throws Exception;

	/**
	 * @param department
	 * @param query
	 * @return
	 * @throws Exception
	 * @Description: 分页查询部门列表
	 */
	public PagerModel<Department> getPagerModel(Department department,
			Query query) throws Exception;

	/**
	 * 
	 * @return
	 * @throws Exception
	 * @Description:获取所有部门
	 */
	public List<Department> getAll() throws Exception;
	
	/**
	 * 
	 * @return
	 * @throws Exception
	 * @Description:获取所有子部门
	 */
	public List<Department> getChildDeptsById(String deptId) throws Exception;
}
