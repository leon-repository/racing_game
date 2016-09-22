<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/" var="prjroot"></spring:url>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>管理控台</title>
</head>
<body>
<c:if test="${not empty message}">
<div align="center">
    <font color="red">${message}</font>
</div>
</c:if>
<form action="/stake/login" method="post">
<table align="center">
	<tr>
		<td align="right">用户名：</td>
		<td><input type="text" name="userName" /></td>
	</tr>
	<tr>
		<td align="right">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
		<td><input type="password" name="password" /> </td>
	</tr>
	<tr>
		<td align="right"><input type="submit" value="登录" /> </td>
		<td><input type="button" value="重置" onclick="window.location.href='/view/login'" /> </td>
	</tr>
</table>
</form>
</body>
</html>