package action;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.dcxy.data.Gonggao;
import com.dcxy.data.Item;
import com.dcxy.data.PingLun;
import com.dcxy.data.User;
import com.dcxy.dbutil.DBUtil;
import com.dcxy.getPaper.GetPaper;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ItemAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private EntityManagerFactory factory=DBUtil.getFactory();
	
	List<PingLun> pingluns;
	List<Item> items;
	List<Item> relateItems;
	List<Item> relate;
	List<Item> product;
	List<PingLun> pinglun; 
    List<PingLun> latter;
    int amountcomment;
    User user;
List<Gonggao> gonggaos;



	

	public List<Gonggao> getGonggaos() {
	return gonggaos;
}
public void setGonggaos(List<Gonggao> gonggaos) {
	this.gonggaos = gonggaos;
}
	
	

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

    
    
    
    
	//主页查询所有产品
	@Action(value="/index",
			results={
					@Result(name="success",location="/index.jsp"),
					@Result(name="error",location="/error.jsp")
			}
			)
	public String index(){
		
		//读数据库
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
		Query q = em.createNativeQuery("select * from chanpin", Item.class);		
		 items = q.getResultList();
	     System.out.println(items.get(0));
	     
	     Query qy = em.createNativeQuery("select  * from chanpin where type='"+"水果"+"' limit 4", Item.class);		
	     relate = qy.getResultList();
	     System.out.println(relate.get(0));
	     
	     Query qu = em.createNativeQuery("select * from pinglun  limit 3", PingLun.class);
		 pinglun = qu.getResultList();
		  System.out.println(pinglun.get(0));
	     
	     Query que = em.createNativeQuery("select * from pinglun order by id desc limit 0,2", PingLun.class);
		 latter = que.getResultList();
		 System.out.println(latter.get(0));
		 
		 Query b = em.createNativeQuery("select * from gonggao order by gtime desc limit 0,3", Gonggao.class);		
		 gonggaos = b.getResultList();
		    System.out.println(gonggaos.get(0));
		 
		 
		 
	     
	     em.getTransaction().commit();
			em.close();
	     return "success";	
	}
	//主页查询蔬菜
	@Action(value="/vegetable",
			 results={
					 @Result(name="success",location="/index.jsp"),
					 @Result(name="error",location="/error.jsp")
	}
	)
	
