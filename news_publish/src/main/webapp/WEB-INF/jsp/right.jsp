<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>right.jsp</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    </ul>
    </div>
    <div class="mainindex">
    <div class="welinfo">
    <b> ${sessionScope.login_user.userName }，你好！欢迎使用新闻发布管理系统</b>
    </div>
    <div class="xline"></div>
    <ul class="iconlist">
			<c:choose>
				<c:when test="${sessionScope.login_user.roleId==1}">
				<li><img src="images/ico07.png"
						style="width: 50px; height: 50px;" />
					<p>
							<a href="${pageContext.request.contextPath}/findUserList.action">用户管理</a>
						</p></li>
					<li><img src="images/ico03.png"
						style="width: 50px; height: 50px;" />
					<p>
							<a href="${pageContext.request.contextPath}/findCategoryList.action">信息类别管理</a>
						</p></li>
				</c:when>
				<c:when test="${sessionScope.login_user.roleId==2}">
					<li><img src="images/ico06.png"
						style="width: 50px; height: 50px;" />
					<p>
							<a href="${pageContext.request.contextPath}/findNewsByPage.action">查询新闻</a>
						</p></li>
					<li><img src="images/ico02.png"
						style="width: 50px; height: 50px;" />
					<p>
							<a href="${pageContext.request.contextPath}/toAddNews.action">发布新闻</a>
						</p></li>
				</c:when>
			</c:choose>
		</ul>        
    </div>
</body>
</html>
