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

import com.dcxy.data.Gonggao;
import com.dcxy.data.Item;
import com.dcxy.dbutil.DBUtil;
import com.opensymphony.xwork2.ActionSupport;

public class AddgonggaoAction extends ActionSupport{
	private static final long serialVersionUID = 1L;

	private EntityManagerFactory factory=DBUtil.getFactory();
	private int gid;
	public int getGid() {
		return gid;
	}



	public void setGid(int gid) {
		this.gid = gid;
	}



	



	


	public Date getGtime() {
		return gtime;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getNeirong() {
		return neirong;
	}



	public void setNeirong(String neirong) {
		this.neirong = neirong;
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


	private String  name;	
	private String  neirong;
	private Date gtime;	
	private String  gphoto;
	private String errorinfo;	
	List<Gonggao> gonggaos;
	public List<Gonggao> getGonggaos() {
		return gonggaos;
	}



	public void setGonggaos(List<Gonggao> gonggaos) {
		this.gonggaos = gonggaos;
	}



	public String getErrorinfo() {
		return errorinfo;
	}



	public void setErrorinfo(String errorinfo) {
		this.errorinfo = errorinfo;
	}


	//文件从浏览器上传到服务端时， 分为三个部分
    private List<File> file;//文件对象， 包含文件流

    private List<String> fileFileName;//文件的名称

    private List<String> fileContentType;//文件的类型

    private List<String> dataUrl;
   
    
	
	
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



	public static long getSerialversionuid() {
		return serialVersionUID;
	}


//添加產品
	@Action(value="/addgonggao",
    		results={
    					@Result(name="success", type="redirectAction",location="/gonggaos"),
    					@Result(name="input", location="/error.jsp")
    				}
    			)
	
    public String additem() throws Exception {
    	System.out.println("207-------------------------");    	
    	System.out.println(gid);
		System.out.println(name);
		System.out.println(neirong);
		
		System.out.println(gphoto);
		if(name==""||neirong==""||gphoto==""){
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
        
        
        EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		String sql = "insert into  gonggao (gname,gneirong,gtime,gphoto) values (:gname, :gneirong, :gtime, :gphoto)";
		em.createNativeQuery(sql)
		.setParameter("gname", name)
		.setParameter("gneirong", neirong)
		.setParameter("gtime", new Date())	
		.setParameter("gphoto",this.getFileFileName().get(0))
		.executeUpdate();
		em.getTransaction().commit();
		em.close();		        
        
        return "success";
    }


}
