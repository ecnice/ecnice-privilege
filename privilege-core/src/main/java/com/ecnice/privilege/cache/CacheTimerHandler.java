package com.ecnice.privilege.cache;

import java.util.HashMap;
import java.util.Timer;
import java.util.TimerTask;
/** 
 * @className：CacheHandler 
 * @description：缓存操作类，对缓存进行管理,清除方式采用Timer定时的方式 
 * @remark： 
 * @version  
 */  
public class CacheTimerHandler {
	private static final long SECOND_TIME = 1000;// 默认过期时间 20秒
	private static final int DEFUALT_VALIDITY_TIME = 20;// 默认过期时间 20秒
	private static final Timer timer;
	private static final SimpleConcurrentMap<String, CacheEntity> map;

	static {
		timer = new Timer();
		map = new SimpleConcurrentMap<String, CacheEntity>(
				new HashMap<String, CacheEntity>(1 << 18));
	}

	/**
	 * 增加缓存对象
	 * 
	 * @param key
	 * @param ce
	 */
	public static void addCache(String key, CacheEntity ce) {
		addCache(key, ce, DEFUALT_VALIDITY_TIME);
	}

	/**
	 * 增加缓存对象
	 * 
	 * @param key
	 * @param ce
	 * @param validityTime
	 *            有效时间
	 */
	public static synchronized void addCache(String key, CacheEntity ce,
			int validityTime) {
		map.put(key, ce);
		// 添加过期定时
		timer.schedule(new TimeoutTimerTask(key), validityTime * SECOND_TIME);
	}

	/**
	 * 获取缓存对象
	 * 
	 * @param key
	 * @return
	 */
	public static synchronized CacheEntity getCache(String key) {
		return map.get(key);
	}

	/**
	 * 检查是否含有制定key的缓冲
	 * 
	 * @param key
	 * @return
	 */
	public static synchronized boolean isConcurrent(String key) {
		return map.containsKey(key);
	}

	/**
	 * 删除缓存
	 * 
	 * @param key
	 */
	public static synchronized void removeCache(String key) {
		map.remove(key);
	}

	/**
	 * 获取缓存大小
	 * 
	 * @param key
	 */
	public static int getCacheSize() {
		return map.size();
	}

	/**
	 * 清除全部缓存
	 */
	public static synchronized void clearCache() {
		if (null != timer) {
			timer.cancel();
		}
		map.clear();
		System.out.println("clear cache");
	}

	/**
	 * @className：TimeoutTimerTask
	 * @description：清除超时缓存定时服务类
	 * @remark：
	 * @version
	 */
	static class TimeoutTimerTask extends TimerTask {
		private String ceKey;

		public TimeoutTimerTask(String key) {
			this.ceKey = key;
		}

		@Override
		public void run() {
			CacheTimerHandler.removeCache(ceKey);
			System.out.println("remove : " + ceKey);
		}
	}
}
