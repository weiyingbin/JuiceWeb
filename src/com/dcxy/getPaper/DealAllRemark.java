package com.dcxy.getPaper;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.dcxy.data.PingLun;
import com.dcxy.dbutil.DBUtil;

public class DealAllRemark {
	@SuppressWarnings("unchecked")
	public static List<PingLun> getAllRemark() {
		List<PingLun> list;
		EntityManager em = DBUtil.getFactory().createEntityManager();
		em.getTransaction().begin();
		Query q = em.createNativeQuery("select * from  pinglun", PingLun.class);
		list = q.getResultList();

		em.close();
		return list;
	}
	@SuppressWarnings("unchecked")
	public static List<PingLun> idGetRemark(int cid){
		List<PingLun> list;
		EntityManager em = DBUtil.getFactory().createEntityManager();
		em.getTransaction().begin();
		Query q = em.createNativeQuery("select * from  pinglun where cid="+cid, PingLun.class);
		list = q.getResultList();

		em.close();
		return list;
		
	}

	public static boolean deleatReamrk(int id) {
		EntityManager em = DBUtil.getFactory().createEntityManager();
		em.getTransaction().begin();
		int q = em.createNativeQuery("delete  from  pinglun where id=" + id)
				.executeUpdate();
		em.close();
		if (q >= 0) {
			return true;
		} else
			return false;

	}

	public static void main(String[] args) {
		deleatReamrk(20);
	}

}
