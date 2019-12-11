package com.ssm.service.impl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssm.dao.NewsDao;
import com.ssm.po.News;
import com.ssm.service.NewsService;
import com.ssm.utils.PageBean;
/*
 * 新闻类别Service接口实现类
 */
@Service("newsService")
public class NewsServiceImpl implements NewsService {
	//注入NewsDao
	@Autowired
	private NewsDao newsDao;
	@Override
	public PageBean<News> findNewsByPage(String keywords, Integer newsListCategoryId, Integer currentPage,
			Integer pageSize) {
		//获取当前类别信息数量
		int count=newsDao.getNewsCount(keywords,newsListCategoryId);
		//求总页数
		int totalPage = (int) Math.ceil(count*1.0/pageSize);
		List<News> newsList=newsDao.findNewsList(keywords,newsListCategoryId,(currentPage-1)*pageSize,pageSize);
		PageBean<News> pb = new PageBean<>();
		pb.setCount(count);
		if(currentPage==0)currentPage=1;
		pb.setCurrentPage(currentPage);
		pb.setList(newsList);
		pb.setPageSize(pageSize);
		pb.setTotalPage(totalPage);
		return pb;
	}
	@Override
	public News getNewsByNewsId(Integer newsId) {
		return newsDao.getNewsByNewsId(newsId);
	}
	@Override
	public int setNewsPublishStatus(News news) {
		return newsDao.setNewsPublishStatus(news);
	}
	@Override
	public int addNews(News news) {
		return newsDao.addNews(news);
	}
	@Override
	public int editNews(News news) {
		return newsDao.updateNews(news);
	}
	@Override
	public int delNews(Integer newsId) {
		return newsDao.delNews(newsId);
	}
}
