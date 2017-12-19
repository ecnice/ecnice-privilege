package com.twodragonlake.privilege.model.privilege;

import java.io.Serializable;
import java.util.List;

import com.twodragonlake.privilege.model.BaseModel;
import com.twodragonlake.privilege.utils.UrlUtils;

/**
 * @Comment:模块
 * @author bruce.liu
 * @Create Date 2014年3月11日
 */
@SuppressWarnings("serial")
public class Module extends BaseModel implements Serializable {
	//id 32
	private String id;
	//名称  20
	private String name;
	//链接 40
	private String url;
	//标示 20
	private String sn;
	/* 图片路径 40 */
	private String image;
	/* 模块的排序号 5 */
	private Integer orderNo;
	/* 父模块id 32*/
	private String pid;
	/* 系统id 32 */
	private String systemId;
	/* 每个模块绑定的权限值 */
	private Integer state;
	//easyUI树结构父节点id
    private String _parentId;
	/**
	 * 临时变量 操作权限集合
	 */
	private List<SystemPrivilegeValue> pvs ;
	
	/**
	 * 设置权限
	 * @param permission
	 * @param yes
	 */
	public void setPermission(int permission,boolean yes){
		int temp = 1;
		temp = temp << permission;
		if(yes){
			state |= temp;
		}else{
			state &= ~temp;
		}
	}
	
	/**
	 * 判断模块是否有这个位的权限
	 * @param permission
	 * @return
	 */
	public boolean getPermission(int permission){
		if(state==null) return false;
		int temp = 1;
		temp = temp << permission;
		temp &= state;
		if(temp != 0){
			return true;
		}
		return false;
	}
	
	public String get_parentId() {
		return _parentId;
	}

	public void set_parentId(String _parentId) {
		this._parentId = _parentId;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		//url：‘/’开头
		this.url = UrlUtils.handelModelUrl(url);
	}
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Integer getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
		this._parentId=pid;
	}
	public String getSystemId() {
		return systemId;
	}
	public void setSystemId(String systemId) {
		this.systemId = systemId;
	}
	
	public List<SystemPrivilegeValue> getPvs() {
		return pvs;
	}
	public void setPvs(List<SystemPrivilegeValue> pvs) {
		this.pvs = pvs;
	}
	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Module [id=" + id + ", name=" + name + ", url=" + url + ", sn=" + sn + ", image=" + image + ", orderNo="
				+ orderNo + ", pid=" + pid + ", systemId=" + systemId + ", pvs=" + pvs + ", state=" + state + "]";
	}
	
}
