<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/pagination.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
 </head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">新闻列表</a></li>
    </ul>
    </div>    
    <div class="rightinfo">    
    <div class="tools">    
    	<ul class="toolbar">
        <li class="click"><a href="${pageContext.request.contextPath}/toAddNews.action"><span><img src="images/t01.png" /></span>发布新闻</a></li>
        </ul>
       </div>
       <form action="${pageContext.request.contextPath}/findNewsByPage.action" id="newsListForm"
			name="ff" method="post">
			<ul class="seachform">
				<li><label>&nbsp;&nbsp;&nbsp;&nbsp;搜索关键词:</label>
				<input name="keywords" value="${keywords}" placeholder="这里输入标题或关键词" type="text" style="width: 400px;" class="scinput" /></li>
				<li><label style="width: 60px;">新闻类别：</label> <select
					name="newsListCategoryId" id="newsListCategoryId" class="dfinput">
						<option value="">--请选择--</option>
						<c:forEach items="${categoryList}" var="c">
							<option value="${c.categoryId}" <c:if test="${c.categoryId eq newsListCategoryId }">selected="selected"</c:if>>&nbsp;&nbsp;&nbsp;&nbsp;${c.categoryName }</option>
						</c:forEach>
				</select></li>
				<li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询" /></li>
			</ul>
   		 <table class="tablelist" >
	    	<thead>
	    	<tr>
	        <th style="width:100px;text-align:center;">新闻标题</th>
	        <th style="width:100px;text-align:center;">新闻类别</th>
	        <th style="width:100px;text-align:center;">发布/更新时间</th>
	        <th style="width:100px;text-align:center;">发布状态</th>
	        <th style="width:200px;text-align:center;">操作</th>
	        </tr>
	        </thead>
				<tbody>
				<c:if test="${!empty pb.list}">	
					<c:forEach items="${pb.list}" var="news">	
						<tr>
							<td align="center">${news.title}</td>
							<td align="center">${news.categoryName}</td>
							<td align="center"><fmt:formatDate value="${news.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td align="center">
							<c:if test="${news.publishStatus=='1'}" var="flag">
								已发布
			                </c:if> 
			                <c:if test="${not flag}">
			                	已撤稿
			                </c:if>
							</td>
						    <td align="center">
								<a href="${pageContext.request.contextPath}/toEditNews.action?newsId=${news.newsId}">修改</a>
								<c:if test="${news.publishStatus=='2'}" var="status_flag">
									&nbsp;|&nbsp;<a href='#' onclick="upNews(${news.newsId})">发布</a>
			                    </c:if> 
			                    <c:if test="${not status_flag}">
			                    	&nbsp;|&nbsp;<a href='#' onclick="downNews(${news.newsId})">撤稿</a> 
			                    </c:if>
								&nbsp;|&nbsp;<a href='#' onclick="delNews(${news.newsId})">删除</a>
								</td>
						</tr>	
					</c:forEach>
					<tr>
					<td colspan="9" align="center">
					<div class="pagination">					
					第${pb.currentPage}页
						&nbsp;&nbsp; 共${pb.totalPage}页
						&nbsp;&nbsp; 共${pb.count}条新闻
					 <div style="height:10px;"></div>
					 <c:if test="${pb.currentPage==1}"> 首页&nbsp;&nbsp;上一页 </c:if>
						<c:if test="${pb.currentPage>1}">
							<a href='#' onclick="fy(1)">首页</a> 
							<a href='#' onclick="fy(${pb.currentPage-1})">上一页</a>
						</c:if> 
						<c:if test="${pb.currentPage<pb.totalPage}">
							<a href='#'	onclick="fy(${pb.currentPage+1})">下一页</a>
								<a	href='#' onclick="fy(${pb.totalPage})">尾页</a>
						</c:if>
						<c:if  test="${pb.currentPage==pb.totalPage}">下一页&nbsp;&nbsp;尾页</c:if> &nbsp;&nbsp;
						跳转至 <input type="text" style="height:22px;border: 1px solid #888;width:30px;border-radius: 0.2rem;" value="${gotoPageNo}" name="gotoPageNo" id="gotoPageNo"> 页 <a
						href='#' onclick="validate()">跳转</a>
				</div>
					</td>
					</tr>		
				</c:if>
			  <c:if test="${empty pb.list}">
				<div>
					<tr>
					<td colspan="5" align="center">
					暂无新闻
					</td>
					</tr>  
				</div>
			</c:if>					
          </tbody>
		</table>
		<script type="text/javascript">
		//翻页
		 function fy(gotoPageNo)
        {
			 var form=document.getElementById("newsListForm");
			 form.action="${pageContext.request.contextPath}/findNewsByPage.action?currentPage=" + gotoPageNo ;
			 form.submit();	  
        }
		//跳转验证
		function validate()
        {
			var totalPage=${pb.totalPage};
            var gotoPageNo = document.getElementById("gotoPageNo").value;
            if(gotoPageNo >totalPage || gotoPageNo <= 0 )
            {
                alert("你输入的页码有误！");
             }else{
            	fy(gotoPageNo)
           }
        }
		//新闻上架（发布）
		function upNews(newsId){
			$.ajax({
				url:"${pageContext.request.contextPath }/setNewsPublishStatus.action",
				type:"post",
				//data表示发送的数据
				data:JSON.stringify({newsId:newsId,publishStatus:1}),
				// 定义发送请求的数据格式为JSON字符串
				contentType:"application/json;charset=UTF-8",
				//定义回调响应的数据格式为JSON字符串，该属性可以省略
				dataType:"json",
				//成功响应的结果
				success:function(data){
					if(data!=null){
						if(data.newsId>0){
							alert("发布成功！");
							window.location.reload();							
						}else{
							alert("发布失败！");
							window.location.reload();
						}
					}
				}
	  		});
		}
		//新闻下架（撤稿）
		function downNews(newsId){
			$.ajax({
				url:"${pageContext.request.contextPath }/setNewsPublishStatus.action",
				type:"post",
				//data表示发送的数据
				data:JSON.stringify({newsId:newsId,publishStatus:2}),
				// 定义发送请求的数据格式为JSON字符串
				contentType:"application/json;charset=UTF-8",
				//定义回调响应的数据格式为JSON字符串，该属性可以省略
				dataType:"json",
				//成功响应的结果
				success:function(data){
					if(data!=null){
						if(data.newsId>0){
							alert("撤稿成功！");
							window.location.reload();							
						}else{
							alert("撤稿失败！");
							window.location.reload();
						}
					}
				}
	  		});
		}
		//删除新闻
		function delNews(newsId){
			if(window.confirm("您确定要删除吗？"))
			{
				$.ajax({
					url:"${pageContext.request.contextPath }/delNews.action",
					type:"post",
					//data表示发送的数据
					data:JSON.stringify({newsId:newsId}),
					// 定义发送请求的数据格式为JSON字符串
					contentType:"application/json;charset=UTF-8",
					//定义回调响应的数据格式为JSON字符串，该属性可以省略
					dataType:"json",
					//成功响应的结果
					success:function(data){
						if(data!=null){
							if(data.newsId>0){
								alert("删除成功！");
								window.location.reload();							
							}else{
								alert("删除失败！");
								window.location.reload();
							}
						}
					}
		  		});
			}
		}
	</script>
	</form>
    </div>
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>



