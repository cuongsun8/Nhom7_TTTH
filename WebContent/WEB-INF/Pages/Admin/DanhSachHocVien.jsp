<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		window.location.href = "http://localhost:8080/TrungTamTinHoc/xoa-dang-ky-mon-hoc?ID=" + $(this).attr('id') + "&MaLop=" + ${returnID};
	});
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/Fragment/Header.jsp" />
<div class="container-fluid">
	<div class="row">
			<div class="col-lg-12 blocked">
				<h1 class="mt-3">Danh sách học viên lớp ${returnID}</h1>
				<img src="/TrungTamTinHoc/Assets/Images/ngoisao_cam.png"> <br>
				<div class="table-bar">
					<h4 class="table-title">Ngày khai giảng ${classes[0].ngayKhaiGiang}</h4>
				</div>
				<div class="table-data">
					<div class="table-container">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>ID</th>
									<th>Họ tên</th>
									<th>Email</th>
									<th>SĐT</th>
									<th>Ngày Đăng Ký</th>
									<td></td>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="item" items="${classes}">
								<tr>
									<td scope="row">${item.id}</td>
									<td>${item.tenHV}</td>
									<td>${item.email}</td>
									<td>${item.sdt}</td>
									<td>${item.ngayDangKy}</td>
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