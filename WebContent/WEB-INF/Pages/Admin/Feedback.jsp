<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<jsp:include page="/WEB-INF/Fragment/LibImport.jsp" />
<link rel="stylesheet"
	href="/TrungTamTinHoc/Styles/Fragment/feedback.css" />
<title>Góp ý</title>
</head>
<body>
	<jsp:include page="/WEB-INF/Fragment/Header.jsp" />
	<div class="container m-3 mx-auto" style="text-align:center;width:90vw;">
		<h1 class="tieu-de-muc mx-auto">Danh sách góp ý</h1>
		<img src="/TrungTamTinHoc/Assets/Images/ngoisao_cam.png" width="250px">
		<table class="table table-striped table-hover">
			<thead class="thead-light">
				<tr>
					<th scope="col" style="text-align: center;">#</th>
					<th scope="col" style="text-align: center;">Tên</th>
					<th scope="col" style="text-align: center;">Email</th>
					<th scope="col" style="text-align: center;">Nội dung</th>
					<th scope="col" style="text-align: center;"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${feedbacks}" var="feedback">
					<tr>
						<th scope="row">${feedback.id}</th>
						<td>${feedback.name}</td>
						<td>${feedback.email}</td>
						<td>${feedback.message}</td>
						<td><a href="feedback?delete=${feedback.id}"
							class="close color-danger feedback-delete"> <span
								aria-hidden="true">&times;</span>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<jsp:include page="/WEB-INF/Fragment/Footer.jsp" />
</body>
</html>