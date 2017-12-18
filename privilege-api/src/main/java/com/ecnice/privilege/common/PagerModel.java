package com.ecnice.privilege.common;

import java.util.List;


public class PagerModel<T> {
	public static final int PAGER_SIZE = 20;
	private long total;
	private List<T> datas;

	public PagerModel(){}
	
	public PagerModel(long total, List<T> datas) {
		this.total = total;
		this.datas = datas;
	}

	public List<T> getDatas() {
		return datas;
	}

	public void setDatas(List<T> datas) {
		this.datas = datas;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

}
