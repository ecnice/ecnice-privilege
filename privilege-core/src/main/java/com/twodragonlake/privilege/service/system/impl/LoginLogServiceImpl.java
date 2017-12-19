package com.twodragonlake.privilege.service.system.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.twodragonlake.privilege.common.PagerModel;
import com.twodragonlake.privilege.common.Query;
import com.twodragonlake.privilege.dao.system.ILoginLogDao;
import com.twodragonlake.privilege.model.system.LoginLog;
import com.twodragonlake.privilege.service.system.ILoginLogService;
import com.twodragonlake.privilege.vo.privilege.LoginLogVo;

/**
 * 
 * @Title:
 * @Description:日志service实现类
 * @Author:TaoXiang.Wen
 * @Since:2014年4月8日
 * @Version:1.1.0
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
@Service
public class LoginLogServiceImpl implements ILoginLogService {

	@Resource
	private ILoginLogDao loginLogDao;

	@Override
	public void insertLoginLog(LoginLog loginLog) throws Exception {
		this.loginLogDao.insertLoginLog(loginLog);
	}

	@Override
	public void updateLoginLog(LoginLog loginLog) throws Exception {
		this.loginLogDao.updateLoginLog(loginLog);
	}

	@Override
	public void delLoginLog(int id) throws Exception {
		this.loginLogDao.delLoginLog(id);
	}

	@Override
	public void delLoginLogs(int[] ids) throws Exception {
		for (int id : ids) {
			this.loginLogDao.delLoginLog(id);
		}
	}

	@Override
	public LoginLog getLoginLogById(int id) throws Exception {
		return this.loginLogDao.getLoginLogById(id);
	}

	@Override
	public PagerModel<LoginLog> getPagerModel(LoginLogVo loginLogVo, Query query) throws Exception {
		return this.loginLogDao.getPagerModel(loginLogVo, query);
	}

	@Override
	public List<LoginLog> getAll(LoginLogVo loginLogVo) throws Exception {
		return this.loginLogDao.getAll(loginLogVo);
	}
}
