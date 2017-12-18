package com.ecnice.privilege.web.controller.privilege;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecnice.privilege.common.PagerModel;
import com.ecnice.privilege.common.Permission;
import com.ecnice.privilege.common.Query;
import com.ecnice.privilege.constant.PermissionConatant;
import com.ecnice.privilege.constant.PrivilegeConstant;
import com.ecnice.privilege.model.privilege.ICSystem;
import com.ecnice.privilege.model.privilege.Role;
import com.ecnice.privilege.service.privilege.IRoleService;
import com.ecnice.privilege.service.privilege.IUserRoleService;
import com.ecnice.privilege.utils.JsonUtils;
import com.ecnice.privilege.vo.SimpleReturnVo;
import com.ecnice.privilege.web.controller.BaseController;

/**
 * 
 * @Description:角色管理
 * @Author:Martin.Wang
 * @Since:2014-4-1
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
@Controller
@RequestMapping("/managment/privilege/role")
public class RoleController extends BaseController {
	private static Logger logger = Logger.getLogger(RoleController.class);
	@Resource
	private IRoleService roleService;
	@Resource
	private IUserRoleService userRoleService;
	
	/**
	 * 
	 * @return
	 * @Description:跳转到角色列表页面
	 */
	@RequestMapping("/list")
	@Permission(systemSn="privilege",moduleSn="role",value=PermissionConatant.R)
	public String list(String sessionId,ModelMap model) {
		model.addAttribute("sessionId", sessionId);
		return "/privilege/role_page";
	}

	/**
	 * 
	 * @param role
	 * @param query
	 * @return
	 * @Description:角色列表分页数据
	 */
	@ResponseBody
	@RequestMapping("/ajaxlist")
	@Permission(systemSn="privilege",moduleSn="role",value=PermissionConatant.R)
	public String ajaxlist(Role role, Query query) {
		PagerModel<Role> roles = null;
		try {
			roles = this.roleService.getPagerModel(role, query);
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("RoleController-ajaxlist:" + e.getMessage());
		}
		return JsonUtils.getPmJson(roles);
	}

	/**
	 * 
	 * @param role
	 * @param userId
	 * @param query
	 * @return
	 * @Description:用户分配角色列表
	 */
	@ResponseBody
	@RequestMapping("/getRoleByUserId")
	@Permission(systemSn="privilege",moduleSn="role",value=PermissionConatant.R)
	public String getRoleByUserId(Role role, String userId, Query query) {
		PagerModel<Role> roles = null;
		try {
			List<Role> userRoles = this.userRoleService
					.getRolesByUserId(userId);
			roles = this.roleService.getPagerModel(role, query);
			if (roles != null) {
				List<Role> allRoles = roles.getDatas();
				if (allRoles != null && allRoles.size() > 0) {
					if (userRoles != null && userRoles.size() > 0) {
						for (Role ur : userRoles) {
							for (Role r : allRoles) {
								if (ur.getId().equals(r.getId())) {
									r.setStatus(1);
									break;
								}
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("RoleController-ajaxlist:" + e.getMessage());
		}
		return JsonUtils.getPmJson(roles);
	}

	/**
	 * 
	 * @return
	 * @Description:跳转到添加角色页面
	 */
	@RequestMapping("/insertUI")
	@Permission(systemSn="privilege",moduleSn="role",value=PermissionConatant.C)
	public String insertUI(String sessionId,ModelMap model) {
		model.addAttribute("sessionId", sessionId);
		return "/privilege/role_insert";
	}

	/**
	 * 
	 * @return
	 * @Description:跳转到更新角色页面
	 */
	@RequestMapping("/updateUI")
	@Permission(systemSn="privilege",moduleSn="role",value=PermissionConatant.U)
	public String updateUI(String sessionId,ModelMap model) {
		model.addAttribute("sessionId", sessionId);
		return "/privilege/role_update";
	}
	
	/**
	 * 
	 * @param role
	 * @return
	 * @Description:添加角色信息
	 */
	@ResponseBody
	@RequestMapping("/insert")
	@Permission(systemSn="privilege",moduleSn="role",value=PermissionConatant.C)
	public String insert(Role role) {
		SimpleReturnVo vo;
		try {
			this.roleService.insertRole(role);
			vo = new SimpleReturnVo(this.SUCCESS, "成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("RoleController-insert:" + e.getMessage());
			vo = new SimpleReturnVo(this.FAIL, "异常");
		}
		return JsonUtils.toJson(vo);
	}

	/**
	 * 
	 * @param id
	 * @return
	 * @Description:根据id获取角色信息
	 */
	@ResponseBody
	@RequestMapping("/ajaxUpdate")
	@Permission(systemSn="privilege",moduleSn="role",value=PermissionConatant.U)
	public String ajaxUpdate(String id) {
		Role role = null;
		try {
			role = this.roleService.getRoleById(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("RoleController-ajaxUpdate:" + e.getMessage());
		}
		return JsonUtils.toJson(role);
	}

	/**
	 * 
	 * @param role
	 * @return
	 * @Description:更新角色信息
	 */
	@ResponseBody
	@RequestMapping("/update")
	@Permission(systemSn="privilege",moduleSn="role",value=PermissionConatant.U)
	public String update(Role role) {
		SimpleReturnVo vo;
		try {
			this.roleService.updateRole(role);
			vo = new SimpleReturnVo(this.SUCCESS, "成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("RoleController-update:" + e.getMessage());
			vo = new SimpleReturnVo(this.FAIL, "异常");
		}
		return JsonUtils.toJson(vo);
	}

	/**
	 * 
	 * @param ids id,id,id
	 * @return
	 * @Description:删除角色信息
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@Permission(systemSn="privilege",moduleSn="role",value=PermissionConatant.D)
	public String delete(String ids) {
		SimpleReturnVo vo;
		try {
			if (StringUtils.isNotBlank(ids)) {
				String[] id = ids.split(",");
				this.roleService.delRoles(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("RoleController-delete:" + e.getMessage());
			vo = new SimpleReturnVo(this.FAIL, "异常");
		}
		vo = new SimpleReturnVo(this.SUCCESS, "成功");
		return JsonUtils.toJson(vo);
	}

	/**
	 * 
	 * @param role
	 * @return
	 * @Description:检测角色标识的唯一性
	 */
	@ResponseBody
	@RequestMapping("/checkSnExsits")
	public String checkSnExsits(Role role) {
		Role r=new Role();
		r.setSn(role.getSn());
		try {
			List<Role> list=this.roleService.getAll(r);
			if(StringUtils.isNotBlank(role.getId())){//更新的时候
				Role ro=this.roleService.getRoleById(role.getId());
				if(ro.getSn().equals(role.getSn())){
					return "0";
				}else{
					if(list!=null && list.size()>0){
						return "1";
					}
				}
			}else{//新增的时候
				if(list!=null && list.size()>0){
					return "1";
				}
			}
		} catch (Exception e) {
			logger.debug("RoleController-checkSnExsits:" + e.getMessage());
			e.printStackTrace();
		}
		return "0";
	}
}
