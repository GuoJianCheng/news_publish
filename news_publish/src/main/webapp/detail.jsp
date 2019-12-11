<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
		<style>
		.copyRight{
			width:100%;
			height:120px;
			background:#336699;
			/*position: absolute;*/
		}
			#logo{width:100%;background-color: #f9fafa;}	
			.row{margin-left: 0px;margin-right: 0px;}		
			#logo ul{float:right;}
			#logo ul li{list-style: none;float:left;padding: 5px 10px;line-height: 24px;}
			.logoI{float:left;}	
			.divider{width:100%;height:3px;background:#336699;}
			
			.nav_title{
				
			}
			.nav_title .title{
				text-align: center;
			}
			.nav_title p{
				margin-top: 30px;
				text-align: center;
				font-size: 12px;
				color: #999999;
			}
			.nav_title .posttime{
				margin-right: 30px;
			}
			.nav_title .source{
				
			}
			.nav_title span{
				/*margin-left: 200px;*/
				
			}
			.content{
				width:100%;
				margin-top: 30px;
				margin-left: auto;
				margin-right: auto;
				line-height: 26px;
			}
			.content p{
				font-size: 14px;
			}
			.bottom{
				width:100%;
				margin-top: 80px;
			}
			.view{
				
				float: right;
			}
			.view img{
				width:18px;
				height:18px;
				display: block;
				padding: 0px;
				margin:0px;
				/*line-height: 18px;*/
				float:left;
			}
			.view p{
				float:left;
				font-size: 12px;
				margin-top: 0px;
				margin-left: 6px;
				/*line-height: 18px;*/
			}
			.view span{
				display:inline-block;
				/*margin-top: 6px;*/
			}
		</style>
	</head>
	<body>
		<div class="container" style="min-height:700px;">
			<!--头部-->
    		<%@include file="header.jsp" %>    		
			<div class="site">
				<p>
					<span>当前位置：</span>
					<span>首页</span>
					<span>&gt;</span>
					<span>${news.categoryName}</span>
					<span>&gt;</span>
					<span>正文</span>
				</p>
			</div>
			<div class="divider"></div>
			<div class="nav_title">
				<h3 class="title">${news.title }</h3>
				<p>
					<span>发布时间：</span>
					<span class="posttime"><fmt:formatDate value="${news.publishTime}" pattern="yyyy-MM-dd HH:MM:ss"/></span>
					<span class="source">来源：<b style="font-weight: normal;">${news.author }</b></span>
					
				</p>
			</div>
			<div class="content">
			<p>
				${news.content }
				</p>
			</div>
			<div class="bottom">
			</div>
		</div>
		<!--版权页-->
   		  <%@include file="bottom.jsp" %>
	</body>
</html>
