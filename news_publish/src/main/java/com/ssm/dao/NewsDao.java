package com.ssm.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.ssm.po.News;
/*
 * 新闻别DAO层接口
 */
public interface NewsDao {
	//获取当前类别信息数量
	int getNewsCount(@Param("keywords") String keywords, @Param("newsListCategoryId") Integer newsListCategoryId);
	//获取当前类别信息列表
	List<News> findNewsList(@Param("keywords") String keywords, @Param("newsListCategoryId") Integer newsListCategoryId, @Param("startRows") Integer startRows, @Param("pageSize") Integer pageSize);
	News getNewsByNewsId(Integer newsId);
	int addNews(News news);
	int updateNews(News news);
	int setNewsPublishStatus(News news);
	int delNews(Integer newsId);
}