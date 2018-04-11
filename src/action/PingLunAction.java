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


import com.dcxy.data.PingLun;
import com.dcxy.data.User;
import com.dcxy.dbutil.DBUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

//参考http://www.cnblogs.com/CheeseZH/archive/2013/03/05/2943899.html

public class PingLunAction extends ActionSupport {
	private EntityManagerFactory factory = DBUtil.getFactory();
	int uId=(int) ActionContext.getContext().getSession().get("userId");
	
	
	//添加评论功能
	private int id;
	private String uname;
	private int cid;
	private String neirong;
	private Date ptime;
	private String pphoto;
	String errorinfo;
	User user;
    List<PingLun> pinglun;
    private  int Pid;
	public int getPid() {
		return Pid;
	}
	public void setPid(int pid) {
		Pid = pid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<PingLun> getPinglun() {
		return pinglun;
	}
	public void setPinglun(List<PingLun> pinglun) {
		this.pinglun = pinglun;
	}
	public String getErrorinfo() {
		return errorinfo;
	}
	public void setErrorinfo(String errorinfo) {
		this.errorinfo = errorinfo;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getNeirong() {
		return neirong;
	}
	public void setNeirong(String neirong) {
		this.neirong = neirong;
	}
	public Date getPtime() {
		return ptime;
	}
	public void setPtime(Date ptime) {
		this.ptime = ptime;
	}
	public String getPphoto() {
		return pphoto;
	}
	public void setPphoto(String pphoto) {
		this.pphoto = pphoto;
	}


    public List<String> getDataUrl() {
        return dataUrl;
    }


    public void setDataUrl(List<String> dataUrl) {
        this.dataUrl = dataUrl;
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
  

    //文件从浏览器上传到服务端时， 分为三个部分
    private List<File> file;//文件对象， 包含文件流

    private List<String> fileFileName;//文件的名称

    private List<String> fileContentType;//文件的类型

    private List<String> dataUrl;
    

    //添加评论
    @Action(value="/pinglun",
    		results={
    					@Result(name="success",type="redirectAction", location="/item?id=${cid}"),
    					@Result(name="error", location="/error.jsp")
    				}
    			)
    public String upload() throws Exception {
    	
    	EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
    	System.out.println("-------------------------");
    	
    	System.out.println(id);
		System.out.println(uname);
		System.out.println(cid);
		System.out.println(neirong);
		System.out.println(ptime);
		String login=(String)ActionContext.getContext().getSession().get("login");
		if(login==null){
			return "login";
		}
		int uId=(int) ActionContext.getContext().getSession().get("userId");
	 	//查询用户
	 	 Query y = em.createNativeQuery("select * from  user where id ="+uId, User.class);		
		 	user = (User)y.getSingleResult();
	 	    uname=user.getName();
	 	    System.out.println("uname="+uname);
	     
		if(uname==""||neirong==""){
			errorinfo="请检查填写情况！";
			return "input";
		}
    	
    	//在服务端执行这个upload， 目的是组装文件
        dataUrl = new ArrayList<String>();

        String imgpath = "Itempicture/";
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
        
        
//        EntityManager em = factory.createEntityManager();
//		em.getTransaction().begin();
//		
		String sql = "insert into pinglun (uname,cid,neirong,ptime,pphoto) values (:uname, :cid, :neirong, :ptime, :pphoto)";
		em.createNativeQuery(sql)
		.setParameter("uname", uname)
		.setParameter("cid", cid)
		.setParameter("neirong", neirong)
		.setParameter("ptime",new Date())
		.setParameter("pphoto",this.getFileFileName().get(0))
		.executeUpdate();
		em.getTransaction().commit();
		em.close();
	    
        
        return "success";
    }

    
    
    
    //查看自己的评论
    
    
    
    @Action(value="/zijipinglun",
			 results={
					 @Result(name="success",location="/zijipinglun.jsp"),
					 @Result(name="error",location="/error.jsp")
	}
	)
	
    
    
    
public String doAllProduct() throws Exception {
		
		System.out.println("------------");
		
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
		Query y = em.createNativeQuery("select * from user where id = "+uId, User.class);
		user = (User)y.getSingleResult();
		
		 Query x = em.createNativeQuery("select * from  pinglun where uname ='"+getUser().getName()+"'", PingLun.class);		
		 pinglun =x.getResultList();

		
		em.getTransaction().commit();
		em.close();
	
		return "success";
	}
   
private int proId;
	




//删除自己的评论
	@Action(value="/deletepinglun",
			results={
					@Result(name="success",type="redirectAction",location="/zijipinglun"),
					@Result(name="error",location="/error.jsp")
			}
			)
	public String deleteProduct(){		
		System.out.println("id="+Pid  );
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		boolean find=false;
		Query q = em.createNativeQuery("delete from pinglun where id ="+Pid, PingLun.class);		
		int i = q.executeUpdate();  
		
		System.out.println("i="+i);
		
	     em.getTransaction().commit();
		 em.close();
	     return "success";	
	     	     
	}
   
   
    
    
    
    
   
}
