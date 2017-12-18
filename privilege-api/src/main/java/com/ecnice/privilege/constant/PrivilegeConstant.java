package com.ecnice.privilege.constant;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Comment:系统中的常量
 * @author bruce.liu
 * @Create Date 2014年3月27日
 */
public class PrivilegeConstant {
	
	//是否是生成环境
	public static final String IS_PROD = "is_prod";
	//公司名称
	public static final String COMPANY_NAME = "company_name";
	//平台名称
	public static final String PLAIN_NAME = "plain_name";
	//平台Logo
	public static final String PLAIN_LOGO = "plain_logo";
	//平台icon
	public static final String PLAN_ICON = "plan_icon";

	/**
	 * session在缓存中的存活时间
	 */
	public static final int SESSION_OUT_TIME = 28800;
	//登录用户的session中的key值
	public static final String LOGIN_USER = "login_user";
	//登录用户的acl列表
	public static final String LOGIN_USER_ACLS = "login_user_acls";
	
	//密码加密前缀
	public static final String USER_PASSWORD_FRONT = "mhome2015";
	//sessionid的名称
	public static final String SESSION_ID = "sessionId";
	
	//资源标示用户
	public static final String RESOURCE_SN_USER = "user";
	//资源标示角色
	public static final String RESOURCE_SN_ROLE = "role";
	
	//数据标示
	public static final String DATA_PRIVILEGE_SN = "data_sn";
	
	//©2015-2016
	public static final String COMPANY_COPY="2015-"+new SimpleDateFormat("yyyy").format(new Date());
	
	// 成功
	public static final String SUCCESS_CODE = "1";
	// 失败
	public static final String ERROR_CODE = "0";
	// 异常
	public static final String EXCEPTION_CODE = "2";
	
}
