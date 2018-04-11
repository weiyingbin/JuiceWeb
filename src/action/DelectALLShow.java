package action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.dcxy.data.PingLun;
import com.dcxy.getPaper.DealAllRemark;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class DelectALLShow extends ActionSupport {
	private List<PingLun> list;
	private int cid;
	@Action(value="/showAllLists",
			results={
					@Result(name="success",location="/managePingLun.jsp"),
					@Result(name="error",location="/error.jsp")
					
			}
			)
    public String showAllList(){
		System.out.println("showAllList");
		if(cid==0){
			
			list=DealAllRemark.getAllRemark();
		}else {
			list=DealAllRemark.idGetRemark(cid) ;
		}
		if(list.size()>0)
		{
			return "success";
		}else return "error";
	}
	public List<PingLun> getList() {
		return list;
	}
	public void setList(List<PingLun> list) {
		this.list = list;
	}
	private int id;
	@Action(value="/deleteOneReark",
			results={
					@Result(name="success",type="redirectAction",location="/showAllLists"),
					@Result(name="error",location="/error.jsp")
					
			}
	
			)
	public String deleteOneReark(){
		if(this.id!=0){
			if(DealAllRemark.deleatReamrk(id)){}
			return "success";
			
		}
		return "error";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	
}
