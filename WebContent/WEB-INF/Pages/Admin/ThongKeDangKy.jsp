<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/Fragment/LibImport.jsp" />
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/Admin/ThongKeDangKy.css">
</head>
<script type="text/javascript">
$(document).ready(function(){
	$(document).on('click', '.danh-sach', function(){
		window.location.href = "http://localhost:8080/TrungTamTinHoc/admin/thong-ke-dang-ky/danh-sach-hoc-vien?ID=" + $(this).attr('id');
	});
	$(document).on('click', '.btn-xoa', function(){
		window.location.href = "http://localhost:8080/TrungTamTinHoc/admin/xoa-lop?ID=" + $(this).attr('id');
	});
});
</script>
<body>
<jsp:include page="/WEB-INF/Fragment/Header.jsp" />
<div class="container-fluid">
	<div class="row">
			<div class="col-lg-12 blocked">
				<h1 class="mt-3">Danh sách học viên từng lớp học</h1>
				<img src="/TrungTamTinHoc/Assets/Images/ngoisao_cam.png"> <br>
				<c:forEach var="item" items="${classes}" varStatus="loop">
						<div class="table-bar">
							<h4 class="table-title">${classes[loop.index][0].tenMH}</h4>
						</div>
						<div class="table-data">
							<div class="table-container">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Lớp</th>
											<th>Thời gian</th>
											<th>Ngày khai giảng</th>
											<th>Địa điểm</th>
											<td></td>
											<td></td>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="information" items="${classes[loop.index]}" varStatus="indexer">
										<tr>
											<td scope="row">${classes[loop.index][indexer.index].maLop}</td>
											<td>${classes[loop.index][indexer.index].thoiGian}</td>
											<td>${classes[loop.index][indexer.index].ngayKhaiGiang}</td>
											<td>${classes[loop.index][indexer.index].diaDiem}</td>
											<td><button type="button" class="btn-primary btn-dangky danh-sach" id="${classes[loop.index][indexer.index].maLichHoc}">Danh sách</button></td>
											<td><button type="button" class="btn-primary btn-dangky btn-xoa" id="${classes[loop.index][indexer.index].maLichHoc}">Xóa</button></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>										
							</div>
						</div>
						<br>
				</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/Fragment/Footer.jsp" />
</body>
</html>