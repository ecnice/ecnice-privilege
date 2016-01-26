package com.ecnice.privilege.web.listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.ecnice.privilege.model.system.SystemConfig;
import com.ecnice.privilege.service.system.ISystemConfigService;
import com.ecnice.tools.common.SpringContextHolder;

/**
 * @Title:
 * @Description:系统初始化监听器
 * @Author:Bruce.Liu
 * @Since:2014年4月18日
 * @Version:1.1.0 浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
public class SystemInitListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext servletContext = sce.getServletContext();
		ISystemConfigService systemConfigService = SpringContextHolder.getBean("systemConfigServiceImpl");
		try {
			List<SystemConfig> systemConfigs = systemConfigService.getSystemConfigs();
			servletContext.setAttribute("systemConfigs", systemConfigs); //将系统配置信息放到servletContext中去
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {

	}

}
