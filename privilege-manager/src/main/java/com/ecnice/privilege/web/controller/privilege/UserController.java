package com.ecnice.privilege.web.controller.privilege;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
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
import com.ecnice.privilege.dao.privilege.IUserSystemDao;
import com.ecnice.privilege.model.privilege.ICSystem;
import com.ecnice.privilege.model.privilege.Role;
import com.ecnice.privilege.model.privilege.User;
import com.ecnice.privilege.model.privilege.UserSystem;
import com.ecnice.privilege.service.privilege.IDepartmentService;
import com.ecnice.privilege.service.privilege.IICSystemService;
import com.ecnice.privilege.service.privilege.IRoleService;
import com.ecnice.privilege.service.privilege.IUserRoleService;
import com.ecnice.privilege.service.privilege.IUserService;
import com.ecnice.privilege.utils.JsonUtils;
import com.ecnice.privilege.utils.WebUtils;
import com.ecnice.privilege.vo.SimpleReturnVo;
import com.ecnice.privilege.web.controller.BaseController;
import com.ecnice.tools.common.MD5Util;

/**
 * 
 * @Description:用户控制器
 * @Author:Martin.Wang
 * @Since:2014-4-2
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
@Controller
@RequestMapping("/managment/privilege/user")
public class UserController extends BaseController{
	private static Logger logger = Logger.getLogger(UserController.class);
	@Resource
	private IUserService userService;
	@Resource
	private IICSystemService iICSystemService;
	@Resource
	private IUserRoleService userRoleService;
	@Resource
	private IDepartmentService departmentService;
	@Resource
	private IUserSystemDao userSystemDao;
	@Resource
	private IRoleService roleService;
	
	/**
	 * 
	 * @param oldpwd
	 * @param newpwd
	 * @param request
	 * @return
	 * @Description:重置密码
	 */
	@ResponseBody
	@RequestMapping("/rePassword")
	public String rePassword(String oldpwd,String newpwd,HttpServletRequest request) {
		SimpleReturnVo vo;
		User user = WebUtils.getLoginUser(request);
		String password = MD5Util.getMD5String(PrivilegeConstant.USER_PASSWORD_FRONT+oldpwd);
		if(!password.equals(user.getPassword())){
			vo=new SimpleReturnVo(this.FAIL, "原密码不正确!");
			return JsonUtils.toJson(vo);
		}
		try{
			User newUser=new User();
			newUser.setId(user.getId());
			password = MD5Util.getMD5String(PrivilegeConstant.USER_PASSWORD_FRONT+newpwd);
			newUser.setPassword(password);
			this.userService.singleUpdateUser(newUser);
			vo=new SimpleReturnVo(this.SUCCESS, "成功");
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("UserController-rePassword:"+e.getMessage());
			vo=new SimpleReturnVo(this.FAIL, "异常错误！");
		}
		
		return JsonUtils.toJson(vo);
	}
	/**
	 * 
	 * @param request
	 * @return
	 * @Description:修改密码
	 */
	@ResponseBody
	@RequestMapping("/updatePassowrd")
	public String updatePassowrd(User user) {
		SimpleReturnVo vo;
		String password = MD5Util.getMD5String(PrivilegeConstant.USER_PASSWORD_FRONT+user.getPassword());
		try{
			user.setPassword(password);
			this.userService.singleUpdateUser(user);
			vo=new SimpleReturnVo(this.SUCCESS, "成功");
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("UserController-updatePassowrd:"+e.getMessage());
			vo=new SimpleReturnVo(this.FAIL, "异常错误！");
		}
		return JsonUtils.toJson(vo);
	}
	
	/**
	 * 
	 * @return
	 * @Description:重置密码页面
	 */
	@RequestMapping("/rePasswordUI")
	public String rePasswordUI(String sessionId,ModelMap model) {
		model.addAttribute("sessionId", sessionId);
		return "/privilege/user_re_pwd";
	}

	/**
	 * 
	 * @return
	 * @throws Exception 
	 * @Description:用户列表页面
	 */
	@RequestMapping("/list")
	@Permission(systemSn="privilege",moduleSn="user",value=PermissionConatant.R)
	public String list(String sessionId,ModelMap model,HttpServletRequest request) throws Exception {
		model.addAttribute("sessionId", sessionId);
		return "/privilege/user_page";
	}
	
	/**
	 * 
	 * @param user
	 * @param query
	 * @return
	 * @Description:用户分页数据
	 */
	@ResponseBody
	@RequestMapping("ajaxlist")
	@Permission(systemSn="privilege",moduleSn="user",value=PermissionConatant.R)
	public String ajaxlist(User user,Query query){
		PagerModel<User> Users=null;
		try{
			if("0".equals(user.getDepartmentId())){
				user.setDepartmentId(null);
			}else{
				String deptIds = departmentService.getChildrenIdsByPid(user.getDepartmentId());
				user.setDepartmentId(deptIds);
			}
			Users=this.userService.getPagerModel(user, query);
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("UserController-ajaxlist:"+e.getMessage());
		}
		return JsonUtils.getPmJson(Users);
	}
	
	/**
	 * 
	 * @return
	 * @Description:添加用户页面
	 */
	@RequestMapping("/insertUI")
	@Permission(systemSn="privilege",moduleSn="user",value=PermissionConatant.C)
	public String insertUI(String sessionId,ModelMap model){
		model.addAttribute("sessionId", sessionId);
		return "/privilege/user_insert";
	}
	
	/**
	 * 
	 * @return
	 * @Description:用户修改页面
	 */
	@RequestMapping("/updateUI")
	@Permission(systemSn="privilege",moduleSn="user",value=PermissionConatant.U)
	public String updateUI(String sessionId,ModelMap model,String userId){
		model.addAttribute("sessionId", sessionId);
		model.addAttribute("userId", userId);
		return "/privilege/user_update";
	}
	
	/**
	 * 
	 * @return
	 * @Description:详情页面
	 */
	@RequestMapping("/detailUI")
	@Permission(systemSn="privilege",moduleSn="user",value=PermissionConatant.R)
	public String detailUI(String sessionId,ModelMap model,String userId){
		model.addAttribute("sessionId", sessionId);
		model.addAttribute("userId", userId);
		return "/privilege/user_detail";
	}
	
	/**
	 * 
	 * @return
	 * @Description:详情页面
	 */
	@RequestMapping("/udpatePasswordUI")
	@Permission(systemSn="privilege",moduleSn="user",value=PermissionConatant.U)
	public String udpatePasswordUI(String sessionId,ModelMap model){
		model.addAttribute("sessionId", sessionId);
		return "/privilege/udpate_password";
	}
	
	/**
	 * 
	 * @param userId
	 * @param model
	 * @return
	 * @Description:分配角色页面
	 */
	@RequestMapping("/insertRoleUI")
	@Permission(systemSn="privilege",moduleSn="user",value=PermissionConatant.C)
	public String insertRoleUI(String userId,String sessionId,ModelMap model){
		model.addAttribute("sessionId", sessionId);
		model.put("userId", userId);
		return "/privilege/user_role";
	}
	
	/**
	 * 
	 * @param user
	 * @return
	 * @Description:添加用户
	 */
	@ResponseBody
	@RequestMapping("/insert")
	@Permission(systemSn="privilege",moduleSn="user",value=PermissionConatant.C)
	public String insert(User user){
		SimpleReturnVo vo;
		try{
			this.userService.insertUser(user);
			vo=new SimpleReturnVo(this.SUCCESS, "成功");
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("UserController-insert:"+e.getMessage());
			vo=new SimpleReturnVo(this.FAIL, "异常");
		}
		return JsonUtils.toJson(vo);
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 * @Description:根据id获取用户信息
	 */
	@ResponseBody
	@RequestMapping("/ajaxUpdate")
	@Permission(systemSn="privilege",moduleSn="user",value=PermissionConatant.U)
	public String ajaxUpdate(String id){
		User user=null;
		try{
			user=this.userService.getUserById(id);
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("UserController-ajaxUpdate:"+e.getMessage());
		}
		return JsonUtils.toJson(user);
	}
	
	/**
	 * 
	 * @param user
	 * @return
	 * @Description:更新用户
	 */
	@ResponseBody
	@RequestMapping("/update")
	@Permission(systemSn="privilege",moduleSn="user",value=PermissionConatant.U)
	public String update(User user){
		SimpleReturnVo vo;
		try{
			this.userService.updateUser(user);
			vo=new SimpleReturnVo(this.SUCCESS, "成功");
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("UserController-update:"+e.getMessage());
			vo=new SimpleReturnVo(this.FAIL, "异常");
		}
		return JsonUtils.toJson(vo);
	}
	
	/**
	 * 
	 * @param ids id，id,id 
	 * @return
	 * @Description:根据用户id批量删除用户
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@Permission(systemSn="privilege",moduleSn="user",value=PermissionConatant.D)
	public String delete(String ids){
		SimpleReturnVo vo;
		try{
			if(StringUtils.isNotBlank(ids)){
				String [] id=ids.split(",");
				this.userService.delUsers(id);
			}
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("UserController-delete:"+e.getMessage());
			vo=new SimpleReturnVo(this.FAIL, "异常");
		}
		vo=new SimpleReturnVo(this.SUCCESS, "成功");
		return JsonUtils.toJson(vo);
	}
	
	/**
	 * 
	 * @param User
	 * @return
	 * @Description:检测用户名的唯一性
	 */
	@ResponseBody
	@RequestMapping("/checkUserNameExsits")
	public String checkUserNameExsits(User User){
		try{
			User param=new User();
			param.setUsername(User.getUsername());
			List<User> list=this.userService.getAll(param);
			if(StringUtils.isNotBlank(User.getId())){
				User u = this.userService.getUserById(User.getId());
				if(u!=null && u.getUsername().equals(User.getUsername())){
					return "0";
				}else{
					if(list!=null && list.size()>0){
						return "1";
					}
				}
			}else{
				if(list!=null && list.size()>0){
					return "1";
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("UserController-checkUserNameExsits:"+e.getMessage());
		}
		return "0";
	}
	
	/**
	 * 
	 * @return
	 * @Description:获取所有系统列表
	 */
	@ResponseBody
	@RequestMapping("/getAllSystems")
	@Permission(systemSn="privilege",moduleSn="user",value=PermissionConatant.R)
	public String getAllSystems(){
		List<ICSystem> sy=null;
		try {
			sy=this.iICSystemService.getAllIcSystem(null);
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("UserController-getAllSystems:"+e.getMessage());
		}
		return JsonUtils.toJson(sy);
	}
	
	/**
	 * 
	 * @param userId
	 * @return
	 * @Description:查询所有角色。标记用户已经拥有的角色
	 */
	@ResponseBody
	@RequestMapping("/getRoles")
	@Permission(systemSn="privilege",moduleSn="user",value=PermissionConatant.R)
	public String getRoles(String userId, Role role, Query query) {
		PagerModel<Role> pm = null;
		List<Role> roles = null;
		List<Role> uroles = null;
		try {
			pm = this.roleService.getPagerModel(role, query);
			if (pm != null && CollectionUtils.isNotEmpty(pm.getDatas())) {
				roles = pm.getDatas();
				uroles = this.userRoleService.getRolesByUserId(userId);
				if (uroles != null && uroles.size() > 0) {
					for (Role ur : uroles) {
						for (Role r : roles) {
							if (ur.getId().equals(r.getId())) {
								r.setChecked(true);
								break;
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("UserController-getRoles:" + e.getMessage());
		}
		return JsonUtils.toJson(roles);
	}
	
	/**
	 * 
	 * @param userId
	 * @return
	 * @Description:根据用户id获取该用户的所有角色
	 */
	@ResponseBody
	@RequestMapping("/getRoleByUserId")
	@Permission(systemSn="privilege",moduleSn="user",value=PermissionConatant.R)
	public String getRoleByUserId(String userId){
		List<Role> roles=null;
		try {
			roles=this.userRoleService.getRolesByUserId(userId);
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("UserController-getRoleByUserId:"+e.getMessage());
		}
		return JsonUtils.toJson(roles);
	}
	/**
	 * 
	 * @param userId
	 * @param roleIds
	 * @return
	 * @Description:添加用户角色
	 */
	@ResponseBody
	@RequestMapping("/saveUserRole")
	@Permission(systemSn="privilege",moduleSn="user",value=PermissionConatant.C)
	public String saveUserRole(String userId,String roleIds){
		SimpleReturnVo vo;
		try {
			if(StringUtils.isNotBlank(roleIds)){
				this.userRoleService.insertUserRoles(roleIds.split(","), userId);
			}else{
				this.userRoleService.insertUserRoles(userId);
			}
			vo=new SimpleReturnVo(this.SUCCESS, "成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("UserController-saveUserRole:"+e.getMessage());
			vo=new SimpleReturnVo(this.FAIL, "异常");
		}
		return JsonUtils.toJson(vo);
	}
	
	@ResponseBody
	@RequestMapping("/getUserSystemIds")
	@Permission(systemSn="privilege",moduleSn="user",value=PermissionConatant.R)
	public String getUserSystemIds(String userId){
		List<ICSystem> sy=null;
		UserSystem userSystem = new UserSystem();
		userSystem.setUserId(userId);
		List<UserSystem> list;
		try {
			sy=this.iICSystemService.getAllIcSystem(null);
			if(sy!=null && sy.size()>0){
				list = this.userSystemDao.getAll(userSystem);
				if(list!=null && list.size()>0){
					for(UserSystem us : list){
						for(ICSystem ic : sy){
							if(us.getSystemId().equals(ic.getId())){
								ic.setChecked(true);
								break;
							}
						}
					}
				}
			}
		} catch (Exception e) {
			logger.error(e);
		}
		return JsonUtils.toJson(sy);
	}
}
