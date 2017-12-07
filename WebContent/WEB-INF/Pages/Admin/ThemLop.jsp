<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thêm lớp</title>
<jsp:include page="/WEB-INF/Fragment/LibImport.jsp" />
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/Admin/ThemLop.css">
</head>
<body>
	<jsp:include page="/WEB-INF/Fragment/Header.jsp"/>
	<div class="container-fluid tl">
		<div class="row">
			<div class="col-lg-4 col-md-3 col-sm-2 col-12"></div>
			<div class="col-lg-4 col-md-6 col-sm-8 col-12 my-auto">
				<form class="form-container my-auto" action="them-lop" method="post">
					<h1>Thêm lớp</h1>
					<div class="form-group">
						<label>Môn học</label> 
						<select name="mamonhoc" data-toggle="popover" data-content="">
							<c:forEach  items="${monhoc}" var="tenmonhoc">
								<option value="${tenmonhoc.maMonHoc}">${tenmonhoc.tenMonHoc} </option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label>Ngày Khai Giảng</label>
						<input type="date" class="form-control" placeholder="Password"
						data-toggle="popover" data-content="" id="ngaykhaigiang" name="ngaykhaigiang">
					</div>
					<div class="form-group">
						<label>Thời gian</label>
						<select name="thoigian">
							<option>Chủ Nhật (08:00 - 11:00) và (13:30 - 16:45)</option>
							<option>Thứ 2-4 (08:00 - 11:00) </option>
							<option>Thứ 2-4 (13:00 - 16:00) </option>
							<option>Thứ 3-7 (08:00 - 11:00)</option>
							<option> Thứ 4-7 (08:00 - 11:00) </option>
							<option> Thứ 5-7 (08:00 - 11:00) </option>
						</select>
					</div>
					<div class="form-group">
						<label>Địa điểm</label>
						<select name="diadiem">
						<option> 192 Hoàng Diệu, p.Linh Chiểu, Q.Thủ Đức </option>
						<option> Số 1, Võ Văn Ngân, Thủ Đức</option>
						<option> 255 Hoàng Diệu 2, p.Linh Chiểu,</option>
					</select>
					</div>
					<br>
					<button type="submit" class="btn btn-success btn-block" id="submit-btn" name="login" value=" themlop">Thêm Lớp</button>
					<br>					 
				</form>
			</div>
			<div class="col-lg-4 col-md-3 col-sm-2 col-12"></div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/Fragment/Footer.jsp" />
</body>
</html>