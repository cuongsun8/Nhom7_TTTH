<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/Fragment/LibImport.jsp" />
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/CTDT/CTDT-do-hoa.css">
</head>
<body>
	<jsp:include page="/WEB-INF/Fragment/Header.jsp" />
	<jsp:include page="/WEB-INF/Fragment/SlideImage.jsp" />
	<div class="container-fluid mt-5 text">
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<p align="center">
					Chương trình học thực tế thông qua các sản phẩm minh họa&nbsp;<strong>trực
						quan, sinh động</strong>. Học viên được học&nbsp;<strong>lý thuyết
						song song với thực hành</strong>&nbsp;tại phòng máy giúp&nbsp;<strong>tiếp
						thu bài nhanh</strong>,&nbsp;<strong>nhớ bài lâu</strong>&nbsp;và&nbsp;<strong>nắm
						vững công cụ</strong>&nbsp;ngay khi kết thúc buổi học. Ngoài ra, với sự
					thay đổi liên tục của công nghệ, chương trình học cũng được <strong>cập
						nhật kiến thức mới thường xuyên</strong> giúp Học viên tạo ra các sản phẩm
					Website thật phù hợp với xu hướng.
				</p>
				<p align="center">
					Bên cạnh sự linh động về giờ giấc học tập, với mỗi khóa khai giảng
					Trung Tâm còn có các&nbsp;<span><strong>chính sách
							ưu đãi</strong></span>&nbsp;đặc biệt lên đến&nbsp;<span><strong>20%
							học phí</strong></span>. Nếu có bất cứ thắc mắc nào về khóa học, đừng ngần ngại
					liên hệ với chúng tôi qua số&nbsp;<span><strong>Hotline:
							0914.251.119</strong></span>&nbsp;để được tư vấn chuyên sâu và giải đáp tận tình
					cho nhu cầu của bạn!
				</p>
			</div>
			<div class="col-lg-1"></div>
		</div>

		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-10 tabpage">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item tab-title"><a class="nav-link active"
						id="home-tab" data-toggle="tab" href="#home" role="tab"
						aria-controls="home" aria-selected="true">Dài hạn</a></li>
					<li class="nav-item tab-title"><a class="nav-link"
						id="profile-tab" data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">Ngắn hạn</a></li>
					<li class="nav-item tab-title"><a class="nav-link"
						id="contact-tab" data-toggle="tab" href="#contact" role="tab"
						aria-controls="contact" aria-selected="false">Đồ họa</a></li>
				</ul>
			</div>
			<div class="col-lg-1"></div>
		</div>

		<div class="row">
			<div class="col-lg-3 col-md-2 col-sm-2 col-1"></div>
			<div class="col-lg-6 col-md-8 col-sm-8 col-10">
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<div class="row">
							<div class="col-12 col-md-4">
								<a href="link"> <img src="/TrungTamTinHoc/Assets/Images/CTDT/daihan_2d.jpg"
									class="avar-image" style="width: 100%; height: 80%;"> <span
									class="caption">Kỹ thuật viên đồ họa 2D</span>
								</a>
							</div>
							<div class="col-12 col-md-4">
								<a href="link"> <img
									src="/TrungTamTinHoc/Assets/Images/CTDT/daihan_2d_nangcao.jpg"
									class="avar-image" style="width: 100%; height: 80%;"> <span
									class="caption">Đồ họa 2D nâng cao</span>
								</a>
							</div>
							<div class="col-12 col-md-4">
								<a href="link"> <img
									src="/TrungTamTinHoc/Assets/Images/CTDT/daihan_phim.jpg" class="avar-image"
									style="width: 100%; height: 80%;"> <span class="caption">3D
										phim quảng cáo</span>
								</a>
							</div>
							<div class="col-12 col-md-4">
								<a href="link"> <img
									src="/TrungTamTinHoc/Assets/Images/CTDT/daihan_motion_graphic.jpg"
									class="avar-image" style="width: 100%; height: 80%;"> <span
									class="caption">Motion graphic 2D</span>
								</a>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="profile" role="tabpanel"
						aria-labelledby="profile-tab">
						<div class="row">
							<div class="col-12  col-md-4">
								<a href="link"><img src="/TrungTamTinHoc/Assets/Images/CTDT/nganhan_web.jpg"
									style="width: 100%; height: 80%;"></a> <span class="caption">Kỹ
									thuật viên đồ họa 2D</span>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="contact" role="tabpanel"
						aria-labelledby="contact-tab">
						<div class="row">
							<div class="col-12  col-md-4">
								<a href="link"><img src="/TrungTamTinHoc/Assets/Images/CTDT/dohoa_game.jpg"
									style="width: 100%; height: 80%;"></a> <span class="caption">Thiết
									kế game</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-2 col-sm-2 col-1"></div>
		</div>

		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-0 col-0"></div>
			<div class="col-lg-10 col-md-10 col-sm-12 col-12 main">
				<hr class="dash">
			</div>
			<div class="col-lg-1 col-md-1 col-sm-0 col-0"></div>
		</div>

		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-0 col-0"></div>
			<div class="col-lg-3 col-md-3 col-sm-4 col-12 main">
				<div class="card">
					<img class="card-img-top" src="/TrungTamTinHoc/Assets/Images/CTDT/ktv_2d.jpg">
				</div>
			</div>
			<div class="col-lg-7 col-md-7 col-sm-8 col-12 news">
				<div>
					<a href="link">KỸ THUẬT VIÊN THIẾT KẾ ĐỒ HỌA 2D</a>
					<div class="nganh-mon-hoc2">
						<ul>
							<li><strong>Đặc biệt:</strong> Khóa học dành cho người mới
								bắt đầu</li>
							<li><strong>Môn học:</strong> Adobe Illustrator, Photoshop
								cơ bản + nâng cao, Indesign</li>
							<li><strong>Hạn ưu đãi:</strong>&nbsp;30/10/2017</li>
						</ul>
					</div>
					<div class="faculty">
						Thời lượng: 6 tháng (120 giờ)
						<p>
							Học phí: <span style="text-decoration: line-through">6.000.000đ</span>
						</p>
						<strong><span style="color: #F00">ƯU ĐÃI:
								5.000.000đ </span></strong>khi đăng ký online
						<p></p>
					</div>
				</div>
				<div class="xem-lich">
					<p>
						<a href="LichKhaiGiang.jsp">Lịch khai giảng</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-lg-1 col-md-1 col-sm-0 col-0"></div>
	</div>
	<jsp:include page="/WEB-INF/Fragment/Footer.jsp" />
</body>
</html>