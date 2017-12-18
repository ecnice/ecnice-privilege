package com.ecnice.privilege.service.privilege.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ecnice.privilege.common.PagerModel;
import com.ecnice.privilege.common.Query;
import com.ecnice.privilege.dao.privilege.IDepartmentDao;
import com.ecnice.privilege.model.privilege.Department;
import com.ecnice.privilege.service.privilege.IDepartmentService;
import com.ecnice.tools.common.UUIDGenerator;

/**
 * @Title:
 * @Description:部门service实现类
 * @Author:Bruce.Liu
 * @Since:2014年3月31日
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
@Service
public class DepartmentServiceImpl implements IDepartmentService {
	
	@Resource
	private IDepartmentDao departmentDao;

	@Override
	public String getChildrenIdsByPid(String id) throws Exception {
		//递归得到他下面的子部门的列表
		StringBuffer cids = new StringBuffer("");
		cids.append("'");
		cids.append(id);
		cids.append("'").append(",");
		this.getChildrenIdsByPid(cids, id);
		cids = cids.deleteCharAt(cids.length()-1);
		return cids.toString();
	}
	
	private void getChildrenIdsByPid(StringBuffer cids,String pid) throws Exception {
		List<String> childrenIds = departmentDao.getChildrenIdsByPid(pid);
		if(childrenIds==null || childrenIds.size()==0) {
			return ;
		}
		for(String id:childrenIds) {
			cids.append("'");
			cids.append(id);
			cids.append("'").append(",");
			this.getChildrenIdsByPid(cids,id);
		}
	}

	@Override
	public void insertDepartment(Department department) throws Exception {
		department.setId(UUIDGenerator.generate());
		departmentDao.insertDepartment(department);
	}

	@Override
	public void updateDepartment(Department department) throws Exception {
		departmentDao.updateDepartment(department);
	}

	@Override
	public void delDepatment(String id) throws Exception {
		departmentDao.delDepatment(id);
	}
	
	@Override
	public void delDept(String[] ids) throws Exception {
		for(String id : ids){
			this.departmentDao.delDepatment(id);
		}
	}

	@Override
	public Department getDepartmentById(String id) throws Exception {
		return departmentDao.getDepartmentById(id);
	}

	@Override
	public PagerModel<Department> getPagerModel(Department department,
			Query query) throws Exception {
		return departmentDao.getPagerModel(department, query);
	}
	
	@Override
	public List<Department> getAll() throws Exception {
		return this.departmentDao.getAll(null);
	}
	
	@Override
	public List<Department> getChildDeptsById(String deptId) throws Exception {
		Department department=new Department();
		department.setPid(deptId);
		return this.departmentDao.getAll(department);
	}
}
