package action;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.dcxy.data.Cart;
import com.dcxy.data.Favorite;
import com.dcxy.data.Item;
import com.dcxy.dbutil.DBUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FavoriteAction  extends ActionSupport{

	
	private static final long serialVersionUID = 1L;
	private EntityManagerFactory factory=DBUtil.getFactory();
	private int proId;
	private List<Favorite> favorite;
	int fai;
	//添加到收藏夹
	@Action(value="/addFavorite",
			results={
					@Result(name="success",type="redirectAction",location="/index"),
					@Result(name="error",location="/error.jsp"),
					@Result(name="login",location="/login.jsp")
					
			}
			)
	
	public String addToCart(){
		System.out.println("proId="+proId);
		ActionContext ac=ActionContext.getContext();
		Map<String,Object> sess=ac.getSession();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		//判断用户是否登录
		String login=(String)ActionContext.getContext().getSession().get("login");
		if(login==null){
			return "login";
		}
		//获得用户ID
		int userId=(int) ActionContext.getContext().getSession().get("userId");
		Query qu = em.createNativeQuery("SELECT * from favorite where userId="+userId, Favorite.class);		
		favorite = qu.getResultList();
	  // System.out.println(favorite.get(0));
	    for(int j=0;j<favorite.size();j++){
		if(favorite.get(j).getProid()==proId){
			
			int id=favorite.get(j).getId();
			System.out.println("----favoriteid="+id);
			fai=1;
			sess.put("fai", fai);
			System.out.println("fai="+fai);
		    em.getTransaction().commit();
			em.close();
		    return "success";
		}
	    }
		Query q = em.createNativeQuery("insert into favorite(userId,proId) values(:userId,:proId)");
		q.setParameter("userId", userId);
		q.setParameter("proId",proId);
		
		
		 fai=q.executeUpdate();
		System.out.println("fai="+fai);
		sess.put("fai", fai);
		
		em.getTransaction().commit();
		em.close();
		
		return "success";
	//	return ActionSupport.NONE;
	}

	//根据用户查询收藏夹
		
		List<Favorite> favo ;
		List<Item> like;
		String arg1="";
		@Action(value="/allFavorite",
				 results={
						 @Result(name="success",location="/favoritelist.jsp"),
						 @Result(name="error",location="/error.jsp"),
						 @Result(name="login",location="/login.jsp")
						 
		}
		)
	public String doAllProduct() throws Exception {
			
			System.out.println("查询收藏夹");
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
			Query qu = em.createNativeQuery("SELECT * from favorite where userId="+userId, Favorite.class);		
		    favo = qu.getResultList();
		    System.out.println(favo.get(0).getProid());
		    
		    for(int i=0;i<favo.size();i++){
		    	
		    	arg1+= favo.get(i).getProid()+ ",";
		    	
		    	
//		    	if(carts.size()>i){
//		    	arg1+= carts.get(i).getItemId()+ ",";
//		    	}
//		    	if(carts.size()==i){
//		    		arg1+= carts.get(i).getItemId();
//		    	}
		    }
		    arg1=arg1.substring(0, arg1.length()-1);
		    System.out.println("arg1="+arg1);
//		    qu = em.createNativeQuery("SELECT * from chanpin  where id in (:ids)" ,Item.class);
		   
		    
		    qu = em.createNativeQuery("SELECT * from chanpin  where id in ("+arg1+")" ,Item.class);
	    	
		    
//		    qu.setParameter("ids", arg1);	  
	    	like=qu.getResultList();
	    	
			System.out.println(like.get(0));
			System.out.println(like.get(0).getName());
			em.getTransaction().commit();
			em.close();
		
			return "success";
		}


		Favorite fond;
		//删除购物车的商品
	private int productId;
		
		@Action(value="/deleteFavoriteProduct",
				results={
						@Result(name="success",type="redirectAction",location="/allFavorite"),
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
				Query qu = em.createNativeQuery("SELECT * from favorite where userId="+userId+ " and proId="+productId, Favorite.class);		
			    fond = (Favorite)qu.getSingleResult();
			    System.out.println(fond.getId());
			    
		    	System.out.println("productId="+productId);
			
			    Query q = em.createNativeQuery("delete from favorite where id ="+fond.getId(), Favorite.class);		
		   
			    int i = q.executeUpdate();  
			
			    System.out.println("i="+i);
			
		       em.getTransaction().commit();
			   em.close();
		       return "success";	
		     
		     
		}
		
	
		
	public List<Favorite> getFavo() {
			return favo;
		}



		public void setFavo(List<Favorite> favo) {
			this.favo = favo;
		}



		public List<Item> getLike() {
			return like;
		}



		public void setLike(List<Item> like) {
			this.like = like;
		}



		public String getArg1() {
			return arg1;
		}



		public void setArg1(String arg1) {
			this.arg1 = arg1;
		}



		public Favorite getFond() {
			return fond;
		}



		public void setFond(Favorite fond) {
			this.fond = fond;
		}



		public int getProductId() {
			return productId;
		}



		public void setProductId(int productId) {
			this.productId = productId;
		}



	public int getProId() {
		return proId;
	}


	public void setProId(int proId) {
		this.proId = proId;
	}


	public List<Favorite> getFavorite() {
		return favorite;
	}


	public void setFavorite(List<Favorite> favorite) {
		this.favorite = favorite;
	}
	
	
}
