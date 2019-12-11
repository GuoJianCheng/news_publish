<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>新闻系统</title>
		<!--BootStrap设计的页面支持响应式的 -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css"/>
		<!--引入JQuery的JS文件：JQuery的JS文件要在BootStrap的js的文件的前面引入-->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" ></script>
		<!--引入BootStrap的JS的文件-->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css" />
		<style>
			#logo{width:100%;background-color: #f9fafa;}	
			.row{margin-left: 0px;margin-right: 0px;}		
			#logo ul{float:right;}
			#logo ul li{list-style: none;float:left;padding: 5px 10px;line-height: 24px;}
			.logoI{float:left;}	
			.divider{width:100%;height:3px;background:#336699;}
			.ad{width:100%;background:#336699;margin-top: 18px;float:left}
			.ad img{width:100%;}
			.message{width:100%;float:left;height:36px;margin-top: 2px;}			
			.message img{width:40px;height:40px;}
			.message span{line-height: 36px;}
			.message span a{}
			.message .time{float:right;margin-right: 30px;}
			.pages{width:100%;text-align: center;}			
			.pages a{margin-right: 10px;font-size: 14px;}
			.pages p{line-height: 18px;}
			.pages b{font-weight: normal;}
			.copyRight{width:100%;height:120px;background:#336699;}
		</style>
	</head>
	<body>
		<div class="container" style="min-height:660px;">		
			<!--头部-->
    		<%@include file="header.jsp" %>
			<div class="site">
				<p>
					<span>当前位置：</span>
					<span>首页</span>
					<span>&gt;</span>
					<span>${category.categoryName }</span>
					<input id="categoryId" name="categoryId" value="${category.categoryId}" type="hidden" />	
				</p>
			</div>
			<div class="divider"></div>
			<div style="height:10px;"></div>
			<div>
				<div class="col-md-3-1">
					<div class="ad">
						<img src="images/timg.jpg" width="250px" height="165px"/>
						<div style="background-color:white;">&nbsp;</div>
						<img src="images/timg2.jpg"  width="250px" height="165px"/>
					</div>
				</div>
				<div class="col-md-9" valign="top">
				<c:if test="${!empty pb.list}">
				<c:forEach items="${pb.list}" var="news">
				<div class="message">
						<img src="images/z3.png" />
						<span><a href="${pageContext.request.contextPath}/findFrontNewsByNewsId.action?newsId=${news.newsId}" target="_blank">
							<c:if test="${news.title.length()>430}">
										${fn:substring(news.title,0,40)}… 
   							</c:if>
   							<c:if test="${news.title.length()<=40}">
									${news.title}
							</c:if></a></span>
						<span class="time">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${news.publishTime}" pattern="yyyy-MM-dd"/></span>						
					</div>
				</c:forEach>
				<div style="width:100%;"  align="center">
				<div class="pagination" align="center">					
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
				</div>
				</c:if>
			<c:if test="${empty pb.list}">
				<div align="center">
					<br /> 暂无信息 <br /> <br />
				</div>
			</c:if>
					
				</div>
			</div>
		</div>
		<!--版权页-->
   		 <%@include file="bottom.jsp" %>
   		<script type="text/javascript">
		 function fy(gotoPageNo)
        {
			 var categoryId=document.getElementById("categoryId").value;
			 window.location="${pageContext.request.contextPath}/findNewsByCategoryIdPage.action?newsListCategoryId="+categoryId+"&currentPage=" + gotoPageNo ; 
        }
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
	</script>
	</body>
</html>
