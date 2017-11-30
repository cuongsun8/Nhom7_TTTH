<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/LichKhaiGiang/LichKhaiGiang.css">
<jsp:include page="/WEB-INF/Fragment/LibImport.jsp" />
<script>
$(document).ready(function(){
	$('.btn-dangky').click(function(event){
		window.location.href = "http://localhost:8080/TrungTamTinHoc/tam-hoan-dang-ky-mon-hoc-online";
	});
});	
</script>
</head>
<body>
<jsp:include page="/WEB-INF/Fragment/Header.jsp"/>
<jsp:include page="/WEB-INF/Fragment/SlideImage.jsp"/>
	<div class="container-fluid mt-4">
		<div class="row">
			<div class="col-lg-12 blocked">
				<h1 style="color: #FD6504">Thông tin ưu đãi học phí</h1>
				<img src="/TrungTamTinHoc/Assets/Images/ngoisao_cam.png"> <br> 
				<strong style="font-size: 1.5rem; color: red;">Chính
					sách ưu đãi k 253</strong>
				<p>
					<span style="">Giảm</span> <font color="#ff0000"
						style="font-size: 18px;"> <b> 100.000đ </b>
					</font> <font style="font-size: 18px;"> khi đăng ký online lớp <strong>Tin
							học văn phòng chuẩn quốc tế MOS</strong>
					</font>
				</p>
				<h3 class="note">
					<strong>Lưu ý:</strong>
				</h3>
				<h3 style="color: #1687c5;">
					Thời hạn cuối cùng được nhận ưu đãi đến hết ngày <strong
						style="color: #FD6504">30/12/2017</strong>
				</h3>
				<h3 style="color: #1687c5">
					** <strong> Học trực tiếp trên máy - 1 học viên/máy - Học
						phí đã bao gồm giáo trình, lệ phí thi và cấp chứng chỉ </strong> **
				</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 blocked">
				<h1>Lịch khai giảng</h1>
				<img src="/TrungTamTinHoc/Assets/Images/ngoisao_cam.png"> <br>
				<div class="table-bar">
					<h4 class="table-title">Luyện Thi Chứng chỉ Ứng Dụng CNTT Cơ
						bản</h4>
				</div>
				<div class="table-data">
					<div class="link">
						<a href="#">Luyện Thi Chứng chỉ Ứng Dụng CNTT Cơ bản<span>
								- 14 tiết</span>
						</a>
					</div>
					<div class="paid">Học phí : 500.000 đ</div>
					<div class="faculty">
						<p>
							<strong>(cấp Chứng chỉ ỨNG DỤNG CNTT CƠ BẢN của Bộ GDĐT
								thay cho Chứng chỉ ABC theo Thông tư liên tịch số
								17/2016/TTLT-BGDĐT-BTTTT)</strong>
						</p>
						<p>
							<em>Điều kiện học: HV đã có Chứng chỉ A hoặc phải đạt trình
								độ tương đương Chứng chỉ A</em>
						</p>
					</div>

					<div class="table-container">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>Lớp</th>
									<th>Thời gian</th>
									<th>Ngày khai giảng</th>
									<th>Địa điểm</th>
									<td></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td scope="row">1</td>
									<td>Thứ 2-4-6 (13:30 - 17:00) (03 buổi)</td>
									<td>01/11/2017</td>
									<td>227 Nguyễn Văn Cừ, Q.5</td>
									<td><button type="button" class="btn-primary btn-dangky">Đăng ký</button></td>
								</tr>
								<tr>
									<td scope="row">2</td>
									<td>Thứ 2-4-6 (13:30 - 17:00) (03 buổi)</td>
									<td>01/11/2017</td>
									<td>227 Nguyễn Văn Cừ, Q.5</td>
									<td><button type="button" class="btn-primary btn-dangky">Đăng ký</button></td>
								</tr>
								<tr>
									<td scope="row">3</td>
									<td>Thứ 2-4-6 (13:30 - 17:00) (03 buổi)</td>
									<td>01/11/2017</td>
									<td>227 Nguyễn Văn Cừ, Q.5</td>
									<td><button type="button" class="btn-primary btn-dangky">Đăng ký</button></td>
								</tr>
							</tbody>
						</table>										
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/Fragment/Footer.jsp"/>
</body>
</html>