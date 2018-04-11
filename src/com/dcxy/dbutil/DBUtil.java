package com.dcxy.dbutil;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class DBUtil {

	//软件设计模式，单一模式
	private static EntityManagerFactory factory=null;
	private DBUtil(){
		//外界不可建立对象
	}
	
	public static EntityManagerFactory getFactory(){
		if(factory==null){
			factory=Persistence.createEntityManagerFactory("org.hibernate.tutorial.jpa");
			//配置文件的持久化单元
		}
		return factory;
	}
}
