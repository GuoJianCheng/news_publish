<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>top.jsp</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
</head>
<body style="background:url(images/topbg.gif) repeat-x;">
    <div class="topleft">
    <a href="main.jsp" target="_parent"><img src="images/logo22.png" title="系统首页" /></a>
    </div>        
    <ul class="nav">   
    </ul>            
    <div class="topright">    
    <ul>
    <li><span><img src="images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li><a href="#" onclick="logout();">退出</a></li>
    </ul>
     
    <div class="user">
    <span>${sessionScope.login_user.userName }</span>
    </div>    
    
    </div>
    
    
     <script type="text/javascript">
		function logout(){
			if(window.confirm("您确定要退出吗？"))
			{
			   top.location.href="${pageContext.request.contextPath}/logout.action";
			 }else{
				 return false;
			 }
		}
	</script>
</body>
</html>
