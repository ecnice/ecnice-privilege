package com.ecnice.privilege.web.controller.privilege;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecnice.privilege.common.Permission;
import com.ecnice.privilege.constant.PermissionConatant;
import com.ecnice.privilege.model.privilege.Department;
import com.ecnice.privilege.service.privilege.IDepartmentService;
import com.ecnice.privilege.utils.JsonUtils;
import com.ecnice.privilege.vo.SimpleReturnVo;
import com.ecnice.privilege.web.controller.BaseController;

/**
 * 
 * @Description:部门管理
 * @Author:Martin.Wang
 * @Since:2014-4-1
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
@Controller
@RequestMapping("/managment/privilege/dept")
public class DepartmentController extends BaseController{
	private static Logger logger = Logger.getLogger(DepartmentController.class);
	@Resource
	private IDepartmentService departmentService;

	/**
	 * 
	 * @return
	 * @Description:跳转到部门列表页面
	 */
	@RequestMapping("/list")
	@Permission(systemSn="privilege",moduleSn="dept",value=PermissionConatant.R)
	public String list(String sessionId,ModelMap model) {
		model.addAttribute("sessionId", sessionId);
		return "/privilege/dept_page";
	}
	
	/**
	 * 
	 * @return
	 * @Description:部门列表页面数据
	 */
	@ResponseBody
	@RequestMapping("/ajaxlist")
	@Permission(systemSn="privilege",moduleSn="dept",value=PermissionConatant.R)
	public String ajaxlist(){
		List<Department> depts=null;
		try{
			depts=this.departmentService.getAll();
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("DepartmentController-ajaxlist:"+e.getMessage());
		}
		return JsonUtils.toJson(depts);
	}
	
	/**
	 * 
	 * @return
	 * @Description:it部门列表
	 */
	@ResponseBody
	@RequestMapping("/itdept")
	@Permission(systemSn="privilege",moduleSn="dept",value=PermissionConatant.R)
	public String itdept(){
		List<Department> depts=null;
		try{
			depts=this.departmentService.getAll();
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("DepartmentController-ajaxlist:"+e.getMessage());
		}
		return JsonUtils.toJson(depts);
	}
	
	/**
	 * 
	 * @return
	 * @Description:部门列表页面分页数据
	 */
	@ResponseBody
	@RequestMapping("/getAll")
	public String getAll(){
		List<Department> depts=null;
		try{
			depts=this.departmentService.getAll();
			for(Department dep:depts){
				if(StringUtils.isBlank(dep.getPid())) {
					dep.setPid("0");
				}
			}
			Department department=new Department();
			department.setId("0");
			department.setName("电商部门");
			depts.add(department);
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("DepartmentController-ajaxlist:"+e.getMessage());
		}
		return JsonUtils.toJson(depts);
	}
	
	/**
	 * 
	 * @param pid
	 * @param model
	 * @return
	 * @Description:跳转到添加部门页面
	 */
	@RequestMapping("/insertUI")
	@Permission(systemSn="privilege",moduleSn="dept",value=PermissionConatant.C)
	public String insertUI(String pid,String sessionId,ModelMap model){
		model.addAttribute("sessionId", sessionId);
		if(StringUtils.isNotBlank(pid)){
			model.put("pid", pid);
		}
		return "/privilege/dept_insert";
	}
	
	/**
	 * 
	 * @return
	 * @Description:跳转到修改页面
	 */
	@RequestMapping("/updateUI")
	@Permission(systemSn="privilege",moduleSn="dept",value=PermissionConatant.U)
	public String updateUI(String sessionId,ModelMap model){
		model.addAttribute("sessionId", sessionId);
		return "/privilege/dept_update";
	}
	
	/**
	 * 
	 * @param dept
	 * @return
	 * @Description:添加部门信息
	 */
	@ResponseBody
	@RequestMapping("/insert")
	@Permission(systemSn="privilege",moduleSn="dept",value=PermissionConatant.C)
	public String insert(Department dept){
		SimpleReturnVo vo;
		try{
			if(StringUtils.isBlank(dept.getPid())){
				dept.setPid(null);
			}
			this.departmentService.insertDepartment(dept);
			vo=new SimpleReturnVo(this.SUCCESS, "成功");
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("DepartmentController-insert:"+e.getMessage());
			vo=new SimpleReturnVo(this.FAIL, "异常");
		}
		return JsonUtils.toJson(vo);
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 * @Description:根据id获取部门信息
	 */
	@ResponseBody
	@RequestMapping("/ajaxUpdate")
	@Permission(systemSn="privilege",moduleSn="dept",value=PermissionConatant.U)
	public String ajaxUpdate(String id){
		Department dept=null;
		try{
			dept=this.departmentService.getDepartmentById(id);
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("DepartmentController-update:"+e.getMessage());
		}
		return JsonUtils.toJson(dept);
	}
	
	/**
	 * 
	 * @param dept
	 * @return
	 * @Description:修改部门信息
	 */
	@ResponseBody
	@RequestMapping("/update")
	@Permission(systemSn="privilege",moduleSn="dept",value=PermissionConatant.U)
	public String update(Department dept){
		SimpleReturnVo vo;
		try{
			this.departmentService.updateDepartment(dept);
			vo=new SimpleReturnVo(this.SUCCESS, "成功");
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("DepartmentController-update:"+e.getMessage());
			vo=new SimpleReturnVo(this.FAIL, "异常");
		}
		return JsonUtils.toJson(vo);
	}
	
	/**
	 * 
	 * @param ids
	 * @return
	 * @Description:删除部门信息
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@Permission(systemSn="privilege",moduleSn="dept",value=PermissionConatant.D)
	public String delete(String ids){
		SimpleReturnVo vo;
		try{
			if(StringUtils.isNotBlank(ids)){
				String [] id=ids.split(",");
				this.departmentService.delDept(id);
			}
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("DepartmentController-update:"+e.getMessage());
			vo=new SimpleReturnVo(this.FAIL, "异常");
		}
		vo=new SimpleReturnVo(this.SUCCESS, "成功");
		return JsonUtils.toJson(vo);
	}
	
	
}
