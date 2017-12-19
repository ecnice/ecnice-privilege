package com.twodragonlake.privilege.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
/**
 * 
 * @Description:远程调用外部http接口
 * @Author:Martin.Wang
 * @Since:2014-4-24
浙江蘑菇加电子商务有限公司 2014 ~ 2015 版权所有
 */
public class HttpClientUtil{
	
	/**
	 * 
	 * @param url 请求的地址
	 * @param params 键值对参数map
	 * @return 返回响应数据
	 * @Description:
	 */
	public static String httpRemoteRequest(String url,Map<String, String> params){
		HttpClient client = new HttpClient();
		PostMethod post = new UTF8PostMethod(url);
		post.addRequestHeader("Content","text/html,charset=utf-8");
		ArrayList<NameValuePair> NameValuePairs=new ArrayList<NameValuePair>();
		NameValuePair [] nvp=new NameValuePair[]{};
		if(params!=null){
			for(String key : params.keySet()){
				NameValuePair nameValuePair = new NameValuePair(key,params.get(key));
				NameValuePairs.add(nameValuePair);
			}
			nvp=new NameValuePair[params.size()];
			nvp=NameValuePairs.toArray(nvp);
		}
		post.setRequestBody(NameValuePairs.toArray(nvp));
		try {
			client.executeMethod(post);
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String message="500";
		try {
			message = post.getResponseBodyAsString();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return message;
	}
	private static class UTF8PostMethod extends PostMethod {
		public UTF8PostMethod(String url) {
			super(url);
		}

		@Override
		public String getRequestCharSet() {
			return "utf-8";
		}
	}
}
