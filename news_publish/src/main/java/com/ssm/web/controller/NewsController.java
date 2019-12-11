package com.ssm.web.controller;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ssm.po.Category;
import com.ssm.po.News;
import com.ssm.service.CategoryService;
import com.ssm.service.NewsService;
import com.ssm.utils.PageBean;
/*
 * 新闻控制类
 */
@Controller
public class NewsController {
	//依赖注入
	@Autowired
	private NewsService newsService;
	@Autowired
	private CategoryService categoryService;
	//查询新闻分页
	@RequestMapping(value="/findNewsByPage.action")
	public String findNewsByPage(String keywords,Integer newsListCategoryId,@RequestParam(defaultValue="1")Integer currentPage,@RequestParam(defaultValue="10")Integer pageSize,Model model){
		// 获取角色列表
		List<Category> categoryList = categoryService.findCategoryList();
		model.addAttribute("categoryList", categoryList);
		// 获取用户PageBean实例
		PageBean<News> pb=newsService.findNewsByPage(keywords,newsListCategoryId,currentPage,pageSize);
		model.addAttribute("pb", pb);
		model.addAttribute("keywords", keywords);
		model.addAttribute("newsListCategoryId", newsListCategoryId);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		return "news/news_list";
	}
	//设置新闻的状态（publishStatus：1：发布；2：撤稿）
	@RequestMapping(value = "/setNewsPublishStatus.action")
	@ResponseBody
	public News setNewsPublishStatus(@RequestBody News news, Model model) {
		int rows = newsService.setNewsPublishStatus(news);
		if (rows>0) {
			return news;
		}else{
			news.setNewsId(0);
			return news;
		}
	}
	//转向添加新闻
	@RequestMapping(value = "/toAddNews.action")
	public String toAddNews(Model model) {
		// 获取新闻类别列表
		List<Category> categoryList = categoryService.findCategoryList();
		model.addAttribute("categoryList", categoryList);
		return "news/add_news";
	}
	// 添加新闻
	@RequestMapping(value = "/addNews.action", method = RequestMethod.POST)
	public String addNews(News news, Model model) {
		Date date = new Date();
		news.setPublishTime(date);
		news.setPublishStatus("1");// 默认设置新闻为已发布状态
		int rows = newsService.addNews(news);
		// 添加成功，转向用户列表页面
		if (rows > 0) {
			return "redirect:findNewsByPage.action";
		} else {
			// 获取新闻类别列表
			List<Category> categoryList = categoryService.findCategoryList();
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("news", news);
			// 添加失败，转回添加用户页面
			return "news/add_news";
		}
	}
	// 修改新闻
	@RequestMapping(value = "/editNews.action", method = RequestMethod.POST)
	public String editNews(News news, Model model) {
		Date date = new Date();
		news.setPublishTime(date);
		news.setPublishStatus("1");// 默认设置新闻为已发布状态
		int rows = newsService.editNews(news);
		// 添加成功，转向用户列表页面
		if (rows > 0) {
			return "redirect:findNewsByPage.action";
		} else {
			// 获取新闻类别列表
			List<Category> categoryList = categoryService.findCategoryList();
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("news", news);
			// 添加失败，转回添加用户页面
			return "news/edit_news";
		}
	}
	// 转向修改新闻页面
	@RequestMapping(value = "/toEditNews.action")
	public String toEditNews(Integer newsId, Model model) {
		News news = newsService.getNewsByNewsId(newsId);
		if (news != null) {
			model.addAttribute("news", news);
			// 获取新闻类别列表
			List<Category> categoryList = categoryService.findCategoryList();
			model.addAttribute("categoryList", categoryList);
		}
		return "news/edit_news";
	}
	//删除新闻
	@RequestMapping(value = "/delNews.action")
	@ResponseBody
	public News delNews(@RequestBody News news, Model model) {
		int rows = newsService.delNews(news.getNewsId());
		if (rows>0) {
			return news;
		}else{
			news.setNewsId(0);
			return news;
		}
	}
	//根据新闻类别ID查询新闻分页（用于前台首页）
	@RequestMapping(value = "/index.action")
	public String index(HttpServletRequest request, HttpServletResponse response, String keywords, Integer newsListCategoryId,	@RequestParam(defaultValue = "1") Integer currentPage, @RequestParam(defaultValue = "10") Integer pageSize,	Model model) throws ServletException, IOException {
		// 获取用户PageBean实例
		PageBean<News> pb1 = newsService.findNewsByPage(keywords, 1, currentPage, pageSize);
		model.addAttribute("pb1", pb1);
		PageBean<News> pb2 = newsService.findNewsByPage(keywords, 2, currentPage, pageSize);
		model.addAttribute("pb2", pb2);
		return "../../first";
	}
	//根据新闻类别ID查询新闻分页（用于前台新闻列表页）
	@RequestMapping(value = "/findNewsByCategoryIdPage.action")
	public String findNewsByCategoryIdPage(HttpServletRequest request, HttpServletResponse response, String keywords, Integer newsListCategoryId,	@RequestParam(defaultValue = "1") Integer currentPage, @RequestParam(defaultValue = "1") Integer pageSize,	Model model){
		// 获取角色列表
		Category category = categoryService.findCategoryById(newsListCategoryId);
		model.addAttribute("category", category);
		// 获取用户PageBean实例
		PageBean<News> pb = newsService.findNewsByPage(keywords, newsListCategoryId, currentPage, pageSize);
		model.addAttribute("pb", pb);
		model.addAttribute("newsListCategoryId", newsListCategoryId);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		return "../../list";
	}
	//查询新闻（用于前台新闻内容页）
	@RequestMapping(value = "/findFrontNewsByNewsId.action")
	public String findFrontNewsByNewsId(Integer newsId,Model model) {
		News news = newsService.getNewsByNewsId(newsId);
		if (news != null) {
			model.addAttribute("news", news);
		}
		return "../../detail";
	}
}