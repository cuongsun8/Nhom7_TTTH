<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Đăng nhập</title>
<jsp:include page="/WEB-INF/Fragment/LibImport.jsp" />
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/NavBarPage/SignIn.css">
<script src="/TrungTamTinHoc/Scripts/SignIn-Validate.js"></script>
<script>
	$(document).ready(function(){	
		$('[data-toggle="popover"]').popover();
		if(${usernameCheck} == 0 && ${isChecked} != null){
			usernameInput = $('#username')[0];
			usernameInput.setAttribute('data-content', 'Tên người dùng hoặc email không tồn tại!');
			$('#username').popover('show');	
			
			$('#username').val('${returnUsername}');
			$('#password').val('${returnPass}');

		}
		else{
			if(${passwordCheck} == 0 && ${isChecked} != null){
				passwordInput = $('#password')[0];
				passwordInput.setAttribute('data-content', 'Mật khẩu nhập vào chưa đúng!');	
				$('#password').popover('show');	
				
				$('#username').val('${returnUsername}');
				$('#password').val('${returnPass}');
			}
			else{
				$('#username').val('${returnUsername}');
				$('#password').val('${returnPass}');
			}
		}
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/Fragment/Header.jsp"/>
	<div class="container-fluid bg">
		<div class="row">
			<div class="col-lg-4 col-md-3 col-sm-2 col-12"></div>
			<div class="col-lg-4 col-md-6 col-sm-8 col-12 my-auto">
				<form class="form-container my-auto" action="dang-nhap" method="post">
					<h1>TTTH eSky</h1>
					<div class="form-group">
						<label>Username or email</label> 
						<input type="text" class="form-control" placeholder="User name or email"
						data-toggle="popover" data-content="" id="username" name="username">
						<small class="form-text">We'll never share your email with anyone else. </small>
					</div>
					<div class="form-group">
						<label>Password</label>
						<input type="password" class="form-control" placeholder="Password"
						data-toggle="popover" data-content="" id="password" name="password">
					</div>
					<div class="form-check">
						<label class="form-check-label"> <input type="checkbox"
							class="form-check-input"> Remember me
						</label>
					</div>
					<br>
					<button type="submit" class="btn btn-success btn-block" id="submit-btn" name="login" value="Sign In">Sign In</button>
					<br>
					<small class="form-text" style="text-align:center">Don't have an account? <a href="dang-ky">Sign up now!</a></small>					 
				</form>
			</div>
			<div class="col-lg-4 col-md-3 col-sm-2 col-12"></div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/Fragment/Footer.jsp" />
</body>
</html>