<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/Fragment/LibImport.jsp"/>
<script>
$(document).ready(function(){
	$('#data-container').append('${content}');
	$('#data-container img').removeAttr("style");
	$('#data-container img').attr('style', 
			`height:auto;
			 max-height:100% !important;
			 max-width: 100% !important;
			 vertical-align: middle;
			 display: block;
			 margin-right: auto;
			 margin-left: auto;
			 padding-top: 10px;
			 padding-right: 10px;
			 padding-left: 10px;
			`);
	
});
</script>
<style>
.tin-tuc .tieu-de-muc{
	font-size: 35px;
    padding: 20px 0px 20px 0px;
    color: #FD6504;
    line-height: 50px;
    text-align: center;
}
.tencungmuc{
	color: #FD6504;
}
.tin-tuc .card-body {
    padding: 1rem;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/Fragment/Header.jsp"/>
	
	<div class="tin-tuc">
		<h1 class="tieu-de-muc">${subject}</h1>
		<div id="data-container" class="mx-auto" style="width:90vw;">	
		</div>	
		<div class="cung-chuyen-muc mx-auto mb-3" style="width:90vw;">
			<h3 class="tencungmuc">
				<a>Tin cùng chuyên mục</a>
			</h3>
			<hr>
			<div class="row">
				<div class="col-md-3 col-sm-6 col-12 sub">
					<div class="card">
						<img class="card-img-top" src="/TrungTamTinHoc/Assets/Images/TinTuc/1.png" title="10 cách thiết kế nội dung hấp dẫn">
						<div class="card-body">
							<a href="#">[<span>Infographic</span>] 10 cách thiết kế
								nội dung hấp dẫn
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 col-12 sub">
					<div class="card">
						<img class="card-img-top" src="/TrungTamTinHoc/Assets/Images/TinTuc/2.png" title="10 năm liên tục là đơn vị đào tọa CNTT xuất sắc">
						<div class="card-body">
							<a href="#">[<span>Tiêu điểm</span>] 10 năm liên tục là
								đơn vị đào tọa CNTT xuất sắc
							</a>
						</div>
					</div>
				</div>						
				<div class="col-md-3 col-sm-6 col-12 sub">
					<div class="card">
						<img class="card-img-top" src="/TrungTamTinHoc/Assets/Images/TinTuc/3.png" title="21 công cụ miễn phí cho thiết kế đồ họa">
						<div class="card-body">
							<a href="#">[<span>Infographic</span>] 21 công cụ miễn phí
								cho thiết kế đồ họa
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 col-12 sub">
					<div class="card">
						<img class="card-img-top" src="/TrungTamTinHoc/Assets/Images/TinTuc/4.png" title="Workshop thiết kế, sáng tạo Web">
						<div class="card-body">
							<a href="#">[<span>Miễn phí</span>] Workshop thiết kế,
								sáng tạo Web
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
<jsp:include page="/WEB-INF/Fragment/Footer.jsp"/>
</body>
</html>