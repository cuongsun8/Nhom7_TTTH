<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/trungtamtinhoc" user="root"
	password="123456789" />
<sql:query var="news" dataSource="${db}" maxRows="5">select * from news</sql:query>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/Fragment/LibImport.jsp"/>
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/Fragment/Map.css">
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/NavBarPage/Home.css">
</head>
<body>
	<jsp:include page="/WEB-INF/Fragment/Header.jsp" />
	<jsp:include page="/WEB-INF/Fragment/SlideImage.jsp" />
	<div id="gioi-thieu" class="container-fluid gioi-thieu"
		style="text-align: center; background-color: #f7fbfe">
		<div class="tieu-de-thong-ke mt-3">Cám ơn các bạn đã tin tưởng
			và đồng hành cùng chúng tôi</div>
		<div class="container group-thong-ke mt-3">
			<div class="row">
				<div class="col-5 col-sm-6 col-md-3" style="margin-bottom: 20px;">
					<div class="so-lieu">
						<span>&gt;</span> 30
					</div>
					<div class="noi-dung-thong-ke">năm</div>
				</div>
				<div class="col-7 col-sm-6 col-md-3" style="margin-bottom: 20px;">
					<div class="so-lieu">
						<span>&gt;</span> 1.000.000
					</div>
					<div class="noi-dung-thong-ke">học viên</div>
				</div>
				<div class="col-5 col-sm-6 col-md-3" style="margin-bottom: 20px;">
					<div class="so-lieu">
						<span>&gt;</span> 20
					</div>
					<div class="noi-dung-thong-ke">cơ sở khắp cả nước</div>
				</div>
				<div class="col-7 col-sm-6 col-md-3" style="margin-bottom: 20px;">
					<div class="so-lieu">
						<span>&gt;</span> 100
					</div>
					<div class="noi-dung-thong-ke">chương trình đào tạo</div>
				</div>
			</div>
		</div>
		<p>&nbsp;</p>
	</div>

	<div id="chuong-trinh-dao-tao" class="container"
		style="text-align: center">
		<h1 class="tieu-de-muc">Chương trình đào tạo</h1>
		<img src="/TrungTamTinHoc/Assets/Images/ngoisao_cam.png" width="250px">
	</div>

	<div class="khung align-items-center">
		<div class="container noi-dung-chinh">
			<div class="row align-items-center">
				<div class="col-sm-1"></div>
				<div class="row my-5 main-div">
					<div class="col-sm-1"></div>
					<c:forEach var="item" items="${ctdt}" varStatus="loop">
					<div class="col-6 col-sm-2 canh-noi-dung"
						style="background-color: ${color[loop.index]};">
						<a href="${item.url}"> <span class="nganh">
								<span class="title">${item.tenCTDT}<br> <img
									src="${item.image}"
									class="bieu-tuong">
							</span>
						</span>
						</a>					
					</div>
					<c:if test="${loop.index == 4 }">
							<div class="col-sm-1" id="padding"></div>
							<div class="col-sm-1" id="padding"></div>
						</c:if>
					</c:forEach>
					<!-- <div class="col-6 col-sm-2 canh-noi-dung"
						style="background-color: #E65527;">
						<a href="thiet-ke-website"> <span class="nganh"> <span
								class="title">Thiết kế website<br> <img
									src="/TrungTamTinHoc/Assets/Images/Home/thiet_ke_website.png"
									class="bieu-tuong">
							</span>
						</span>
						</a>
					</div>
					<div class="col-6 col-sm-2 canh-noi-dung"
						style="background-color: #37A5B3;">
						<a href="lap-trinh-va-csdl"> <span class="nganh"> <span
								class="title">Lập trình và CSDL<br> <img
									src="/TrungTamTinHoc/Assets/Images/Home/Lap_trinh_va_CSDL.png"
									class="bieu-tuong">
							</span>
						</span>
						</a>
					</div>
					<div class="col-6 col-sm-2 canh-noi-dung"
						style="background-color: #363948;">
						<a href="lap-trinh-di-dong"> <span class="nganh"> <span
								class="title">Lập trình di động<br> <img
									src="/TrungTamTinHoc/Assets/Images/Home/Lap_trinh_di_dong.png"
									class="bieu-tuong">
							</span>
						</span>
						</a>
					</div>
					<div class="col-6 col-sm-2 canh-noi-dung"
						style="background-color: #716F84;">
						<a href="kiem-thu-phan-mem"> <span class="nganh"> <span
								class="title">Kiểm thử phần mềm<br> <img
									src="/TrungTamTinHoc/Assets/Images/Home/Kiem_thu_phan_mem.png"
									class="bieu-tuong">
							</span>
						</span>
						</a>
					</div>

					<div class="col-sm-1" id="padding"></div>

					<div class="col-sm-1" id="padding"></div>

					<div class="col-6 col-sm-2 canh-noi-dung"
						style="background-color: #D5BC3A;">
						<a href="mang-may-tinh"> <span class="nganh"> <span
								class="title">Mạng máy tính<br> <img
									src="/TrungTamTinHoc/Assets/Images/Home/Mang_may_tinh.png" class="bieu-tuong">
							</span>
						</span>
						</a>
					</div>
					<div class="col-6 col-sm-2 canh-noi-dung"
						style="background-color: #5EA07F;">
						<a href="internet-marketing"> <span class="nganh"> <span
								class="title">Internet Marketing<br> <img
									src="/TrungTamTinHoc/Assets/Images/Home/Internet_Marketing.png"
									class="bieu-tuong">
							</span>
						</span>
						</a>
					</div>
					<div class="col-6 col-sm-2 canh-noi-dung" class="nganh"
						style="background-color: #1D6285;">
						<a href="http://prokids.t3h.vn" target="_blank"> <span>
								<span class="title">Lập trình cho trẻ em<br> <img
									src="/TrungTamTinHoc/Assets/Images/Home/logo-prokids.png" class="bieu-tuong">
							</span>
						</span>
						</a>
					</div>
					<div class="col-6 col-sm-2 canh-noi-dung"
						style="background-color: #86B3BB;">
						<a href="tin-hoc-van-phong"> <span class="nganh"> <span
								class="title">Tin học văn phòng <br> <img
									src="/TrungTamTinHoc/Assets/Images/Home/Tin_hoc_van_phong.png"
									class="bieu-tuong">
							</span>
						</span>
						</a>
					</div>
					<div class="col-6 col-sm-2 canh-noi-dung"
						style="background-color: #CA58D2;">
						<a href="thvp-chuan-quoc-te-mos"> <span class="nganh">
								<span class="title">Tin học văn phòng (MOS)<br> <img
									src="/TrungTamTinHoc/Assets/Images/Home/Chung_chi_MOS.png" class="bieu-tuong">
							</span>
						</span>
						</a>
					</div> -->
					<div class="col-sm-1"></div>
				</div>
			</div>
		</div>
	</div>

	<div id="tin-tuc-su-kien" class="container" style="text-align: center">
		<h1 class="tieu-de-muc mt-3">Tin tức sự kiện</h1>
		<img src="/TrungTamTinHoc/Assets/Images/ngoisao_cam.png" width="250px">
	</div>
	<div class="row tin-tuc justify-content-center">
		<div class="col-lg-5 col-md-5 col-sm-12 col-12 main">
			<div class="card">
				<img class="card-img-top" src="${news.rows[0].Image}">
				<div class="card-body">
					<a href="tin-tuc/${news.rows[0].Url}">[${news.rows[0].ChuDe}] ${news.rows[0].TuaDe} </a> <br>
					<p class="card-text">${news.rows[0].Description}</p>
				</div>
			</div>
		</div>
		<div class="col-lg-5 col-md-5 col-sm-12 col-12">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-12 sub">
					<div class="card">
						<img class="card-img-top" src="${news.rows[1].Image}">
						<div class="card-body">
							<a href="tin-tuc/${news.rows[1].Url}">[${news.rows[1].ChuDe}] ${news.rows[1].TuaDe} </a>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-12 sub">
					<div class="card">
						<img class="card-img-top" src="${news.rows[2].Image}">
						<div class="card-body">
							<a href="tin-tuc/${news.rows[2].Url}">[${news.rows[2].ChuDe}] ${news.rows[2].TuaDe} </a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-12 sub">
					<div class="card">
						<img class="card-img-top" src="${news.rows[3].Image}">
						<div class="card-body">
							<a href="tin-tuc/${news.rows[3].Url}">[${news.rows[3].ChuDe}] ${news.rows[3].TuaDe} </a>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-12 sub">
					<div class="card">
						<img class="card-img-top" src="${news.rows[4].Image}">
						<div class="card-body">
							<a href="tin-tuc/${news.rows[4].Url}">[${news.rows[4].ChuDe}] ${news.rows[4].TuaDe} </a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="lien-he" class="container" style="text-align: center">
		<h1 class="tieu-de-muc mt-3">Liên hệ</h1>
		<img src="/TrungTamTinHoc/Assets/Images/ngoisao_cam.png" width="250px">
	</div>
	
	<jsp:include page="/WEB-INF/Fragment/Map.jsp" />
	<jsp:include page="/WEB-INF/Fragment/Footer.jsp" />
</body>
</html>