public String vegetable() throws Exception {
		
		System.out.println("------------");
		//读数据库
		//查询
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
		Query q = em.createNativeQuery("select * from chanpin where type='蔬菜'", Item.class);
		
		items = q.getResultList();
	     System.out.println(items.get(0));
	     Query qy = em.createNativeQuery("select  * from chanpin where type='"+"水果"+"' limit 4", Item.class);		
	     relate = qy.getResultList();
	     System.out.println(relate.get(0));
	     
	     
		em.getTransaction().commit();
		em.close();
	
		return "success";
	}

	//主页查询水果
		@Action(value="/fruit",
				 results={
						 @Result(name="success",location="/index.jsp"),
						 @Result(name="error",location="/error.jsp")
		}
		)
		
	public String fruit() throws Exception {
			
			System.out.println("------------");
			//读数据库
			//查询
			EntityManager em = factory.createEntityManager();
			em.getTransaction().begin();
			boolean find=false;
			Query q = em.createNativeQuery("select * from chanpin where type='水果'", Item.class);
			
			items = q.getResultList();
		     System.out.println(items.get(0));
		     Query qy = em.createNativeQuery("select  * from chanpin where type='"+"水果"+"' limit 4", Item.class);		
		     relate = qy.getResultList();
		     System.out.println(relate.get(0));
		     
		     
			em.getTransaction().commit();
			em.close();
		
			return "success";
		}

		//主页根据用户输入内容查询
		private String selectproduct;
		@Action(value="/select",
				 results={
						 @Result(name="success",location="/index.jsp"),
						 @Result(name="error",location="/error.jsp")
		}
		)
		
	public String select() throws Exception {
			System.out.println("select()");
			System.out.println("selectproduct="+selectproduct);
			
			//读数据库
			//查询
			EntityManager em = factory.createEntityManager();
			em.getTransaction().begin();
			boolean find=false;
			if(selectproduct.equals("蔬菜")){
			   Query q = em.createNativeQuery("select * from chanpin where type='蔬菜'", Item.class);
			   items = q.getResultList();
		       System.out.println(items.get(0));
			}else if(selectproduct.equals("水果")){
			 Query qey = em.createNativeQuery("select  * from chanpin where type='水果' ", Item.class);		
			 items = qey.getResultList();
		     System.out.println(items.get(0));
			}else{
				 Query q = em.createNativeQuery("select  * from chanpin where name like '%"+selectproduct+"%'", Item.class);		
				 items = q.getResultList();
			     System.out.println(items.get(0));
			}
			
			 Query qy = em.createNativeQuery("select  * from chanpin where type='"+"水果"+"' limit 4", Item.class);		
		     relate = qy.getResultList();
		     System.out.println(relate.get(0));    
			em.getTransaction().commit();
			em.close();
		
			return "success";
		}

	//根据ID查询产品详细信息
	private int id;
	private Item item;
	@Action(value="/item",
			results={
					@Result(name="success",location="/product_detail.jsp"),
					@Result(name="error",location="/error.jsp"),
					@Result(name="login",location="/login.jsp")
			}
			)
	public String selectid(){
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
		Query q = em.createNativeQuery("select * from chanpin where id="+id, Item.class);		
	
		item = (Item)q.getSingleResult();
	    System.out.println(item.getName());
	     
	     Query qu = em.createNativeQuery("select  * from chanpin where type='"+item.getType()+"' limit 5", Item.class);		
	     relateItems = qu.getResultList();
	     
	     //查询评论
	     Query x = em.createNativeQuery("select * from  pinglun where cid ="+id, PingLun.class);		
	 	 pingluns =x.getResultList();
	 	 
	 	 x = em.createNativeQuery("select  count(cid) from  pinglun where cid ="+id);		
	 	amountcomment=Integer.parseInt(x.getSingleResult()+"");
	 	 System.out.println("amountcomment:"+amountcomment);
//	     
	     System.out.println(relateItems.get(0));
	     em.getTransaction().commit();
		 em.close();
	     return "success";	
	     
	     
	}
	private int allProductLength;
	private int allIdex;
	private String  url;
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getAllProductLength() {
		return allProductLength;
	}
	public void setAllProductLength(int allProductLength) {
		this.allProductLength = allProductLength;
	}
	public int getAllIdex() {
		return allIdex;
	}
	public void setAllIdex(int allIdex) {
		this.allIdex = allIdex;
	}

	//管理员查询所有产品
	@Action(value="/allProduct",
			 results={
					 @Result(name="success",location="/admin.jsp"),
					 @Result(name="error",location="/error.jsp")
	}
	)
	
public String doAllProduct() throws Exception {
		
		System.out.println("------------");
		//读数据库
		//查询
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
		Query q = em.createNativeQuery("select * from chanpin", Item.class);
		
		product = q.getResultList();
		System.out.println(product.get(0).getName());
		System.out.println(product.get(0));
		em.getTransaction().commit();
		em.close();
		List<List<Item>> allproduct;
		allproduct=GetPaper.allPaper(product);
		allProductLength=allproduct.size();
		product=allproduct.get(allIdex);
	
		return "success";
	}

//管理员查询所有蔬菜
	@Action(value="/vegetableProduct",
			 results={
					 @Result(name="success",location="/admin.jsp"),
					 @Result(name="error",location="/error.jsp")
	}
	)
	
public String vegetableProduct() throws Exception {
		
		System.out.println("------------");
		//读数据库
		//查询
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
		Query q = em.createNativeQuery("select * from chanpin where type='蔬菜'", Item.class);
		
		product = q.getResultList();
		System.out.println(product.get(0).getName());
		System.out.println(product.get(0));
		em.getTransaction().commit();
		em.close();
		List<List<Item>> allproduct;
		allproduct=GetPaper.allPaper(product);
		allProductLength=allproduct.size();
		product=allproduct.get(allIdex);
		return "success";
	}

//管理员查询所有水果
	@Action(value="/fruitProduct",
			 results={
					 @Result(name="success",location="/admin.jsp"),
					 @Result(name="error",location="/error.jsp")
	}
	)
	
public String fruitProduct() throws Exception {
		
		System.out.println("------------");
		//读数据库
		//查询
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
		Query q = em.createNativeQuery("select * from chanpin where type='水果'", Item.class);
		
		product = q.getResultList();
		System.out.println(product.get(0).getName());
		System.out.println(product.get(0));
		em.getTransaction().commit();
		em.close();
		List<List<Item>> allproduct;
		allproduct=GetPaper.allPaper(product);
		allProductLength=allproduct.size();
		product=allproduct.get(allIdex);
	
		return "success";
	}

