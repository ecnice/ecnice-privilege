package com.ecnice.privilege.web.controller.system;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecnice.privilege.common.PagerModel;
import com.ecnice.privilege.common.Permission;
import com.ecnice.privilege.common.Query;
import com.ecnice.privilege.constant.PermissionConatant;
import com.ecnice.privilege.model.system.LoginLog;
import com.ecnice.privilege.service.system.ILoginLogService;
import com.ecnice.privilege.utils.JsonUtils;
import com.ecnice.privilege.vo.SimpleReturnVo;
import com.ecnice.privilege.vo.privilege.LoginLogVo;
import com.ecnice.privilege.web.controller.BaseController;

/**
 * 
 * @Title:
 * @Description:日志控制器
 * @Author:TaoXiang.Wen
 * @Since:2014年4月8日
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
@Controller
@RequestMapping("/managment/system/loginLog")
public class LoginLogController extends BaseController{
	private static Logger logger=Logger.getLogger(LoginLogController.class);
	@Resource
	private ILoginLogService loginLogService;
	
	@RequestMapping("/list")
	@Permission(systemSn="privilege",moduleSn="loginlog",value=PermissionConatant.R)
	public String list(String sessionId,ModelMap model){
		model.addAttribute("sessionId", sessionId);
		return "/system/login_log_page";
	}
	
	@ResponseBody
	@RequestMapping("/ajaxList")
	@Permission(systemSn="privilege",moduleSn="loginlog",value=PermissionConatant.R)
	public String ajaxList(LoginLogVo loginLogVo,Query query){
		PagerModel<LoginLog> pm=null;
		//可以在页面中指定开始时间和结束时间进行查询
		//loginLogVo.setOperationTimeStart("2014-04-09 18:03:48");
		//loginLogVo.setOperationTimeEnd("2014-04-09 19:03:48");
		try{
			pm=loginLogService.getPagerModel(loginLogVo, query);
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("LoginLogController-ajaxList:"+e.getMessage());
		}
		return JsonUtils.getPmJson(pm);
	}
	
	@RequestMapping("/insertUI")
	@Permission(systemSn="privilege",moduleSn="loginlog",value=PermissionConatant.C)
	public String insertUI(String sessionId,ModelMap model){
		model.addAttribute("sessionId", sessionId);
		return "/system/login_log_insert";
	}
	
	@ResponseBody
	@RequestMapping("/insert")
	@Permission(systemSn="privilege",moduleSn="loginlog",value=PermissionConatant.C)
	public String insert(LoginLog loginLog){
		SimpleReturnVo vo=null;
		try {
			loginLogService.insertLoginLog(loginLog);
			vo=new SimpleReturnVo(SUCCESS,"成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("LoginLogController-insert:"+e.getMessage());
			vo=new SimpleReturnVo(FAIL, "异常");
		}
		return JsonUtils.toJson(vo);
	}
	
	@RequestMapping("/updateUI")
	@Permission(systemSn="privilege",moduleSn="loginlog",value=PermissionConatant.U)
	public String updateUI(String sessionId,ModelMap model){
		model.addAttribute("sessionId", sessionId);
		return "/system/login_log_update";
	}
	
	@ResponseBody
	@RequestMapping("/ajaxUpdate")
	@Permission(systemSn="privilege",moduleSn="loginlog",value=PermissionConatant.U)
	public String ajaxUpdate(String id){
		LoginLog loginLog=null;
		try {
			if(id.matches("\\d+")){
				loginLog=loginLogService.getLoginLogById(Integer.parseInt(id.trim()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtils.toJson(loginLog);
	}
	
	@ResponseBody
	@RequestMapping("/update")
	@Permission(systemSn="privilege",moduleSn="loginlog",value=PermissionConatant.U)
	public String update(LoginLog loginLog){
		SimpleReturnVo vo=null;
		try {
			loginLogService.updateLoginLog(loginLog);
			vo=new SimpleReturnVo(SUCCESS, "成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("LoginLogController-update:" +e.getMessage());
			vo=new SimpleReturnVo(FAIL,"异常");
		}
		return JsonUtils.toJson(vo);
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	@Permission(systemSn="privilege",moduleSn="loginlog",value=PermissionConatant.D)
	public String delete(String idStrs){
		SimpleReturnVo vo=null;
		if (idStrs != null && idStrs.length() > 0) {
			String[] idStr = idStrs.split(",");
			int[] ids=new int[idStr.length];
			try {
				for (int i = 0; i < idStr.length; i++) {
					if(idStr[i].matches("\\d+")){
						ids[i]=Integer.parseInt(idStr[i].trim());
					}
				}
				loginLogService.delLoginLogs(ids);
				vo=new SimpleReturnVo(SUCCESS,"成功");
			} catch (Exception e) {
				e.printStackTrace();
				logger.debug("LoginLogController-delete:" +e.getMessage());
				vo=new SimpleReturnVo(FAIL,"异常");
			}
		}
		return JsonUtils.toJson(vo);
	}
}
