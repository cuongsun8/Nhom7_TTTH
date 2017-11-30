<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/Fragment/LibImport.jsp" />
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/NavBarPage/SignUp.css">
<script src="/TrungTamTinHoc/Scripts/SignUp-validate.js"></script>
<script>
$(document).ready(function(){	
	$('[data-toggle="popover"]').popover();
	if(${usernameCheck} == 0 && ${isChecked} != null){
		usernameInput = $('#username')[0];
		usernameInput.setAttribute('data-content', 'Tên người dùng đã tồn tại!');
		$('#username').popover('show');	
		
		$('#username').val('${returnUsername}');
		$('#email').val('${returnEmail}');
		$('#password').val('${returnPass}');
		$('#confirm-password').val('${returnConfirm}');
		
	}
	if(${emailCheck} == 0 && ${isChecked} != null){
		emailInput = $('#email')[0];
		emailInput.setAttribute('data-content', 'Email đã tồn tại!');	
		$('#email').popover('show');	
		
		$('#username').val('${returnUsername}');
		$('#email').val('${returnEmail}');
		$('#password').val('${returnPass}');
		$('#confirm-password').val('${returnConfirm}');
		
	}
	
});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/Fragment/Header.jsp" />
	<div class="container-fluid bg">
		<div class="row my-auto">
			<div class="col-lg-4 col-md-3 col-sm-2 col-0"></div>			
			<div class="col-lg-4 col-md-6 col-sm-8 col-12 forms my-auto">
				<form class="form-container my-auto" action="dang-ky" method="get">
					<h1>TTTH eSky</h1>
					<div class="form-group">
						<label>Username</label> <input type="text" class="form-control"
							placeholder="Username" data-toggle="popover" data-content="" id="username" name="username">
					</div>
					<div class="form-group">
						<label>Email</label> <input type="email" class="form-control"
							placeholder="Example@gmail.com" data-toggle="popover"
							data-content="" id="email" name="email">
					</div>
					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" placeholder="Password" data-toggle="popover"
							data-content="" id="password" name="password">
					</div>
					<div class="form-group">
						<label>Confirm Password</label> <input type="password"
							class="form-control" placeholder="Confirm Password"
							data-toggle="popover" data-content="" id="confirm-password" name="confirm">
					</div>
					<div class="form-check">
						<label class="form-check-label"> <input type="checkbox"
							class="form-check-input show-pass"> Show pasword
						</label>
					</div>
					<br>
					<button type="submit" class="btn btn-warning btn-block" id="submit-btn" name="signup" value="Sign Up">Sign
						up</button>
					<br> <small class="form-text" style="text-align: center">Already
						a member? <a href="dang-nhap">Sign in!</a>
					</small>
				</form>
			</div>
			<div class="col-lg-4 col-md-3 col-sm-2 col-0"></div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/Fragment/Footer.jsp" />
</body>
</html>