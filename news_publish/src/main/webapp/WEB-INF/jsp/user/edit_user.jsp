<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改用户</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="${pageContext.request.contextPath}/findUserList.action">用户列表</a></li>
    </ul>
    </div>    
    <div class="formbody">    
    <div class="formtitle"><span>修改用户</span></div>
	   <form action="${pageContext.request.contextPath}/editUser.action" name="ff" method="post" onsubmit="return checkValue()"> 
	   <ul class="forminfo">
	   <input id="userId" name="userId" value="${user.userId}" type="hidden" />
    <li><label style="width:150px;">登录账号（<font style="color:Red;font-weight:bolder;">*</font>）：</label><input id="loginName" name="loginName" value="${user.loginName}" type="text" class="dfinput"  readonly="true"/><i>&nbsp;<font style="color:Red;">${checkUserLoginNameMsg}</font></i></li>
    <li><label style="width:150px;">密码（<font style="color:Red;font-weight:bolder;">*</font>）：</label><input id="password" name="password" type="password" class="dfinput" /><i></i></li>
	<li><label style="width:150px;">用户姓名（<font style="color:Red;font-weight:bolder;">*</font>）：</label><input id="userName" name="userName"  value="${user.userName}" type="text" class="dfinput" /><i></i></li>
	<li><label style="width:150px;">电话号码：</label><input id="tel" name="tel"  value="${user.tel}" type="text" class="dfinput" /><i></i></li>
    <li><label style="width:150px;">用户角色（<font style="color:Red;font-weight:bolder;">*</font>）：</label>
	<select name="roleId" id="roleId"  class="dfinput">
						<option value="">--请选择--</option>
						<c:forEach items="${roleList}" var="r">
							<option value="${r.roleId}" <c:if test="${r.roleId eq user.roleId }">selected="selected"</c:if>>${r.roleName }</option>
						</c:forEach>
				</select>	
	<i></i></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认修改"/>
    &nbsp;&nbsp;<input name="" type="button" onclick="goback();"class="btn" value="返回列表"/></li>
    </ul>
    </form>  
    </div>
    <script>
    function goback(){
    	window.location.href="${pageContext.request.contextPath}/findUserList.action";    	
    }
    function checkValue() {		
		str = document.getElementById("password").value;
		if (str.length > 0 && str.length<6) {
			alert("密码长度应大于等于6");
			document.getElementById("password").focus();
			return false;
		}
		/* str = document.getElementById("userName").value;
		if (str.length < 1) {
			alert("请输入用户姓名");
			document.getElementById("userName").focus();
			return false;
		}
		str = document.getElementById("roleId").value;
		if (str == '') {
			alert("请选择用户角色");
			return false;
		} */
		return true;
	}
</script>

	
</body>
</html>
