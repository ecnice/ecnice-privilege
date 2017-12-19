package com.twodragonlake.privilege.web.controller.privilege;

import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.twodragonlake.privilege.constant.PrivilegeConstant;
import com.twodragonlake.privilege.model.privilege.ACL;
import com.twodragonlake.privilege.model.privilege.User;
import com.twodragonlake.privilege.model.system.LoginLog;
import com.twodragonlake.privilege.service.privilege.IAclService;
import com.twodragonlake.privilege.service.privilege.IUserService;
import com.twodragonlake.privilege.service.privilege.InitSystem;
import com.twodragonlake.privilege.service.system.ILoginLogService;
import com.twodragonlake.privilege.utils.WebUtils;
import com.twodragonlake.privilege.web.controller.BaseController;
import com.twodragonlake.tools.common.Base64Utils;

/**
 * @Comment:用户登录
 * @author: bruce.liu@ceacsz.com.cn
 * @version: 2014年3月27日 下午5:59:30
 */
@Controller
@RequestMapping("/")
public class LoginController extends BaseController {

	private static final String COOKIE_USER_PWD = "mhome_user_pwd";
	private static Logger logger = Logger.getLogger(LoginController.class);

	@Resource
	private IUserService userService;
	@Resource
	private InitSystem initSystem;
	@Resource
	private IAclService aclService;
	@Resource
	private ILoginLogService loginLogService;
	
	// 初始化
	@RequestMapping("/init")
	public String init(HttpServletRequest request, ModelMap model) {
		try{
			//通过userId = 1查询数据库是否有记录
			User user=this.userService.getUserById("1");
			if(user==null){
				initSystem.init();
			}
		}catch(Exception e){
			e.printStackTrace();
			model.addAttribute("message", "初始化失败!");
			return "/frame/login";
		}
		return "/frame/login";
	}

	// 退出
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, ModelMap model) {
		WebUtils.getSession(request).removeAttribute(
				PrivilegeConstant.LOGIN_USER);
		this.setCookieValue(request, model);
		model.put("copy", PrivilegeConstant.COMPANY_COPY);
		//得到系统配置信息
		super.getSystemConfigsInfoToModelMap(model);
		return "/frame/login";
	}

	/**
	 * 登录输入界面
	 * 
	 * @return
	 */
	@RequestMapping("/loginUI")
	public String loginUI(HttpServletRequest request, ModelMap model,String message) {
		this.setCookieValue(request, model);
		if(StringUtils.isNotBlank(message)) {
			model.addAttribute("message", Base64Utils.decodeStr(message));
		}
		model.put("copy", PrivilegeConstant.COMPANY_COPY);
		//得到系统配置信息
		super.getSystemConfigsInfoToModelMap(model);
		return "/frame/login";
	}

	

	// 恢复cookie值
	private void setCookieValue(HttpServletRequest request, ModelMap model) {
		String base64userpwd = WebUtils.findCookieValue(request,
				COOKIE_USER_PWD);
		if (StringUtils.isNotBlank(base64userpwd)) {
			String userpwd = Base64Utils.decodeStr(base64userpwd);
			String[] userpwds = userpwd.split("~");
			model.addAttribute("username", userpwds[0]);
			model.addAttribute("password", userpwds[1]);
			model.addAttribute("selectFlag", userpwds[2]);
		}
	}

	/**
	 * 
	 * @param request
	 * @param username
	 * @param password
	 * @return
	 * @Description: 用户登录
	 */
	@ResponseBody
	@RequestMapping("/login")
	public String login(HttpServletRequest request,
			HttpServletResponse response, String username, String password,String company,
			Integer selectFlag) {
		User user = null;
		String sessionId = "0";
		try {
			// 1:查询到用户对象
			user = userService.login(username, password);
			// 如果选择了就放到cookie里面 这个必须放在登录成功之后
			if (user!=null && selectFlag != null && selectFlag.intValue() == 1) {
				String namePwd = username + "~" + password + "~" + selectFlag;
				String base64Str = Base64Utils.encodeStr(namePwd);
				WebUtils.addCookie(request, response, COOKIE_USER_PWD, base64Str, 2592000);
			} else {
				WebUtils.failureCookie(request, response, COOKIE_USER_PWD);
			}
			if (user != null) {
				// 2:用户信息放到session里面一份
				WebUtils.getSession(request).setAttribute(
						PrivilegeConstant.LOGIN_USER, user);
				// 3：把用户拥有的所有权限ACL列表查询出来放到session中
				Set<ACL> acls = (Set<ACL>) aclService.getAclsByUserId(user
						.getId());
				WebUtils.getSession(request).setAttribute(
						PrivilegeConstant.LOGIN_USER_ACLS, acls);
				sessionId = WebUtils.getSession(request).getId();
				//插入登录日志
				String ip = request.getRemoteAddr();
				LoginLog loginLog = new LoginLog(ip, user.getId(), user.getUsername(), user.getRealName(), "登录");
				loginLogService.insertLoginLog(loginLog);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.info(e.getMessage());
		}
		return sessionId;
	}
	
	@RequestMapping("/index")
	public String index(ModelMap model) {
		model.put("copy", PrivilegeConstant.COMPANY_COPY);
		//得到系统配置信息
		super.getSystemConfigsInfoToModelMap(model);
		return "/index";
	}
}
