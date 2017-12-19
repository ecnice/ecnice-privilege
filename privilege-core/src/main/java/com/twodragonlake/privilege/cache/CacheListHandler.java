package com.twodragonlake.privilege.cache;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;
/** 
 * @className：CacheHandler 
 * @description：缓存操作类，对缓存进行管理，采用处理队列，定时循环清理的方式 
 * @remark： 
 * @version  
 */  
@Repository
public class CacheListHandler {
	private static final long SECOND_TIME = 1000;
	private static final SimpleConcurrentMap<String, CacheEntity> map;
	private static final List<CacheEntity> tempList;

	static {
		tempList = new ArrayList<CacheEntity>();
		map = new SimpleConcurrentMap<String, CacheEntity>(
				new HashMap<String, CacheEntity>(1 << 18));
		new Thread(new TimeoutTimerThread()).start();
	}

	/**
	 * 增加缓存对象
	 * 
	 * @param key
	 * @param ce
	 */
	public static void addCache(String key, CacheEntity ce) {
		addCache(key, ce, ce.getValidityTime());
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
		ce.setTimeoutStamp(System.currentTimeMillis() + validityTime
				* SECOND_TIME);
		map.put(key, ce);
		// 添加到过期处理队列
		tempList.add(ce);
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
		tempList.clear();
		map.clear();
	}

	static class TimeoutTimerThread implements Runnable {
		public void run() {
			while (true) {
				try {
					checkTime();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		/**
		 * 过期缓存的具体处理方法
		 * 
		 * @throws Exception
		 */
		private void checkTime() throws Exception {
			// "开始处理过期 ";
			CacheEntity tce = null;
			long timoutTime = 1000L;

			// " 过期队列大小 : "+tempList.size());
			if (1 > tempList.size()) {
				timoutTime = 1000L;
				Thread.sleep(timoutTime);
				return;
			}

			tce = tempList.get(0);
			timoutTime = tce.getTimeoutStamp() - System.currentTimeMillis();
			// " 过期时间 : "+timoutTime);
			if (0 < timoutTime) {
				// 设定过期时间
				Thread.sleep(timoutTime);
				return;
			}
			// 清除过期缓存和删除对应的缓存队列
			tempList.remove(tce);
			removeCache(tce.getCacheKey());
		}
	}
}
