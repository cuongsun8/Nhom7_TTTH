<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="dang-ky-online">
		<a href="dang-ky-mon-hoc"> </a>
	</div>
	<div class="form-parent">
		<form name="contact-form" class="float-form">
			<span class="tieu-de-feedback">Để lại tin nhắn</span>
			<p></p>
			Họ và tên:<br /> <input class="contact-form-area"
				id="ContactForm1_contact-form-name" name="name" size="30" value=""
				type="text" />
			<p></p>
			Email: <span style="color: red;">*</span><br /> <input
				class="contact-form-area" id="ContactForm1_contact-form-email"
				name="email" size="30" value="" type="text" />
			<p></p>
			Nội dung: <span style="color: red;">*</span><br />
			<textarea class="contact-form-area"
				id="ContactForm1_contact-form-email-message" name="email-message"
				cols="25" rows="5"></textarea>
			<p></p>
			<input class="contact-form-button contact-form-button-submit"
				id="ContactForm1_contact-form-submit" value="Gửi" type="button" />
			<p></p>
			<div style="text-align: center; max-width: 222px; width: 100%">
				<p class="contact-form-error-message"
					id="ContactForm1_contact-form-error-message"></p>
				<p class="contact-form-success-message"
					id="ContactForm1_contact-form-success-message"></p>
			</div>
			<div id="quater">
				By <a href="http://localhost:8080/TrungTamTinHoc/Home-page" target="_blank">TTTH eSky™</a>
			</div>
		</form>
	</div>
	<a class="scroll-btn"href=".header" onclick="$('html,body').animate({scrollTop:0},'slow');return false;" style="float:right">
            <i class="fa fa-chevron-up t-trang-chu" style="font-size:16px"></i>
    </a>
</body>
</html>