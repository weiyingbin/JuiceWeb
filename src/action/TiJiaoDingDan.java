package action;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.dcxy.data.Cart;
import com.dcxy.data.DingDan;
import com.dcxy.data.Item;
import com.dcxy.data.PingLun;
import com.dcxy.dbutil.DBUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TiJiaoDingDan extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private EntityManagerFactory factory=DBUtil.getFactory();
	
	List<Item> product;
	 List<DingDan> mapList;
	
	
	
	private int userid;
	private String ids;


	
	public String getIds() {
		return ids;
	}



	public void setIds(String ids) {
		this.ids = ids;
	}



	private int cid;
	
	
	private int number;
	private int state;
	private Date ddate;
	
	
	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}

	private String[] fengge;
	private String[] mingshu;
	
	
	



	@Action(value = "/doDingDan", results = {
			@Result(name = "success", location = "/DingDanChengGong.jsp"),
			
			@Result(name = "input", location = "/login.jsp") })
	public String doDingDan() throws Exception {
		
		userid=(int) ActionContext.getContext().getSession().get("userId");
		System.out.println(userid);
		System.out.println(ids);
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		cid=0;
		number=0;
		
		fengge = ids.split(",");
		for (int i = 0; i < fengge.length; i++) {			
			mingshu=fengge[i].split(":");
			cid=Integer.parseInt(mingshu[0]);
			number=Integer.parseInt(mingshu[1]);
			
			Query q = em.createNativeQuery("insert into dingdan(userid,cid,number,state,ddate) values(:userid,:cid,:number,:state,:ddate)");
			q.setParameter("userid", userid);
			q.setParameter("cid",cid);		
			q.setParameter("number",number);
			q.setParameter("state", 1);
			q.setParameter("ddate",new Date() );
			
			int z=q.executeUpdate();
			System.out.println("i="+z);						
						
		}
		
		Query q = em.createNativeQuery("delete from cart where userId ="+userid, Cart.class);		
		int i = q.executeUpdate();  
	
		
		

		em.getTransaction().commit();// 提交
		em.close();
		return "success";
		
	}
	
	
	
	public List<Item> getProduct() {
		return product;
	}



	public void setProduct(List<Item> product) {
		this.product = product;
	}



	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getCid() {
		return cid;
	}



	public void setCid(int cid) {
		this.cid = cid;
	}



	



	



	public int getNumber() {
		return number;
	}



	public void setNumber(int number) {
		this.number = number;
	}



	public int getState() {
		return state;
	}



	public void setState(int state) {
		this.state = state;
	}



	
	

}
