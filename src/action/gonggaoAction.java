package action;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.dcxy.data.Gonggao;
import com.dcxy.data.Item;
import com.dcxy.data.PingLun;
import com.dcxy.dbutil.DBUtil;
import com.opensymphony.xwork2.ActionSupport;

public class gonggaoAction extends ActionSupport{
	private static final long serialVersionUID = 1L;

	private EntityManagerFactory factory=DBUtil.getFactory();
     List<Gonggao> gonggaos;	
     List<Gonggao> gonggaos1;
	Gonggao gonggao;
	int id;
	private int gid;


	private String  gname;	
	private String  gneirong;
	private Date gtime;	
	private String  gphoto;
	
	//主页显示所有公告
	@Action(value="/allgonggao",
			results={
					@Result(name="success",location="/index.jsp"),
					@Result(name="error",location="/error.jsp")
			}
			)
	public String allblog(){
		
		//读数据库
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
		Query q = em.createNativeQuery("select * from gonggao", Gonggao.class);		
		gonggaos = q.getResultList();
	    System.out.println(gonggaos.get(0));
	
	    em.getTransaction().commit();
		em.close();
        return "success";	
}
	
	
	
	
	//显示公告详细界面
	@Action(value="/gonggao",
			results={
					@Result(name="success",location="/product_gonggao.jsp"),
					@Result(name="error",location="/error.jsp")
			}
			)
	public String gonggao(){
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
		Query q = em.createNativeQuery("select * from gonggao where gid="+id, Gonggao.class);			
		gonggao = (Gonggao)q.getSingleResult();
	    System.out.println(gonggao.getGid());
		
		
	     em.getTransaction().commit();
		 em.close();
	     return "success";	
}
	

	@Action(value="/gonggaos",
			results={
					@Result(name="success",location="/admin2.jsp"),
					@Result(name="error",location="/error.jsp")
			}
			)
	public String gonggaos(){
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
		Query q = em.createNativeQuery("select * from gonggao", Gonggao.class);		
		gonggaos = q.getResultList();
	    System.out.println(gonggaos.get(0));
	
	    em.getTransaction().commit();
		em.close();
        return "success";	
}
	
	
	
	//查找某商品的信息
	private String xxgid;
	Gonggao xxgonggao;
	@Action(value="/modigonggao",
			results={
					@Result(name="success",location="/modigonggao.jsp"),
					@Result(name="error",location="/error.jsp")
			}
			)
	public String modifygonggao(){
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
		Query q = em.createNativeQuery("select * from gonggao where gid="+xxgid, Gonggao.class);		
	
		xxgonggao = (Gonggao)q.getSingleResult();
	    System.out.println(xxgonggao.getGid());
	   
	     
	   
	     em.getTransaction().commit();
		 em.close();
	     return "success";	
	     
	     
	}
	
		
	
	
	//更改公告内容
	private String  newgname;	
	private String  newgneirong;
	private Date newgtime;	
	private String errorinfo;
	private String newgid;
		
	
	

	@Action(value="/modinewgonggao",
			 results={
					 @Result(name="success",type="redirectAction",location="/gonggaos"),
					 @Result(name="error",location="/error.jsp"),
					 @Result(name="input",location="/modigonggao.jsp")
					
	}
	)
	                 
	public String modinewgonggao() throws Exception {
		
		   System.out.println(newgname);
			System.out.println(newgneirong);
			System.out.println(newgtime);
			System.out.println(errorinfo);
			System.out.println(newgid);
		
		
		
		
	   		
		if(newgname.equals("") || newgneirong.equals("") ){
			errorinfo="请把内容填写完整";
			return "input";
			
		}
		
		
		
		EntityManager em=factory.createEntityManager();//创建工厂对象
		em.getTransaction().begin();
		//添加一条记录
		
			String sql="update gonggao set gname=:newgname,gneirong=:newgneirong,gtime=:newgtime where gid=:gid";
		    int i = em.createNativeQuery(sql)
			.setParameter("newgname", newgname)
			.setParameter("newgneirong", newgneirong)
			.setParameter("newgtime",new Date())
			.setParameter("gid", newgid)
			.executeUpdate();
		    System.out.println("i = " + i);
		 
		em.getTransaction().commit();//提交
		em.close();
		return "success";
		
}	
	
	//删除公告
	private String newgId;	
	@Action(value="/deletegonggao",
			results={
					@Result(name="success",type="redirectAction",location="/gonggaos"),
					@Result(name="error",location="/error.jsp")
			}
			)
	public String deletegonggao(){
		
		System.out.println("id="+newgId);
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
		Query q = em.createNativeQuery("delete from gonggao where gid ="+newgId, Gonggao.class);		
	
		int i = q.executeUpdate();  
		
		System.out.println("i="+i);
		
	     em.getTransaction().commit();
		 em.close();
	     return "success";	
	     
	     
	}
	
	public String getNewgid() {
		return newgid;
	}

	public void setNewgid(String newgid) {
		this.newgid = newgid;
	}
	
	public List<Gonggao> getGonggaos1() {
		return gonggaos1;
	}

	public void setGonggaos1(List<Gonggao> gonggaos1) {
		this.gonggaos1 = gonggaos1;
	}

	public String getXxgid() {
		return xxgid;
	}

	public void setXxgid(String xxgid) {
		this.xxgid = xxgid;
	}

	public Gonggao getXxgonggao() {
		return xxgonggao;
	}

	public void setXxgonggao(Gonggao xxgonggao) {
		this.xxgonggao = xxgonggao;
	}

	public String getNewgname() {
		return newgname;
	}

	public void setNewgname(String newgname) {
		this.newgname = newgname;
	}

	public String getNewgneirong() {
		return newgneirong;
	}

	public void setNewgneirong(String newgneirong) {
		this.newgneirong = newgneirong;
	}

	public Date getNewgtime() {
		return newgtime;
	}

	public void setNewgtime(Date newgtime) {
		this.newgtime = newgtime;
	}

	public String getErrorinfo() {
		return errorinfo;
	}

	public void setErrorinfo(String errorinfo) {
		this.errorinfo = errorinfo;
	}

	public String getNewgId() {
		return newgId;
	}

	public void setNewgId(String newgId) {
		this.newgId = newgId;
	}

	public List<Gonggao> getGonggaos() {
		return gonggaos;
	}

	public void setGonggaos(List<Gonggao> gonggaos) {
		this.gonggaos = gonggaos;
	}

	public Gonggao getGonggao() {
		return gonggao;
	}

	public void setGonggao(Gonggao gonggao) {
		this.gonggao = gonggao;
	}

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getGneirong() {
		return gneirong;
	}

	public void setGneirong(String gneirong) {
		this.gneirong = gneirong;
	}

	public Date getGtime() {
		return gtime;
	}

	public void setGtime(Date gtime) {
		this.gtime = gtime;
	}

	public String getGphoto() {
		return gphoto;
	}

	public void setGphoto(String gphoto) {
		this.gphoto = gphoto;
	}

	
	public EntityManagerFactory getFactory() {
		return factory;
	}

	public void setFactory(EntityManagerFactory factory) {
		this.factory = factory;
	}

	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}







	
	
	
	
	
	
	
	
}
