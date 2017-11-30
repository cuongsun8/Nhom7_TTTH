<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/trungtamtinhoc" user="root"
	password="123" />
<c:if test="${not empty param.id }">
	<sql:query var="result" dataSource="${db}">Select * from subjects where MaCTDT = ${param.id}</sql:query>
	<json:object>
		<json:array name="CTDT" var="row" items="${result.rows}">
			<json:object>
				<json:property name="MaMH" value="${row.MaMH}" />
				<json:property name="TenMH" value="${row.TenMH}" />			
			</json:object>
		</json:array>
	</json:object>
</c:if>