package com.ssm.utils;
import java.util.List;
public class PageBean<T> {
	//当前页码
	private int currentPage; 
	//每页显示新闻条数
	private int pageSize; 
	//新闻数量
	private int count;	
	//总页数
	private int totalPage;	
	//当前页的新闻集合列表 
	private List<T> list;	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
}