//删除产品
private int proId;
	
	@Action(value="/deleteProduct",
			results={
					@Result(name="success",type="redirectAction",location="/allProduct"),
					@Result(name="error",location="/error.jsp")
			}
			)
	public String deleteProduct(){
		
		System.out.println("id="+proId);
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
		Query q = em.createNativeQuery("delete from chanpin where id ="+proId, Item.class);		
	
		int i = q.executeUpdate();  
		
		System.out.println("i="+i);
		
	     em.getTransaction().commit();
		 em.close();
	     return "success";	
	     
	     
	}
	
	//根据ID查询单个产品
	private String proid;
	Item moitem;
	@Action(value="/modifyItem",
			results={
					@Result(name="success",location="/modiProduct.jsp"),
					@Result(name="error",location="/error.jsp")
			}
			)
	public String modifyitem(){
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
		Query q = em.createNativeQuery("select * from chanpin where id="+proid, Item.class);		
	
		moitem = (Item)q.getSingleResult();
	    System.out.println(moitem.getName());
	   
	     
	   
	     em.getTransaction().commit();
		 em.close();
	     return "success";	
	     
	     
	}
	//管理员修改产品
	
	private String productId;
	
	private String proname;
	private String protype;
	private String prostate;
	private String proprice;
	private String errorinfo;
	
	
	@Action(value="/modifyProduct",
			 results={
					 @Result(name="success",type="redirectAction",location="/allProduct"),
					 @Result(name="error",location="/error.jsp"),
					 @Result(name="input",location="/modiProduct.jsp")
					
	}
	)
	                 
	public String regisre() throws Exception {

	    System.out.println(productId);
		System.out.println(proname);
		System.out.println(protype);
		System.out.println(prostate);
		System.out.println(proprice);
		
		if(proname.equals("") || protype.equals("") || prostate.equals("") || proprice.equals("")){
			errorinfo="请把内容填写完整";
			return "input";
		}
		
		
		
		EntityManager em=factory.createEntityManager();//创建工厂对象
		em.getTransaction().begin();
		//添加一条记录
		
			String sql="update chanpin set name=:proname,type=:protype,state=:prostate,price=:proprice where id=:productId";
		    int i = em.createNativeQuery(sql)
			.setParameter("proname", proname)
			.setParameter("protype", protype)
			.setParameter("prostate",prostate)
			.setParameter("proprice", proprice)
			.setParameter("productId", productId)
			.executeUpdate();
		    System.out.println("i = " + i);
		 
		em.getTransaction().commit();//提交
		em.close();
		return "success";
		
}	
	
	public int getAmountcomment() {
		return amountcomment;
	}
	public void setAmountcomment(int amountcomment) {
		this.amountcomment = amountcomment;
	}
	public List<PingLun> getPinglun() {
		return pinglun;
	}
	public void setPinglun(List<PingLun> pinglun) {
		this.pinglun = pinglun;
	}
	public List<PingLun> getLatter() {
		return latter;
	}
	public void setLatter(List<PingLun> latter) {
		this.latter = latter;
	}
	public String getSelectproduct() {
		return selectproduct;
	}
	public void setSelectproduct(String selectproduct) {
		this.selectproduct = selectproduct;
	}
	public String getProid() {
		return proid;
	}
	public void setProid(String proid) {
		this.proid = proid;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public String getProtype() {
		return protype;
	}
	public void setProtype(String protype) {
		this.protype = protype;
	}
	public String getProstate() {
		return prostate;
	}
	public void setProstate(String prostate) {
		this.prostate = prostate;
	}
	public String getProprice() {
		return proprice;
	}
	public void setProprice(String proprice) {
		this.proprice = proprice;
	}
	public String getErrorinfo() {
		return errorinfo;
	}
	public void setErrorinfo(String errorinfo) {
		this.errorinfo = errorinfo;
	}
	public Item getMoitem() {
		return moitem;
	}
	public void setMoitem(Item moitem) {
		this.moitem = moitem;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public int getProId() {
		return proId;
	}

	public void setProId(int proId) {
		this.proId = proId;
	}

	public List<Item> getProduct() {
		return product;
	}

	public void setProduct(List<Item> product) {
		this.product = product;
	}

	public List<Item> getRelate() {
		return relate;
	}






	public void setRelate(List<Item> relate) {
		this.relate = relate;
	}






	public List<Item> getRelateItems() {
		return relateItems;
	}





	public void setRelateItems(List<Item> relateItems) {
		this.relateItems = relateItems;
	}





	public Item getItem() {
		return item;
	}



	public void setItem(Item item) {
		this.item = item;
	}



	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}
	
	public List<PingLun> getPingluns() {
		return pingluns;
	}


	public void setPingluns(List<PingLun> pingluns) {
		this.pingluns = pingluns;
	}
	
}
