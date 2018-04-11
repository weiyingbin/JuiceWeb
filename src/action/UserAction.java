package action;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import org.omg.CORBA.Request;

import com.dcxy.data.Item;
import com.dcxy.data.User;
import com.dcxy.dbutil.DBUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private EntityManagerFactory factory=DBUtil.getFactory();
	
	
	//注册
	private String username;
	private String email;
	private String phone;
	private String pwd;
	private String errorinfo;
	private String email1;
	private String password;
	private String info;
	List<User> users;
	
	
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getErrorinfo() {
		return errorinfo;
	}
	public void setErrorinfo(String errorinfo) {
		this.errorinfo = errorinfo;
	}
	
	@Action(value="/doLogin",
			 results={
					 @Result(name="success",type="redirectAction",location="/index"),
					 @Result(name="admin",type="redirectAction",location="/allProduct"),
					 @Result(name="input",location="/login.jsp")
	}
	)
	
	public String doLogin() throws Exception {
		
		System.out.println(email1);
		System.out.println(password);
		if( email1==null || password==null ){
			return "input";
		}
		//读数据库， 比较
		//查询
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
		Query q = em.createNativeQuery("select * from user where email=:email1 and pwd=PASSWORD(:password)", User.class);
		q.setParameter("email1", email1);
		q.setParameter("password", password);
		List<User> users = q.getResultList();
		
		if(users.size()==1){
			if(users.get(0).getEmail().equals("admin@admin.com")){
				return "admin";
			}else{
			find=true;
			}
		}else{
			find=false;
		}
		
		em.getTransaction().commit();
		em.close();
		
		if(find==false){
			errorinfo="用户名或密码不正确！";
			return "input";
		}
		
		//记录登录状态
		
		ActionContext ac=ActionContext.getContext();
		  Map<String,Object> params=ac.getParameters();
		  String[] strs=(String[])params.get("email1");
		  System.out.println("email1="+strs[0]);
//		  strs=(String[])params.get("password");
//		  System.out.println("password="+strs[0]);
		  Map<String,Object> sess=ac.getSession();
		  
		  sess.put("userId", users.get(0).getId());
		  sess.put("email", strs[0]);
		  sess.put("login", "success");//记录登录状态
		  
		  System.out.println(ac.getName());
		return "success";
	}

	//struts框架会自动扫描action,actions包
	//@Action, 表示一个注解
	@Action(value="/doRegister",
			 results={
					 @Result(name="success",location="/login.jsp"),
					 @Result(name="input",location="/register.jsp"),
					 @Result(name="repetition",location="/register.jsp")
	}
	)
	                 
	public String regisre() throws Exception {

	
		System.out.println(username);
		System.out.println(email);
		System.out.println(phone);
		System.out.println(pwd);
		
		if(username.equals("") || email.equals("") || phone.equals("") || pwd.equals("")){
			errorinfo="请把内容填写完整";
			return "input";
		}
		
		
		
		EntityManager em=factory.createEntityManager();//创建工厂对象
		em.getTransaction().begin();
		//添加一条记录
		User user=new User();
		Query q = em.createNativeQuery("select * from user", User.class);		
		 users = q.getResultList();
	     System.out.println(users.get(0));
		for(int j=0;j<users.size();j++){
			if(users.get(j).getEmail().equals(email)){
				info="邮箱已注册，请直接登录！";
				return "repetition";
			}
			
			
		}
		String sql="insert into user (email, name, phone, pwd) values (:email,:namee, :phone, PASSWORD(:pwd))";
		    int i = em.createNativeQuery(sql)
			.setParameter("email", email)
			.setParameter("namee", username)
			.setParameter("phone", phone)
			.setParameter("pwd", pwd)
			.executeUpdate();
		    System.out.println("i = " + i);
		
		em.getTransaction().commit();//提交
		em.close();
		return "success";
		
		
	}
	
	//管理员查询所有用户
	@Action(value="/allUser",
			 results={
					 @Result(name="success",location="/manageUser.jsp"),
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
		Query q = em.createNativeQuery("select * from user", User.class);
		
		users = q.getResultList();
		System.out.println(users.get(0).getName());
		System.out.println(users.get(0));
		em.getTransaction().commit();
		em.close();
	
		return "success";
	}

	private int id;
	
	//管理员删除用户
	@Action(value="/deleteUser",
			results={
					@Result(name="success",type="redirectAction",location="/allUser"),
					@Result(name="error",location="/error.jsp")
			}
			)
	public String deleteid(){
		
		System.out.println("id="+id);
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
		Query q = em.createNativeQuery("delete from user where id ="+id, User.class);		
	
		int i = q.executeUpdate();  
		
		System.out.println("i="+i);
		
	     em.getTransaction().commit();
		 em.close();
	     return "success";	
	     
	     
	}
	//登出
	@Action(value="/loginout",
			 results={
					 @Result(name="success",type="redirectAction",location="/index"),
					 @Result(name="input",location="/login.jsp")
	}
	)
	
	
		public String execute() throws Exception {  
			ActionContext ac = ActionContext.getContext(); 
			Map session = ac.getSession(); 
			//ServletActionContext.getRequest().getSession().invalidate();
			session.put("email", " ");
			session.put("login","no");
			  	
		return "success";
	}
	
	//根据ID查询个人信息
		
		User modiuser;
		@Action(value="/selectUser",
				results={
						@Result(name="success",location="/modiuserinfo.jsp"),
						@Result(name="login",location="/login.jsp"),
						@Result(name="error",location="/error.jsp")
				}
				)
		public String selectUser(){
			
			//判断用户是否登录
			String login=(String)ActionContext.getContext().getSession().get("login");
			if(login==null){
				return "login";
			}
			int uid=(int) ActionContext.getContext().getSession().get("userId");
			
			EntityManager em = factory.createEntityManager();
			em.getTransaction().begin();
			boolean find=false;
			Query q = em.createNativeQuery("select * from user where id="+uid, User.class);		
		
			modiuser = (User)q.getSingleResult();
		    System.out.println(modiuser.getName());
		     em.getTransaction().commit();
			 em.close();
		     return "success";	
		     
		     
		}
		//用户修改个人信息
		
		private String usname;
		private String usemail;
		private String usphone;
		private String address;
		
		
		@Action(value="/modifyUser",
				 results={
						 @Result(name="success",type="redirectAction",location="/selectUser"),
						 @Result(name="error",location="/error.jsp"),
						 @Result(name="input",location="/modiuserinfo.jsp")
						
		}
		)
		                 
		public String modifyUser() throws Exception {
      
			int uId=(int) ActionContext.getContext().getSession().get("userId");
			
		    System.out.println(uId);
			System.out.println(usname);
			System.out.println(usemail);		
			System.out.println(usphone);
			System.out.println(address);
			 
			
			if(usname.equals("") || usemail.equals("") || usphone.equals("") ){
				errorinfo="请把内容填写完整";
				return "input";
			}
			
			
			
			EntityManager em=factory.createEntityManager();//创建工厂对象
			em.getTransaction().begin();
			//添加一条记录
			
				String sql="update user set name=:usname,email=:usemail,phone=:usphone,address=:address where id=:uId";
			    int i = em.createNativeQuery(sql)
				.setParameter("usname", usname)
				.setParameter("usemail", usemail)
				.setParameter("usphone",usphone)
				.setParameter("address",address)
				.setParameter("uId", uId)
				.executeUpdate();
			    System.out.println("i = " + i);
			 
			em.getTransaction().commit();//提交
			em.close();
			return "success";
			
	}	
		
	//修改密码
		
		private String opwd;
		private String pwd1;
		private String pwd2;
		User user;
		
		
		@Action(value="/mopwd",
				 results={
						 @Result(name="success",location="/mopwd.jsp"),
						 @Result(name="error",location="/error.jsp"),
						 @Result(name="input",location="/mopwd.jsp")
						
		}
		)
		                 
		public String mopwd() throws Exception {
      
			int uId=(int) ActionContext.getContext().getSession().get("userId");
			
		    System.out.println(uId);
			System.out.println(opwd);
			System.out.println(pwd1);		
			System.out.println(pwd2);
			
			EntityManager em=factory.createEntityManager();//创建工厂对象
			em.getTransaction().begin();
			//添加一条记录
			if(opwd.equals("") || pwd1.equals("") || pwd2.equals("") ){
				errorinfo="请把内容填写完整";
				return "input";
			}
			
			
			     Query q = em.createNativeQuery("select * from user where id="+uId+" and pwd=PASSWORD('"+opwd+"');", User.class);		
				 user =(User) q.getSingleResult();
			   //  System.out.println(user.getPwd());
				 
					if(user==null){
						errorinfo="密码不正确！";
						return "input";
					}				
			
			
			if(!pwd1.equals(pwd2)){
				errorinfo="两次密码不一致，请重新输入";
				return "input";
			}
			
			//添加一条记录
			
			String sql="update user set pwd=PASSWORD(:pwd1) where id=:uId";
		    int i = em.createNativeQuery(sql)
			.setParameter("pwd1", pwd1)
			.setParameter("uId", uId)
			.executeUpdate();
		    System.out.println("i = " + i);
		    
			em.getTransaction().commit();//提交
			em.close();
			errorinfo="密码修改成功！";
			return "input";
			
	}	
	
	
		//找回密码
				@Action(value="/zhpass",
						 results={
								 @Result(name="success",location="/login.jsp"),
								 @Result(name="input",location="/zhpass.jsp"),
								 @Result(name="repetition",location="/zhpass.jsp")
				}
				)
				                 
				public String zhpass() throws Exception {
					
					System.out.println(email);
					System.out.println(phone);
					System.out.println(pwd);
					
					if( email.equals("") || phone.equals("") || pwd.equals("")){
						errorinfo="请把内容填写完整";
						return "input";
					}
					
					
					
					EntityManager em=factory.createEntityManager();//创建工厂对象
					em.getTransaction().begin();
					//添加一条记录
					User user=new User();
					Query x = em.createNativeQuery("select * from user where email=:email", User.class);		
					 x.setParameter("email",email);
					users = x.getResultList();
				     System.out.println(users.get(0));
				     if(users.get(0).getPhone().equals(phone))
				     {
				    	 String sql="update user set pwd=PASSWORD(:pwd) where email = :email and phone = :phone";//修改，删除，新增
							
							int i = em.createNativeQuery(sql)
									.setParameter("email", email)
							.setParameter("phone", phone)
							.setParameter("pwd", pwd)
							.executeUpdate();
							em.getTransaction().commit();
						    System.out.println(sql);
						    return "success";
				     }
				     else{
							errorinfo="邮箱或者电话错误！";
							
							return "repetition";			
							}		
					
				}
			
		
		
		
		
		
		
		
		
		
		
	
	
	public String getOpwd() {
			return opwd;
		}
		public void setOpwd(String opwd) {
			this.opwd = opwd;
		}
		public String getPwd1() {
			return pwd1;
		}
		public void setPwd1(String pwd1) {
			this.pwd1 = pwd1;
		}
		public String getPwd2() {
			return pwd2;
		}
		public void setPwd2(String pwd2) {
			this.pwd2 = pwd2;
		}
	public User getModiuser() {
			return modiuser;
		}
		public void setModiuser(User modiuser) {
			this.modiuser = modiuser;
		}
		public String getUsname() {
			return usname;
		}
		public void setUsname(String usname) {
			this.usname = usname;
		}
		public String getUsemail() {
			return usemail;
		}
		public void setUsemail(String usemail) {
			this.usemail = usemail;
		}
		public String getUsphone() {
			return usphone;
		}
		public void setUsphone(String usphone) {
			this.usphone = usphone;
		}
	
	public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
}
