<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/Fragment/LibImport.jsp" />
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/NavBarPage/InfoPage.css">
</head>
<body>
	<jsp:include page="/WEB-INF/Fragment/Header.jsp"/>
	<div class="container-fluid mt-2">
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-0 col-0"></div>
			<%Random rand = new Random();
			int  n = rand.nextInt(4) + 1;
			request.setAttribute("random", n);%>
			<div class="col-lg-5 col-md-5 col-sm-12 col-12 main">
				<div class="card">
				<c:forEach var="item" items="${listNews}" varStatus="loop">
				<c:if test = "${loop.index == random}">
					<img class="card-img-top" src="${item.image}">
					<div class="card-body">
						<a href="/TrungTamTinHoc/tin-tuc/${item.url}">[<span>${item.chude}</span>]${item.tieude}
						</a> <br>
						<p class="card-text">${item.discription}</p>
					</div>
				</c:if>
				</c:forEach>
				</div>
			</div>
			<div class="col-lg-5 col-md-5 col-sm-12 col-12">
				<div class="row">
				<c:forEach var="item" items="${listNews}" varStatus="loop">
				<c:if test = "${loop.index != random && loop.index < 5}">
					<div class="col-lg-6 col-md-6 col-sm-6 col-12 sub">
						<div class="card">
							<img class="card-img-top" src="${item.image}">
							<div class="card-body">
								<a href="/TrungTamTinHoc/tin-tuc/${item.url}">[<span>${item.chude}</span>]${item.tieude}
								</a>
							</div>
						</div>
					</div>
				</c:if>
				</c:forEach>					
				</div>
			</div>
			<div class="col-lg-1 col-md-1 col-sm-0 col-0"></div>
		</div>

		<c:forEach var="item" items="${listNews}" varStatus="loop">
		<c:if test = "${loop.index != random && loop.index >= 5}">		
			<div class="row">
				<div class="col-lg-1 col-md-1 col-sm-0 col-0"></div>
				
				<div class="col-lg-10 col-md-10 col-sm-12 col-12 main">
					<hr class="dash">
				</div>
				<div class="col-lg-1 col-md-1 col-sm-0 col-0"></div>
			</div>
	
			<div class="row">
				<div class="col-lg-1 col-md-1 col-sm-0 col-0"></div>
				<div class="col-lg-3 col-md-5 col-sm-6 col-6 main">
					<div class="card">
						<img class="card-img-top" src="${item.image}">
					</div>
				</div>
				<div class="col-lg-7 col-md-5 col-sm-6 col-6 news">
					<a href="/TrungTamTinHoc/tin-tuc/${item.url}">${item.tieude}</a>
					<p class="news-text">${item.discription}</p>
					<div class="direct">
						<p style="text-align: right">
							<a href="/TrungTamTinHoc/tin-tuc/${item.url}" style="color: #f49b42;">Xem tiếp</a>
						</p>
					</div>
				</div>
				<div class="col-lg-1 col-md-1 col-sm-0 col-0"></div>
			</div>
		</c:if>
		</c:forEach>
		
		<!-- <div class="row">
			<div class="col-lg-1 col-md-1 col-sm-0 col-0"></div>
			<div class="col-lg-10 col-md-10 col-sm-12 col-12 main">
				<hr class="dash">
			</div>
			<div class="col-lg-1 col-md-1 col-sm-0 col-0"></div>
		</div>

		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-0 col-0"></div>
			<div class="col-lg-3 col-md-5 col-sm-6 col-6 main">
				<div class="card">
					<img class="card-img-top" src="/TrungTamTinHoc/Assets/Images/TinTuc/2-khai-giang.png">
				</div>
			</div>
			<div class="col-lg-7 col-md-5 col-sm-6 col-6 news">
				<a href="#">Trung tâm tin học tổng khai giảng các khóa hè</a>
				<p class="news-text">Ngày 28/07/2017, Trung Tâm Tin Học Tổng
					khai giảng các khóa học Lập trình viên, Kỹ thuật viên và các lớp
					chuyên đề với lịch học Sáng – chiều – tối và cuối tuần.</p>
				<div class="direct">
					<p style="text-align: right">
						<a href="#" style="color: #f49b42;">Xem tiếp</a>
					</p>
				</div>
			</div>
			<div class="col-lg-1 col-md-1 col-sm-0 col-0"></div>
		</div> -->
		<nav class="page-nagivation">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						<span class="sr-only">Previous</span>
				</a></li>
				<li class="page-item active"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
						class="sr-only">Next</span>
				</a></li>
			</ul>
		</nav>
	</div>
	<jsp:include page="/WEB-INF/Fragment/Footer.jsp" />
</body>




















</html>