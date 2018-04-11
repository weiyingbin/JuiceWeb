package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.dcxy.data.Cart;
import com.dcxy.data.Item;
import com.dcxy.dbutil.DBUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class cartAction extends ActionSupport  {

	private static final long serialVersionUID = 1L;

	private EntityManagerFactory factory=DBUtil.getFactory();

	private int num=1;
	private int num1=1;
	private int itemId;
	private int inumber;


	@Action(value="/addToCard",
			 results={
					 @Result(name="success",type="redirectAction",location="/index"),
					 @Result(name="login",location="/login.jsp")
					 
	})
	
	public String addToCart() {
		ActionContext ac=ActionContext.getContext();
		Map<String,Object> sess=ac.getSession();
		//sess.put("inumber", inumber);
		System.out.println("itemid="+itemId);
		System.out.println("num="+num);
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		//判断用户是否登录
		String login=(String)ActionContext.getContext().getSession().get("login");
		System.out.println(login);
		if(login==null){
			return "login";
		}
		//获得用户ID
		int userId=(int) ActionContext.getContext().getSession().get("userId");
		Query qu = em.createNativeQuery("SELECT * from cart where userId="+userId+" and itemId="+itemId+"", Cart.class);		
	    carts = qu.getResultList();
	    if(carts.size()==1){
	    	num1=num1+carts.get(0).getAmount();
	    	
	    	int cartid=carts.get(0).getId();
	    	System.out.println("----cartid="+cartid);
 		    System.out.println("改之后的num1="+num1);
	    	String sql="update cart set amount="+num1+" where id="+cartid+" ";
	    	inumber = em.createNativeQuery(sql)

				.executeUpdate();
			    System.out.println("i = " + inumber);
			    sess.put("inumber", inumber);
			    em.getTransaction().commit();
				em.close();		
				return "success";
	    }else{
					 System.out.println("userid="+userId);
						Query q = em.createNativeQuery("insert into cart(userId,itemId,amount) values(:userId,:itemId,:num)");
						q.setParameter("userId", userId);
						q.setParameter("itemId",itemId);
						q.setParameter("num",num);
						 inumber=q.executeUpdate();
						System.out.println("5555i="+inumber);
						sess.put("inumber", inumber);
						em.getTransaction().commit();
						em.close();
						return "success";
				 }

	}
	
	//根据用户查询购物车
	private  Cart cart;
	List<Cart> carts;
	List<Item> item;
	String arg1="";
	@Action(value="/allCart",
			 results={
					 @Result(name="success",location="/product_checkout.jsp"),
					 @Result(name="error",location="/error.jsp"),
					 @Result(name="login",location="/login.jsp")
					 
	}
	)
public String doAllProduct() throws Exception {
		
		System.out.println("查询购物车");
		//判断用户是否登录
				String login=(String)ActionContext.getContext().getSession().get("login");
				if(login==null){
					return "login";
				}
		
		 int userId=(int) ActionContext.getContext().getSession().get("userId");
		
		//读数据库
		//查询
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
		Query qu = em.createNativeQuery("SELECT * from cart where userId="+userId, Cart.class);		
	    carts = qu.getResultList();
	    System.out.println(carts.get(0).getItemId());
	    
	    for(int i=0;i<carts.size();i++){
	    	
	    	arg1+= carts.get(i).getItemId()+ ",";
	    	
	    }
	    arg1=arg1.substring(0, arg1.length()-1);
	    System.out.println("arg1="+arg1);
//	    qu = em.createNativeQuery("SELECT * from chanpin  where id in (:ids)" ,Item.class);
	   
	    
	    qu = em.createNativeQuery("SELECT * from chanpin  where id in ("+arg1+")" ,Item.class);
    	
	    
//	    qu.setParameter("ids", arg1);	  
    	item=qu.getResultList();
    	
		System.out.println(item.get(0));
		System.out.println(item.get(0).getName());
		em.getTransaction().commit();
		em.close();
	
		return "success";
	}


	//删除购物车的商品
private int proId;
	
	@Action(value="/deleteCartProduct",
			results={
					@Result(name="success",type="redirectAction",location="/allCart"),
					@Result(name="error",location="/error.jsp")
			}
			)
	public String deleteProduct(){
		
		 int userId=(int) ActionContext.getContext().getSession().get("userId");
			
			//读数据库
			//查询
			EntityManager em = factory.createEntityManager();
			em.getTransaction().begin();
			boolean find=false;
			Query qu = em.createNativeQuery("SELECT * from cart where userId="+userId+ " and itemId="+proId, Cart.class);		
		    cart = (Cart)qu.getSingleResult();
		    System.out.println(cart.getId());
		    
	    	System.out.println("proid="+proId);
		
		    Query q = em.createNativeQuery("delete from cart where id ="+cart.getId(), Cart.class);		
	   
		    int i = q.executeUpdate();  
		
		    System.out.println("i="+i);
		
	       em.getTransaction().commit();
		   em.close();
	       return "success";	
	     
	     
	}
	
	

	
	public String getArg1() {
		return arg1;
	}




	public void setArg1(String arg1) {
		this.arg1 = arg1;
	}




	public int getProId() {
		return proId;
	}




	public void setProId(int proId) {
		this.proId = proId;
	}




	public int getNum1() {
		return num1;
	}






	public void setNum1(int num1) {
		this.num1 = num1;
	}


	public Cart getCart() {
		return cart;
	}




	public void setCart(Cart cart) {
		this.cart = cart;
	}




	public List<Item> getItem() {
		return item;
	}






	public void setItem(List<Item> item) {
		this.item = item;
	}






	public List<Cart> getCarts() {
		return carts;
	}




	public void setCarts(List<Cart> carts) {
		this.carts = carts;
	}




	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}




	public int getInumber() {
		return inumber;
	}

	public void setInumber(int inumber) {
		this.inumber = inumber;
	}
	
	
	
}
