package com.twodragonlake.privilege.model.privilege;

import java.io.Serializable;

import com.twodragonlake.privilege.model.BaseModel;

/**
 * @Comment:部门
 * @author bruce.liu
 * @Create Date 2014年3月11日
 */
@SuppressWarnings("serial")
public class Department extends BaseModel implements Serializable {
	/* 主键  32*/
	private String id;
	/*  名称  20 */
	private String name;
	/* 备注 80 */
	private String note;
	/* 父id 32 */
	private String pid;
	//是否leader 1标示是 0标示不是
	private int leader = 0;
	//easyUI树结构父节点id
	private String _parentId;
	
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
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
		this._parentId = pid;
	}
	public int getLeader() {
		return leader;
	}
	public void setLeader(int leader) {
		this.leader = leader;
	}
	
}
