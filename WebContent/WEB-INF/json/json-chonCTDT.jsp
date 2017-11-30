<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/trungtamtinhoc" user="root"
	password="123" />
<sql:query var="result" dataSource="${db}">Select * from educate_programs</sql:query>
<json:object>
	<json:array name="CTDT" var="row" items="${result.rows}">
		<json:object>
			<json:property name="MaCTDT" value="${row.MaCTDT}" />
			<json:property name="TenCTDT" value="${row.TenCTDT}" />
		</json:object>
	</json:array>
</json:object>