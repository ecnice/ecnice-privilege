package com.ecnice.privilege.service.privilege;

import com.ecnice.privilege.common.SessionMap;

/**
 * @Title:
 * @Description:session的service
 * @Author:Bruce.Liu
 * @Since:2014年4月10日
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
public interface ISessionDataService {

	/**
	 * @param sessionId
	 * @return
	 * @Description:查询session数据
	 */
	public SessionMap getSessionDataBySessionId(String sessionId);

	/**
	 * @param sessionData
	 * @Description:更新session
	 */
	public void updateSessionData(SessionMap sessionMap, String sessionId)throws Exception;

	/**
	 * @param sessionData
	 * @Description:添加session
	 */
	public void insertSessionData(SessionMap sessionMap,String sessionId,long creationTime)throws Exception;

	/**
	 * @param sessionId
	 * @Description:删除session
	 */
	public void deleteSessionData(String sessionId);
}
