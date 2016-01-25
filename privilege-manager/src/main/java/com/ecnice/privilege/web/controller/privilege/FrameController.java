package com.ecnice.privilege.web.controller.privilege;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecnice.privilege.constant.PrivilegeConstant;
import com.ecnice.privilege.model.privilege.ACL;
import com.ecnice.privilege.model.privilege.ICSystem;
import com.ecnice.privilege.model.privilege.Module;
import com.ecnice.privilege.model.privilege.User;
import com.ecnice.privilege.model.system.SystemConfig;
import com.ecnice.privilege.service.privilege.IICSystemService;
import com.ecnice.privilege.service.privilege.IModuleService;
import com.ecnice.privilege.service.system.ISystemConfigService;
import com.ecnice.privilege.utils.JsonUtils;
import com.ecnice.privilege.utils.WebUtils;
import com.ecnice.privilege.vo.privilege.Node;
import com.ecnice.privilege.web.controller.BaseController;

/**
 * @Title:
 * @Description:后台中心
 * @Author:Bruce.Liu
 * @Since:2014年4月3日
 * @Version:1.1.0 浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
@Controller
@RequestMapping("/managment/frame")
public class FrameController extends BaseController{
	private static final Logger logger =Logger.getLogger(FrameController.class);
	@Resource
	private IICSystemService iIcSystemService;
	@Resource
	private IModuleService moduleService;
	@Resource
	private ISystemConfigService systemConfigService;

	public static void main(String[] args) {
		String url = "http://192.168.50.174:8080/privilege-manager/managment/frame/index.do?sessionId=CBDF9A3C9656DF7119AD9164BCCF676D";
		url = url.substring(url.indexOf("//") + 2, url.lastIndexOf(":"));
		System.out.println(url);
	}

	// 展示系统树
	@ResponseBody
	@RequestMapping("/systemTree")
	public String systemTree(HttpServletRequest request, String systemId, String url, String sessionId)
			throws Exception {
		SystemConfig config = systemConfigService.getSystemConfigsByKey(PrivilegeConstant.IS_PROD).get(0);
		//
		if (config.getConfigValue().equals("true") && url.indexOf(config.getConfigSn()) == -1
				&& url.indexOf(getIpAddr(request)) == -1) {
			String projectName = url.substring(url.lastIndexOf(":"));
			// url = "http://"+getIpAddr(request)+projectName;
			url = "http://127.0.0.1" + projectName;
		}

		// 1：判断用户是否管理员还是普通用户.
		User user = (User) WebUtils.getSession(request).getAttribute(PrivilegeConstant.LOGIN_USER);
		Set<ACL> acls = (Set<ACL>) WebUtils.getSession(request).getAttribute(PrivilegeConstant.LOGIN_USER_ACLS);
		List<Module> modules = null;
		if (user != null) {
			if(StringUtils.isBlank(systemId)){
				logger.info("用户："+user.getUsername()+"的系统id为空！！");
			}else{
				modules = moduleService.getTreeModuleBySystemIdAndAcls(acls, systemId);
			}
		}
		List<Node> nodes = this.getNodes(modules, url, sessionId);
		if(CollectionUtils.isEmpty(nodes)){
			nodes = new ArrayList<Node>();
		}
		return JsonUtils.toJson(nodes);
	}

	public String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	// 得到模块树
	private List<Node> getNodes(List<Module> modules, String url, String sessionId) throws Exception {
		if (modules == null) {
			return null;
		}
		List<Node> nodes = new ArrayList<Node>();
		for (int i = 0; i < modules.size(); i++) {
			Module m = modules.get(i);
			Node node = new Node();
			if (StringUtils.isNotBlank(m.getPid())) {
				node.setId(m.getId());
				node.setPid(m.getPid());
				node.setText(m.getName());
				if (m.getUrl().indexOf("?") == -1) {
					node.setUrl(url + m.getUrl() + "?sessionId=" + sessionId);
				} else {
					node.setUrl(url + m.getUrl() + "&sessionId=" + sessionId);
				}
				nodes.add(node);
			} else {
				if (moduleService.checkChildren(m.getId())) {
					node.setId(m.getId());
					node.setText(m.getName());
					node.setIsLeaf(false);
					node.setExpanded(true);
					nodes.add(node);
				} else {
					node.setId(m.getId());
					node.setPid(m.getPid());
					node.setText(m.getName());
					if (m.getUrl().indexOf("?") == -1) {
						node.setUrl(url + m.getUrl() + "?sessionId=" + sessionId);
					} else {
						node.setUrl(url + m.getUrl() + "&sessionId=" + sessionId);
					}
					nodes.add(node);
				}
			}
		}
		return nodes;
	}

	// 后台系统的首页界面
	@RequestMapping("/index")
	public String index(HttpServletRequest request, ModelMap model, String sessionId) {
		model.put("copy", PrivilegeConstant.COMPANY_COPY);
		//得到系统配置信息
		super.getSystemConfigsInfoToModelMap(model);
		User user = null;
		try {
			user = (User) WebUtils.getSession(request).getAttribute(PrivilegeConstant.LOGIN_USER);
		} catch (Exception e1) {
			return "/frame/login";
		}
		if (user != null) {
			List<ICSystem> systems = null;
			try {
				if (user.getUsername().equals("admin")) {
					systems = iIcSystemService.getAllIcSystem(null);
				} else {
					systems = iIcSystemService.getICSystemsByUserId(user.getId());
					// 给登录用户的设置都放里面去
					ICSystem icSystem = iIcSystemService.getICSystemBySn("setup");
					if (icSystem != null) {
						systems.add(icSystem);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();

			}
			model.addAttribute("systems", systems);
			model.addAttribute("sessionId", sessionId);
		}
		return "/frame/index";
	}
}
