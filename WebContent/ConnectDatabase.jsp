<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/trungtamtinhoc" 
	user="root" password="123"/>
	<sql:query var="rs" dataSource="${db}">select * from monhoc</sql:query>
	
	<c:forEach items="${rs.rows}" var="mh">
		<c:out value="${mh.MaMH}"></c:out>:
		<c:out value="${mh.TenMH}"></c:out>:
		<c:out value="${mh.MaCTDT}"></c:out>
	</c:forEach>
</body>
</html>