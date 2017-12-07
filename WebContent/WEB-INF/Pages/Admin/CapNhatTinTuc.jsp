<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/Fragment/LibImport.jsp" />
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/Admin/DanhSachHocVien.css">
<script type="text/javascript">
$(document).ready(function(){
	$(document).on('click', '.btn-xoa', function(){
		window.location.href = "http://localhost:8080/TrungTamTinHoc/admin/update-news?ID=" + $(this).attr('id') + "&action=xoa";
	});
	$(document).on('click', '.btn-sua', function(){
		window.location.href = "http://localhost:8080/TrungTamTinHoc/admin/update-news?ID=" + $(this).attr('id') + "&action=sua";
	});
	if(${message != null}){
		setTimeout(function() {
		alert("${message}");
		}, 1000);
	}
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/Fragment/Header.jsp" />
<div class="container-fluid">
	<div class="row">
			<div class="col-lg-12 blocked">
				<h1 class="mt-3">Danh sách bài viết</h1>
				<img src="/TrungTamTinHoc/Assets/Images/ngoisao_cam.png"> <br>
				<div class="table-bar">
					<h4 class="table-title">Danh sách</h4>
				</div>
				<div class="table-data">
					<div class="table-container">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>ID</th>
									<th>Chủ đề</th>
									<th>Tựa đề</th>
									<th>Nội dung</th>
									<td></td>
									<td></td>
								</tr>
							</thead>
							<tbody>
							<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
							url="jdbc:mysql://localhost:3306/trungtamtinhoc" user="root" 
							password="123456789" />
							<sql:query var="result" dataSource="${db}">Select * from news</sql:query>
							<c:forEach var="item" items="${result.rows}">
								<tr>
									<td scope="row">${item.Id}</td>
									<td>${item.ChuDe}</td>
									<td>${item.TuaDe}</td>
									<td><a href="/TrungTamTinHoc/tin-tuc/${item.Url}">Xem nội dung</a></td>
									<td><button type="button" class="btn-primary btn-dangky btn-sua" id="${item.id}">Sửa</button></td>
									<td><button type="button" class="btn-primary btn-dangky btn-xoa" id="${item.id}">Xóa</button></td>
								</tr></c:forEach>
							</tbody>
						</table>										
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<jsp:include page="/WEB-INF/Fragment/Footer.jsp" />
</body>
</html>