//package com.mhome;
//
//import org.junit.BeforeClass;
//import org.junit.Test;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//
//import com.mhome.privilege.component.redis.RedisClientTemplate;
//
//public class PrivilegeTest {
//	
//	private static RedisClientTemplate redisClientTemplate ;
//
//	@BeforeClass
//	public static void setUpBeforeClass() throws Exception {
//		try {
//			@SuppressWarnings("resource")
//			ApplicationContext cxt = new ClassPathXmlApplicationContext(
//					new String[] { "file:src/main/resources/config/spring_common.xml"});
//			redisClientTemplate = (RedisClientTemplate)cxt.getBean("redisClientTemplate");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	
//	@Test
//	public void test() {
//		String value = redisClientTemplate.get("DF3EBED3697437BE26B1D4F7741DBB68");
//		System.out.println(value);
//	}
//}
