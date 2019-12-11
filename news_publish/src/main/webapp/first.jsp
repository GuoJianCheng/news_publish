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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css"/>
		<!--引入JQuery的JS文件：JQuery的JS文件要在BootStrap的js的文件的前面引入-->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" ></script>
		<!--引入BootStrap的JS的文件-->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cc.css" />
		<style>
			#logo{
				width:100%;
			}
			#logo ul{float:right;}
			#logo ul li{
				list-style: none;
				float:left;				
				padding: 5px 10px;
				/*margin-top: 15px;*/
				line-height: 24px;
			}
			.logoI{
				float:left;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<!--头部-->
    		<%@include file="header.jsp" %>
			<!--轮播图-->
			<div style="margin-bottom: 10px;">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				  <!-- Indicators -->
				  <ol class="carousel-indicators">
				    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
				  </ol>
				  <!-- Wrapper for slides -->
				  <div class="carousel-inner" role="listbox">
				    <div class="item active">
				      <img src="images/s1.jpg" alt="...">
				      <div class="carousel-caption">
				       	 第一张图片XXX
				      </div>
				    </div>
				    <div class="item">
				      <img src="images/s2.jpg" alt="...">
				      <div class="carousel-caption">
				         	第二张图片XXX
				      </div>
				    </div>
				    <div class="item">
				      <img src="images/s3.jpg" alt="...">
				      <div class="carousel-caption">
				         	第三张图片XXX
				      </div>
				    </div>
				  </div>
				  <!-- Controls -->
				  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
			</div>
			<div style="margin-bottom: 20px;padding:0">			
				<div class="col-md-8" style="margin: 0;padding:0">
				<div class="inform">						
						<font style="font-size:20px;font-weight:bolder;">综合资讯</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/findNewsByCategoryIdPage.action?newsListCategoryId=2">MORE>></a>											
						<div class="divider"></div>
					</div>
					<div style="padding-left: 24px;padding-right: 15px;">
						<c:forEach items="${pb2.list}" var="news2">
						<div class="platformMessage" class="col-md-2 col-sm-4 col-xs-12">
							<img width="40px" src="images/z3.png"/><!--一个方框的图标-->
							<span><a href="${pageContext.request.contextPath}/findFrontNewsByNewsId.action?newsId=${news2.newsId}" target="_blank">
							<c:if test="${news2.title.length()>30}">
										${fn:substring(news2.title,0,30)}… 
   							</c:if>
   							<c:if test="${news2.title.length()<=30}">
									${news2.title}
							</c:if></a></span>
							<span class="time">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${news2.publishTime}" pattern="yyyy-MM-dd"/></span>
						</div>	
						</c:forEach>
					</div>
				</div>
				<div class="col-md-4" style="padding-left: 0px;">
					<!--<img src="img/big01.jpg" height="430"/>-->
					<div class="inform">						
						<font style="font-size:20px;font-weight:bolder;">今日头条</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/findNewsByCategoryIdPage.action?newsListCategoryId=1">MORE>></a>											
						<div class="divider"></div>
					</div>
					<div class="informMessage" style="padding-left:24px;">
						<c:forEach items="${pb1.list}" var="news1">
						<div>
							<img width="40px" src="images/z3.png"  />
							<span><a href="${pageContext.request.contextPath}/findFrontNewsByNewsId.action?newsId=${news1.newsId}" target="_blank">
							 <c:if test="${news1.title.length()>15}">
										${fn:substring(news1.title,0,15)}… 
   							</c:if>
   							<c:if test="${news1.title.length()<=15}">
									${news1.title}
							</c:if>
							</a></span>
						</div>
						</c:forEach>
						<br/>
					</div>
				</div>
			</div>
			
		<!--版权页-->
   		 <%@include file="bottom.jsp" %>
   		 </div>
	</body>
	<script>
		$(function(){
			$(".footer div span").hover(function(){
				//$(this).slibling('span').removeClass('cur');
				$(this).addClass('cur');
			},function(){
				$(this).removeClass('cur');
			});
		});
	</script>
</html>

