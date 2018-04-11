package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.dcxy.data.Blog;
import com.dcxy.data.BlogComment;
import com.dcxy.data.Gonggao;
import com.dcxy.data.Item;
import com.dcxy.data.PingLun;
import com.dcxy.data.User;
import com.dcxy.dbutil.DBUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BlogAction extends ActionSupport{

	
	private static final long serialVersionUID = 1L;

	private EntityManagerFactory factory=DBUtil.getFactory();
	
	List<Blog> blog;
	
	List<Blog> newblog;
	Blog blog1;
	Blog blog2;
	Blog blog3;
	List<Blog> photos;
	//博客主页查询部分博客
		@Action(value="/bindex",
				results={
						@Result(name="success",location="/blogindex.jsp"),
						@Result(name="error",location="/error.jsp")
				}
				)
		public String index(){
			
			//读数据库
			EntityManager em = factory.createEntityManager();
			em.getTransaction().begin();
			boolean find=false;
			Query q = em.createNativeQuery("select * from blog order by btime desc limit 0,3", Blog.class);		
			 blog = q.getResultList();
		     System.out.println(blog.get(0));
		     
		     blog1=blog.get(0);
		     blog2=blog.get(1);
		     blog3=blog.get(2);
		     
		     em.getTransaction().commit();
				em.close();
		     return "success";	
		}
		
	//查询所有博客
		
		@Action(value="/allblog",
				results={
						@Result(name="success",location="/allblog.jsp"),
						@Result(name="error",location="/error.jsp")
				}
				)
		public String allblog(){
			
			//读数据库
			EntityManager em = factory.createEntityManager();
			em.getTransaction().begin();
			boolean find=false;
			Query q = em.createNativeQuery("select * from blog order by btime DESC,id DESC  ", Blog.class);		
			 blog = q.getResultList();
		     System.out.println(blog.get(0));
		     
		     blog1=blog.get(0);
		     blog2=blog.get(1);
		     blog3=blog.get(2);
		     
		     em.getTransaction().commit();
				em.close();
		     return "success";	
		}
		
//博客所有照片
		@Action(value="/allphotos",
				results={
						@Result(name="success",location="/photos.jsp"),
						@Result(name="error",location="/error.jsp")
				}
				)
		public String allphotos(){
			
			//读数据库
			EntityManager em = factory.createEntityManager();
			em.getTransaction().begin();
			boolean find=false;
			Query q = em.createNativeQuery("select * from blog order by btime desc limit 0,3", Blog.class);		
			 blog = q.getResultList();
		     System.out.println(blog.get(0));
		     
		     blog1=blog.get(0);
		     blog2=blog.get(1);
		     blog3=blog.get(2);
		     
		    q = em.createNativeQuery("select * from blog order by btime DESC,id DESC ", Blog.class);		
			photos = q.getResultList();
		    System.out.println(photos.get(0));
		     
		     
		     em.getTransaction().commit();
				em.close();
		     return "success";	
		}
		
		
		@Action(value="/photos",
				results={
						@Result(name="success",location="/photos.jsp"),
						@Result(name="error",location="/error.jsp")
				}
				)
		public String photos(){
			
			//读数据库
			EntityManager em = factory.createEntityManager();
			em.getTransaction().begin();
			boolean find=false;
			Query q = em.createNativeQuery("select * from blog order by btime desc limit 0,3", Blog.class);		
			 blog = q.getResultList();
		     System.out.println(blog.get(0));
		     
		     blog1=blog.get(0);
		     blog2=blog.get(1);
		     blog3=blog.get(2);
		     
		    q = em.createNativeQuery("select * from blog order by btime desc limit 0,6", Blog.class);		
			photos = q.getResultList();
		    System.out.println(photos.get(0));
		     
		     
		     em.getTransaction().commit();
				em.close();
		     return "success";	
		}

		//内容详情
		int phoid;
		Blog blogdetails;
		List<BlogComment> comment;
		@Action(value="/singlephoto",
				results={
						@Result(name="success",location="/single.jsp"),
						@Result(name="error",location="/error.jsp")
				}
				)
		public String singlephoto(){
			
			//读数据库
			EntityManager em = factory.createEntityManager();
			em.getTransaction().begin();
			boolean find=false;
			System.out.println("phoid="+phoid);
			Query q = em.createNativeQuery("select * from blog where id="+phoid, Blog.class);		
			blogdetails = (Blog)q.getSingleResult();
		     System.out.println(blogdetails.getTitle());
		     
		     q = em.createNativeQuery("select * from blog order by btime desc limit 0,3", Blog.class);		
			 blog = q.getResultList();
		     System.out.println(blog.get(0));
		     
		     blog1=blog.get(0);
		     blog2=blog.get(1);
		     blog3=blog.get(2);
		     
		     q = em.createNativeQuery("select * from blogcomment  where bid="+phoid, BlogComment.class);		
			 comment = q.getResultList();
		 //    System.out.println(comment.get(0));
		     
		     em.getTransaction().commit();
				em.close();
		     return "success";	
		}

		//个人博客
		String arg1="";
		List<Blog> personblog;
		List<BlogComment> personcomment;
		BlogComment personcomment1;
		BlogComment personcomment2;
		BlogComment personcomment3;
		@Action(value="/person",
				results={
						@Result(name="success",location="/blog.jsp"),
						@Result(name="error",location="/error.jsp"),
						@Result(name="login",location="/login.jsp")
				}
				)
		public String person(){
			
			//读数据库
			EntityManager em = factory.createEntityManager();
			em.getTransaction().begin();
			boolean find=false;
			System.out.println("phoid="+phoid);
			//判断用户是否登录
			String login=(String)ActionContext.getContext().getSession().get("login");
			System.out.println(login);
			if(login==null){
				return "login";
			}
			//获得用户ID
			 int userId=(int) ActionContext.getContext().getSession().get("userId");
					
			 Query q = em.createNativeQuery("select * from blog  where usid="+userId, Blog.class);		
			 personblog = q.getResultList();
			 System.out.println(personblog.get(0));
		     
			 for(int i=0;i<personblog.size();i++){			    	
			    	arg1+= personblog.get(i).getId()+ ",";	
			    }
			    arg1=arg1.substring(0, arg1.length()-1);
			    System.out.println("arg1="+arg1);
	     
		     q = em.createNativeQuery("select * from blogcomment  where bid in ("+arg1+")", BlogComment.class);		
		     personcomment = q.getResultList();
		    if(personcomment.size()<=0){
		    	em.getTransaction().commit();
				em.close();
		     return "success";	
		    }else{
		     personcomment1=personcomment.get(0);
		    
		     em.getTransaction().commit();
				em.close();
		     return "success";	
		    }
		}

		//查看所有的个人评论
		String arg2="";
		
		List<BlogComment> allcomment;
		
		@Action(value="/singleperson",
				results={
						@Result(name="success",location="/comment.jsp"),
						@Result(name="error",location="/error.jsp")
						
				}
				)
		public String singleperson(){
			
			//读数据库
			EntityManager em = factory.createEntityManager();
			em.getTransaction().begin();
			boolean find=false;
			System.out.println("phoid="+phoid);
			
			//获得用户ID
			 int userId=(int) ActionContext.getContext().getSession().get("userId");
					
			 Query q = em.createNativeQuery("select * from blog  where usid="+userId, Blog.class);		
			 personblog = q.getResultList();
			 System.out.println(personblog.get(0));
		     
			 for(int i=0;i<personblog.size();i++){			    	
			    	arg1+= personblog.get(i).getId()+ ",";	
			    }
			    arg1=arg1.substring(0, arg1.length()-1);
			    System.out.println("arg1="+arg1);
	     
		     q = em.createNativeQuery("select * from blogcomment  where bid in ("+arg1+")", BlogComment.class);		
		     personcomment = q.getResultList();
		    
	
		     em.getTransaction().commit();
				em.close();
		     return "success";	
		}

		
		
		
		 //文件从浏览器上传到服务端时， 分为三个部分
	    private List<File> file;//文件对象， 包含文件流

	    private List<String> fileFileName;//文件的名称

	    private List<String> fileContentType;//文件的类型

	    private List<String> dataUrl;
	    
	    private String title;
	    private String details;
	    User user;
	    private String username;
	    String errorinfo;
	    //添加评论
	    @Action(value="/updateblog",
	    		results={
	    					@Result(name="success",type="redirectAction", location="/person"),
	    					@Result(name="error", location="/error.jsp"),
	    					@Result(name="input", location="/updateblog.jsp")
	    				}
	    			)
	    public String upload() throws Exception {
	    	
	    	EntityManager em = factory.createEntityManager();
			em.getTransaction().begin();
			boolean find=false;
	    	System.out.println("-------------------------");
	    	
	    	System.out.println("title="+title);
			System.out.println("details="+details);
			
			
			int uId=(int) ActionContext.getContext().getSession().get("userId");
		 	//查询用户
		 	 Query y = em.createNativeQuery("select * from  user where id ="+uId, User.class);		
			 	user = (User)y.getSingleResult();
		 	    username=user.getName();
		 	    System.out.println("uname="+username);
		     
			if(title==""){
				errorinfo="请给您的作品去一个响亮的名字";
				return "input";
			}
	    	
	    	//在服务端执行这个upload， 目的是组装文件
	        dataUrl = new ArrayList<String>();

	        String imgpath = "picture/";
	        for (int i = 0; i < file.size(); ++i) {
	            InputStream is = new FileInputStream(file.get(i));

	            String path = ServletActionContext.getServletContext().getRealPath("/");
	            System.out.println(path);
	        //    String root = "D:\\";

	            dataUrl.add(imgpath+this.getFileFileName().get(i));//把文件的路径添加到集合dataUrl
	            //根据文件全部路径， 文件名， 来建立一个新的文件
	            File destFile = new File(path+imgpath, this.getFileFileName().get(i));

	            OutputStream os = new FileOutputStream(destFile);

	            byte[] buffer = new byte[1024];

	            int length = 0;

	            while ((length = is.read(buffer)) > 0) {
	                os.write(buffer, 0, length);//把文件的内容写入到服务端的磁盘中
	            }

	            is.close();

	            os.close();
	        }
	        
	        
//	        EntityManager em = factory.createEntityManager();
//			em.getTransaction().begin();
//			
			String sql = "insert into blog (usid,username,title,details,photo) values (:uId, :username, :title, :details,:photo)";
		int i=	em.createNativeQuery(sql)
			.setParameter("uId", uId)
			.setParameter("username", username)
			.setParameter("title", title)
			.setParameter("details", details)
			.setParameter("photo",this.getFileFileName().get(0))
			.executeUpdate();
		
		System.out.println("i:"+i);
			em.getTransaction().commit();
			em.close();
		    
	        
	        return "success";
	    }

	   //删除博客 
	    private int blogId;
		
		@Action(value="/deleteblog",
				results={
						@Result(name="success",type="redirectAction",location="/person"),
						@Result(name="error",location="/error.jsp")
				}
				)
		public String deleteblog(){
			
			System.out.println("blogid="+blogId);
			EntityManager em = factory.createEntityManager();
			em.getTransaction().begin();
			boolean find=false;
			Query q = em.createNativeQuery("delete from blog where id ="+blogId, Blog.class);		
		
			int i = q.executeUpdate();  
			
			System.out.println("i="+i);
			
		     em.getTransaction().commit();
			 em.close();
		     return "success";	
		     
		     
		}
		
		//添加评论
		private int blogid;
		private String critic;
		@Action(value="/updatecomment",
				 results={
						 @Result(name="success",type="redirectAction",location="/singlephoto?phoid=${blogid}"),
						
		}
		)
		                 
		public String regisre() throws Exception {
	        EntityManager em=factory.createEntityManager();//创建工厂对象
			em.getTransaction().begin();
			System.out.println("critic="+critic);
			int uId=(int) ActionContext.getContext().getSession().get("userId");
		 	//查询用户
		 	 Query y = em.createNativeQuery("select * from  user where id ="+uId, User.class);		
			 	user = (User)y.getSingleResult();
		 	    username=user.getName();
		 	    System.out.println("uname="+username); 
		 	    System.out.println("blogid="+blogid);
			String sql="insert into blogcomment (bid, uname, usid,detalis) values (:blogid,:username, :uId,:critic)";
			    int i = em.createNativeQuery(sql)
				.setParameter("blogid", blogid)
				.setParameter("username", username)
				.setParameter("uId", uId)
				.setParameter("critic", critic)
				.executeUpdate();
			    System.out.println("i = " + i);
			
			em.getTransaction().commit();//提交
			em.close();
			return "success";
			
			
		}
		//删除评论
		
		 private int commentId;
			
			@Action(value="/deletecomment",
					results={
							@Result(name="success",type="redirectAction",location="/singleperson"),
							@Result(name="error",location="/error.jsp")
					}
					)
			public String deletecomment(){
				
				System.out.println("commentid="+commentId);
				EntityManager em = factory.createEntityManager();
				em.getTransaction().begin();
				boolean find=false;
				Query q = em.createNativeQuery("delete from blogcomment where id ="+commentId, BlogComment.class);		
			
				int i = q.executeUpdate();  
				
				System.out.println("i="+i);
				
			     em.getTransaction().commit();
				 em.close();
			     return "success";	
			     
			     
			}
		
			
		public String getArg2() {
				return arg2;
			}

			public void setArg2(String arg2) {
				this.arg2 = arg2;
			}

			public List<BlogComment> getAllcomment() {
				return allcomment;
			}

			public void setAllcomment(List<BlogComment> allcomment) {
				this.allcomment = allcomment;
			}

			public int getCommentId() {
				return commentId;
			}

			public void setCommentId(int commentId) {
				this.commentId = commentId;
			}

		public int getBlogid() {
			return blogid;
		}
		public void setBlogid(int blogid) {
			this.blogid = blogid;
		}
		public String getCritic() {
			return critic;
		}
		public void setCritic(String critic) {
			this.critic = critic;
		}
		public int getBlogId() {
			return blogId;
		}
		public void setBlogId(int blogId) {
			this.blogId = blogId;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getDetails() {
			return details;
		}
		public void setDetails(String details) {
			this.details = details;
		}
		public User getUser() {
			return user;
		}
		public void setUser(User user) {
			this.user = user;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getErrorinfo() {
			return errorinfo;
		}
		public void setErrorinfo(String errorinfo) {
			this.errorinfo = errorinfo;
		}
		public EntityManagerFactory getFactory() {
			return factory;
		}
		public void setFactory(EntityManagerFactory factory) {
			this.factory = factory;
		}
		public List<File> getFile() {
			return file;
		}
		public void setFile(List<File> file) {
			this.file = file;
		}
		public List<String> getFileFileName() {
			return fileFileName;
		}
		public void setFileFileName(List<String> fileFileName) {
			this.fileFileName = fileFileName;
		}
		public List<String> getFileContentType() {
			return fileContentType;
		}
		public void setFileContentType(List<String> fileContentType) {
			this.fileContentType = fileContentType;
		}
		public List<String> getDataUrl() {
			return dataUrl;
		}
		public void setDataUrl(List<String> dataUrl) {
			this.dataUrl = dataUrl;
		}
		public String getArg1() {
			return arg1;
		}
		public void setArg1(String arg1) {
			this.arg1 = arg1;
		}
		public List<Blog> getPersonblog() {
			return personblog;
		}
		public void setPersonblog(List<Blog> personblog) {
			this.personblog = personblog;
		}
		public List<BlogComment> getPersoncomment() {
			return personcomment;
		}
		public void setPersoncomment(List<BlogComment> personcomment) {
			this.personcomment = personcomment;
		}
		public BlogComment getPersoncomment1() {
			return personcomment1;
		}
		public void setPersoncomment1(BlogComment personcomment1) {
			this.personcomment1 = personcomment1;
		}
		public BlogComment getPersoncomment2() {
			return personcomment2;
		}
		public void setPersoncomment2(BlogComment personcomment2) {
			this.personcomment2 = personcomment2;
		}
		public BlogComment getPersoncomment3() {
			return personcomment3;
		}
		public void setPersoncomment3(BlogComment personcomment3) {
			this.personcomment3 = personcomment3;
		}
		public List<BlogComment> getComment() {
			return comment;
		}
		public void setComment(List<BlogComment> comment) {
			this.comment = comment;
		}
		public int getPhoid() {
			return phoid;
		}
		public void setPhoid(int phoid) {
			this.phoid = phoid;
		}
		public Blog getBlogdetails() {
			return blogdetails;
		}
		public void setBlogdetails(Blog blogdetails) {
			this.blogdetails = blogdetails;
		}
		public List<Blog> getPhotos() {
			return photos;
		}

		public void setPhotos(List<Blog> photos) {
			this.photos = photos;
		}

		public List<Blog> getBlog() {
			return blog;
		}

		public void setBlog(List<Blog> blog) {
			this.blog = blog;
		}

		public List<Blog> getNewblog() {
			return newblog;
		}

		public void setNewblog(List<Blog> newblog) {
			this.newblog = newblog;
		}

		public Blog getBlog1() {
			return blog1;
		}

		public void setBlog1(Blog blog1) {
			this.blog1 = blog1;
		}

		public Blog getBlog2() {
			return blog2;
		}

		public void setBlog2(Blog blog2) {
			this.blog2 = blog2;
		}

		public Blog getBlog3() {
			return blog3;
		}

		public void setBlog3(Blog blog3) {
			this.blog3 = blog3;
		}
	
	
}
