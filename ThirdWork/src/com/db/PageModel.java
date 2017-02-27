package com.db;

import java.util.List;

public class PageModel<T> {
	private List<T> list;
	private int currentPage;
	private int pagesize;
	private int totalRecord;
	public int totalPage(){
		return (totalRecord+pagesize-1)/pagesize;
	}
	public int firstPage(){
		return 1;
	}
	public int pageUp(){
		if(currentPage<=1){
			return 1;
		}
		return currentPage-1;
	}
	public int pageDown(){
		if(currentPage>=this.totalPage()){
			return this.totalPage();
		}
		return currentPage+1;
	}
	public int lastPage(){
		return this.totalPage();
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	
}
