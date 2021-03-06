<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/Fragment/LibImport.jsp"/>
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/Fragment/BannerDKMH.css">
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/SupPage/DangKyMonHoc.css">
<script type="text/javascript" src="/TrungTamTinHoc/Scripts/SupPage/DKMH-validate.js"></script>
<script src="/TrungTamTinHoc/Scripts/jquery.tmpl.min.js" type="text/javascript"></script>
<script type="text/javascript" src = "/TrungTamTinHoc/Scripts/SupPage/DKMH-hieu-ung-va-du-lieu.js">
</script>
<script type="text/javascript">
$(document).ready(function(){
	if(${registerCheck == 0} && ${isChecked != null}){
		$('#hoten').val('${returnHoten}');
		$('#email').val('${returnEmail}');
		$('#dienthoai').val('${returnSdt}');
		$("#doituong option").filter(function() {
		    return this.text == "${returnDoituong}"; 
		}).attr('selected', true);
		$('#ghichu').val('${returnGhichu}');
	}
	setTimeout(function(){
		if(${message != null}){
			alert('${message}');
		}else{
			if(${isChecked != null}){
				alert("Bạn đã đăng ký lớp học này!");
			}
		}
	});
});
</script>
</head>
<body>	
	<jsp:include page="/WEB-INF/Fragment/Header.jsp"/>
	<jsp:include page="/WEB-INF/Fragment/BannerDKMH.jsp"/>
	<div class="row combo-group" id="chon-mon">
		<div class="col-12 monhoc row" style="border: none;">
			<label class="col-sm-3 col-12" style="margin-top: 12px;font-weight:bold;">Môn học: </label>						
			<div class="col-sm-9 col-12">
				<select id="cboMonHoc" class="cboMon" onchange="displayChonLich()"
				data-toggle="popover" data-content=""><option value="0">-- Chọn môn học --</option>
					<!--<optgroup style="background-color: lightblue;"
						label="Kỹ thuật viên Thiết kế Website">
						<option style="background-color: #FFFFFF" value="TKW7">KỸ THUẬT VIÊN THIẾT KẾ WEBSITE</option>
					</optgroup>-->		
				</select>
					<img id="arrowchon" src="/TrungTamTinHoc/Assets/Images/DKMH/arrow.jpg" 
					class="arrowchon">
			</div>
		</div>
	</div>
	
	<div class="row combo-group" id="chon-lich">
		<div id="chonLich1" class="col-md-12 col-sm-12 col-12 lichhoc" style="display: block;">
			<div class="chonlich pl-0">
				<i class="fa fa-chevron-circle-right" aria-hidden="true"
				style="font-size: 1.3em; color: #0099cb;"></i> Chọn Lịch Học
			</div>
			<div id="divLichHoc1" class="tkb row">
				<!-- <div class="col-sm-6 col-12 lblLich mb-4">
						<label>					
							<input type="radio" class="chkLick" id="rbtLich0" name="lichhoc_1" value="DHW1_236S24" title="Thứ 2-4 (08:00 - 11:00)"><span
							class="fa fa-square-o" style="font-size: 18px; width: 20px"></span>	
							Thứ 2-4 (08:00 - 11:00) - KG: 22/11/2017
							<br>																		
						</label>		
						<div>
							<div class="chkLick">192 Hoàng Diệu 2, p.Linh Chiểu, Q.Thủ Đức Tp.HCM</div>
						</div>
				</div> -->
			</div>
		</div>
	</div>


	<div class="thong-tin-hoc-vien">
		<div class="form-dang-ky">
			<div class="row mg10">
				<h2 class="tieu-de">Thông tin cá nhân</h2>
			</div>
			<form action="dang-ky-mon-hoc" method="post" id="DKMH">
			<div class="row mg10">
				<div class="col-lg-1 col-md-0"></div>
				<div class="col-lg-6 col-md-7 form-horizontal form-feild">
					<div class="form-group">
						<label class="control-label col-md-6 col-12"><span>Họ
								và Tên</span> <span style="color: red; position: relative; top: 5px;">*</span></label>
						<div class="col-12">
							<input class="form-control" type="text" id="hoten" name="hoten"
							data-toggle="popover" data-content="">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-6 col-12"><span>Email</span>
							<span style="color: red; position: relative; top: 5px;">*</span></label>
						<div class="col-12">
							<input class="form-control" type="text" id="email" name="email"
							data-toggle="popover" data-content="">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-6 col-12"><span>Số
								điện thoại</span> <span
							style="color: red; position: relative; top: 5px;">*</span></label>
						<div class="col-12">
							<input class="form-control" type="text" id="dienthoai" name="dienthoai"
							data-toggle="popover" data-content="">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-6 col-12">Bạn hiện
							là:</label>
						<div class="col-12">
							<select class="form-control" id="doituong" data-toggle="popover" data-content=""
								style="width: 100%; padding: 5px;"><option value="0">-- Chọn đối tượng --</option>
								<option style="background-color: #FFFFFF" value="1">Sinh viên</option>
								<option style="background-color: #FFFFFF" value="2">Đã tốt nghiệp, đang tìm việc</option>
								<option style="background-color: #FFFFFF" value="3">Đã đi làm</option>
								<option style="background-color: #FFFFFF" value="4">Khác</option></select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-6 col-12">Ghi chú
							khác:</label>
						<div class="col-12">
							<textarea class="form-control" id="ghichu" name="ghichu" rows="4" style="resize: none;"
							data-toggle="popover" data-content=""></textarea>
						</div>
					</div>
					
					<div style="clear: both;"></div>
				</div>
				<div class="col-lg-4 col-md-5">
					<div class="hotline">
						<div>
							<img src="/TrungTamTinHoc/Assets/Images/FormDangKy/hotline.png" alt="">
						</div>
						<div>
							Hotline hỗ trợ<br> <span id="hotline">0914.251.119</span>
						</div>
					</div>
					<div class="hotline">
						<div>Còn</div>
						<div class="row mx-auto">
							<div class="countdown-container" id="dh">
								<div id="CountDownTimer" data-timer="1326024"
									style="width: 140px; margin: auto;"
									data-tc-id="191ff8b5-f257-b61b-5278-60adc4c88d91">
									<div class="time_circles">
										<canvas width="140" height="140" id="myCanvas"></canvas>
										<div class="textDiv_Days"
											style="top: 49px; left: 0px; width: 140px;">
											<span style="font-size: 38px; line-height: 13px;">15</span>
											<h4 style="font-size: 13px; line-height: 13px;">Ngày</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div>Hết hạn ưu đãi</div>
					</div>
				</div>
				<div class="col-lg-1 col-md-0"></div>
			</div>
			<div class="row mg10">
				<div class="form-group col-md-12 col-sm-12 col-xs-12"
						style="padding-right: 30px;">
						<div id="lThongBao" style="color: red; font-size: 1.3em;"></div>
						<span class="hoantat">Hoàn tất
							đăng ký</span>
				</div>
			</div>
			<input class="fade" type="text" id="doituong2" name="doituong">
			<input class="fade" type="text" id="maMH" name="maMH">
			<input class="fade" type="text" id="maLichHoc" name="maLichHoc">
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/Fragment/Footer.jsp" />
</body>
</html>