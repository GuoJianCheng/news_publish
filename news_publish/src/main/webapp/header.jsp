<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8");%>
    <!--logo-->
			<div id="logo" class="row">
				<div class="col-md-6 col-xs-6" class="logoI">
					<img src="images/logo.png" style="margin-left: 0px;margin-top: 0px;float:left" />
				</div>
				<div class="col-md-6 col-xs-6">
					<ul>
						<li><a href="login.jsp" target="_blank">登录</a></li>
					</ul>
				</div>
			</div>
			<!--导航条-->
			<div>
				<nav class="navbar navbar-inverse">
				  <div class="container-fluid"  style="background-color: #336699;">
				    <div class="navbar-header">
				      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				      </button>
				    </div>
				    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				      <ul class="nav navbar-nav">
					<li class="active"><a href="index.jsp">首页 <span class="sr-only">(current)</span></a></li>
					<li><a href="${pageContext.request.contextPath}/findNewsByCategoryIdPage.action?newsListCategoryId=1">今日头条</a></li>
				        <li><a href="${pageContext.request.contextPath}/findNewsByCategoryIdPage.action?newsListCategoryId=2">综合资讯</a></li>
				        <li><a href="${pageContext.request.contextPath}/findNewsByCategoryIdPage.action?newsListCategoryId=3">国内新闻</a></li>
				        <li><a href="${pageContext.request.contextPath}/findNewsByCategoryIdPage.action?newsListCategoryId=4">国际新闻</a></li>
				      </ul>
				      <form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/findNewsByKeywordsPage.action" method="post">
				        <div class="form-group">
				          <input type="text" name="keywords" class="form-control" placeholder="输入关键词">
				        </div>
				        <button type="submit" class="btn btn-default">搜索</button>
				      </form>
				    </div>
				  </div>
				</nav>
			</div>