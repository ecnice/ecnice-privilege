package com.twodragonlake.privilege.component.httpclient;

import java.util.List;

/**
 * @Title:
 * @Description:httpclient接口
 * @Author:Bruce.Liu
 * @Since:2014年4月4日
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
public interface IHttpclient {

	/**
	 * @param sessionId
	 * @Description:系统的url列表 执行给系统添加一个静态的常量 即使系统缓存
	 */
	public void execute(String url,String sessionId)throws Exception;
}
