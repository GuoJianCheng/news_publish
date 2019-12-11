package com.ssm.service.impl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssm.dao.CategoryDao;
import com.ssm.po.Category;
import com.ssm.service.CategoryService;
@Service("categoryService")
/*
 * 新闻类别Service接口实现类
 */
public class CategoryServiceImpl implements CategoryService {
	//注入RoleDao
	@Autowired
	private CategoryDao categoryDao;
	@Override
	public List<Category> findCategoryList() {
		return this.categoryDao.selectCategoryList();
	}
	@Override
	public Category findCategoryById(Integer categoryId) {
		return this.categoryDao.getCategoryById(categoryId);
	}
}
