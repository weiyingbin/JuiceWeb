package action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.dcxy.data.DingDan;
import com.dcxy.data.Item;
import com.dcxy.data.User;
import com.dcxy.dbutil.DBUtil;
import com.opensymphony.xwork2.ActionSupport;

public class ChaKanDingDanAction extends ActionSupport {
	private EntityManagerFactory factory = DBUtil.getFactory();
	List<User> user;
	List<Item> item;
	List<DingDan> dingdan;
	
	List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

	public List<Map<String, Object>> getList() {
		return list;
	}

	public void setList(List<Map<String, Object>> list) {
		this.list = list;
	}
	public double sumprice;

	public double getSumprice() {
		return sumprice;
	}

	public void setSumprice(double sumprice) {
		this.sumprice = sumprice;
	}

	@Action(value = "/CKDD", results = {
			@Result(name = "success", location = "/admin3.jsp"),
			@Result(name = "error", location = "/error.jsp") })
	public String queryOrder() {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		Query q = em.createNativeQuery("select * from dingdan where state != 0", DingDan.class);
		dingdan = q.getResultList();
		if (dingdan != null) {
			for (DingDan dd : dingdan) {
				int id = dd.getId();
				int userId = dd.getUserid();
				int goodsId = dd.getCid();
				int num = dd.getNumber();
				int status = dd.getState();
				Date date = dd.getDdate();
				q = em.createNativeQuery("SELECT * from user  where id = (" + userId + ")", User.class);
				User u = (User) q.getSingleResult();
				String username = u.getName();

				q = em.createNativeQuery("SELECT * from chanpin  where id  = (" + goodsId + ")", Item.class);
				Item goods = (Item) q.getSingleResult();
				String goodsName = goods.getName();
				double price = goods.getPrice();

				Map<String, Object> order = new HashMap<String, Object>();
				order.put("id", id);
				order.put("userId", userId);
				order.put("goodsId", goodsId);
				order.put("num", num);
				if(status==1){
					order.put("status", "未付款");
					}
				if(status==2){
					order.put("status", "已付款");
					}		
				order.put("date", date);
				order.put("username", username);
				order.put("goodsName", goodsName);
				price=price*num;
				order.put("price",price);

				list.add(order);

			}
		}
		sumprice=0;
		for(Map<String, Object> temp:list)
		{
			sumprice+=(double)temp.get("price");
		}
		System.out.println("总价："+sumprice);
		return SUCCESS;
	}

	private String orderId;
	
	
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	@Action(value="/deldd",
			 results={
					 @Result(name="success",type="redirectAction",location="/CKDD"),
					 @Result(name="error",location="/error.jsp"),
					
					
	}
	)
	
	public String deldd() throws Exception {
		EntityManager em=factory.createEntityManager();//创建工厂对象
		em.getTransaction().begin();
		//添加一条记录
		
			String sql="update dingdan set state=0 where id=:id";
		    int i = em.createNativeQuery(sql)
			.setParameter("id", orderId)	
			.executeUpdate();
		    System.out.println("i = " + i);
		 
		em.getTransaction().commit();//提交
		em.close();
		return "success";
	}
	
	
	
	
	
	
}
